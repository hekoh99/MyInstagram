export default {
  Mutation: {
    CreateAccount: (parent, args, context, info) => {
      const { nickname, email, firstname, lastname } = args;
      const user = context.prisma.user.create({
        data: { nickname, email, firstname, lastname },
      });
      return user;
    },
  },
};
