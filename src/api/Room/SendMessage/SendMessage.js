import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    SendMessage: async (_, args, context) => {
      isAuthenticated(context.req);
      const { text, to } = args;
      let roomId = args.roomId;
      const { user } = context.req;
      if (to === user.id) {
        throw Error("cannot send message to self");
      }
      if (roomId === undefined) {
        const findRoom = await context.prisma.room.findMany({
          where: {
            AND: [
              {
                participants: {
                  some: { id: user.id },
                },
              },
              {
                participants: {
                  some: { id: to },
                },
              },
            ],
          },
        });
        if (findRoom.length !== 0) {
          // 이미 둘이 대화한 방이 있다면 해당 방의 아이디를 roomId로 사용
          roomId = findRoom[0].id;
        } else {
          roomId = -1; // 없으면 새로운 방을 만들기 위해 무효한 숫자값을 넣음.
        }
      }
      try {
        // 해당 room id를 가진 room의 참여자가 본인과 상대방이 맞는 지 확인
        const check = await context.prisma.room
          .findUnique({ where: { id: roomId } })
          .participants();
        if (
          roomId !== -1 &&
          (check === null ||
            check.map((a) => a.id).indexOf(user.id) === -1 ||
            check.map((a) => a.id).indexOf(to) === -1)
        ) {
          throw Error("wrong room id");
        }
      } catch (err) {
        console.log(err);
        return null;
      }
      const msg = await context.prisma.message.create({
        data: {
          text,
          from: { connect: { id: user.id } },
          room: {
            connectOrCreate: {
              where: { id: roomId },
              create: {
                participants: { connect: [{ id: user.id }, { id: to }] },
              },
            },
          },
        },
      });
      await context.pubsub.publish("sendChat", {
        GetMessage: { ...msg, to },
      });
      return msg;
    },
  },
};
