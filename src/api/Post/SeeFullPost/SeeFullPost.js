import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeFullPost: async (_, args, context) => {
      isAuthenticated(context.req);
      const { id } = args;
      const content = await context.prisma.post.findUnique({
        where: { id },
        include: {
          comments: { include: { user: true } },
          author: true,
          files: true,
        },
      });

      return {
        post: content,
        files: content.files,
        comments: content.comments,
      };
    },
  },
};
