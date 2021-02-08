import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeRoom: async (_, args, context) => {
      isAuthenticated(context.req);
      const { id } = args;
      const { user } = context.req;
      const canSee = await context.prisma.room.findMany({
        where: {
          AND: [
            { id },
            {
              participants: {
                some: {
                  id: user.id,
                },
              },
            },
          ],
        },
      });
      if (canSee[0]) {
        return context.prisma.room.findUnique({
          where: {
            id,
          },
          include: {
            messages: {
              include: { from: true },
              orderBy: {
                createdAt: "desc",
              },
            },
            participants: true,
          },
        });
      } else {
        throw Error("you are not a participant of this room");
      }
    },
  },
};
