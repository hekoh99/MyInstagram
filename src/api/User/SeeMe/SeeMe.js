import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeMe: async (_, args, context) => {
      isAuthenticated(context.req);
      const user = context.req.user;
      return context.prisma.user.findUnique({
        where: { id: user.id },
        include: { posts: true },
      });
    },
  },
};
