export default {
  Query: {
    UserById: async (parent, args, context) => {
      const { id } = args;
      return await context.prisma.user.findOne({
        where: {
          id,
        },
      });
    },
  },
};
