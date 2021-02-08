import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeUser: async (_, args, context) => {
      isAuthenticated(context.req);
      const { id } = args;
      return context.prisma.user.findUnique({
        where: { id },
        include: { posts: true },
      });
    },
  },
};
