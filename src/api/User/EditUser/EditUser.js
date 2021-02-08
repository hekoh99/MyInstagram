import { isAuthenticated } from "../../../middlewares";

export default {
  Mutation: {
    EditUser: async (_, args, context) => {
      isAuthenticated(context.req);
      const { nickname, firstname, lastname } = args;
      const thisUser = context.req.user;
      return context.prisma.user.update({
        where: { id: thisUser.id },
        data: { nickname, firstname, lastname },
      });
    },
  },
};
