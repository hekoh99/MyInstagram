import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    ToggleLike: async (_, args, context) => {
      isAuthenticated(context.req); // graphql middleware
      const { postId } = args;
      const thisUser = context.req.user;
      try {
        const existingLike = await context.prisma.post
          .findUnique({
            where: { id: postId },
          })
          .likes({ where: { user: { id: thisUser.id } } });
        if (existingLike.length != 0) {
          console.log("delete like process");
          await context.prisma.likeb.deleteMany({
            where: {
              AND: [
                {
                  user: {
                    id: thisUser.id,
                  },
                },
                {
                  post: {
                    id: postId,
                  },
                },
              ],
            },
          });
        } else {
          await context.prisma.likeb.create({
            data: {
              user: { connect: { id: thisUser.id } },
              post: { connect: { id: postId } },
            },
          });
        }
        return true;
      } catch (error) {
        console.log(error);
        return false;
      }
    },
  },
};
