export default {
  Mutation: {
    CreateAccount: async (parent, args, context, info) => {
      const { nickname, email, firstname, lastname } = args;
      try {
        await context.prisma.user.create({
          data: { nickname, email, firstname, lastname },
        });
        return true;
      } catch (error) {
        console.log(error);
        return false;
      }
    },
  },
};
