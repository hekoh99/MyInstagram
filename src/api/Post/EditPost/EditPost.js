import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    EditPost: async (_, args, context) => {
      isAuthenticated(context.req);
      const { id, caption, action } = args;
      const { user } = context.req;
      const post = await context.prisma.post.findUnique({
        where: { id },
        include: { author: true },
      });
      if (post.author.id === user.id) {
        if (action === "EDIT") {
          return context.prisma.post.update({
            where: { id },
            data: { caption },
          });
        } else if (action === "DELETE") {
          return context.prisma.$queryRaw(`delete from post where id = ${id}`);
        }
      } else {
        throw Error("can only edit your own post");
      }
    },
  },
};
