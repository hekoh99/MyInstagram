import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    AddComment: async (_, args, context) => {
      isAuthenticated(context.req); // graphql middleware
      const { text, postId } = args;
      const newComment = await context.prisma.comment.create({
        data: {
          text: text,
          user: { connect: { id: context.req.user.id } },
          post: { connect: { id: postId } },
        },
      });
      return newComment;
    },
  },
};
