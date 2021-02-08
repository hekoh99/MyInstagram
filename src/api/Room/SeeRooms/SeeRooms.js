import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeRooms: async (_, args, context) => {
      isAuthenticated(context.req);
      const { user } = context.req;
      return context.prisma.room.findMany({
        where: { participants: { some: { id: user.id } } },
        include: { participants: true },
        orderBy: [
          {
            updatedAt: "desc",
          },
          {
            createdAt: "desc",
          },
        ],
      });
    },
  },
};
