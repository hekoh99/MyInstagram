import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    Upload: async (_, args, context) => {
      isAuthenticated(context.req);
      const { user } = context.req;
      const { caption, files } = args;
      const post = await context.prisma.post.create({
        data: { caption, author: { connect: { id: user.id } } },
      });
      if (files) {
        files.forEach(
          async (file) =>
            await context.prisma.file.create({
              data: { url: file, post: { connect: { id: post.id } } },
            })
        );
      }

      return post;
    },
  },
};
