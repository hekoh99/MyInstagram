import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    ToggleFollow: async (_, args, context) => {
      isAuthenticated(context.req);
      const targetId = args.id;
      const thisUser = context.req.user;
      const status = await context.prisma.user
        .findUnique({
          where: {
            id: thisUser.id,
          },
        })
        .following({ where: { id: targetId } });
      try {
        if (status.length === 0) {
          await context.prisma.user.update({
            where: { id: thisUser.id },
            data: { following: { connect: { id: targetId } } },
          });
        } else {
          await context.prisma.user.update({
            where: { id: thisUser.id },
            data: { following: { disconnect: { id: targetId } } },
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
