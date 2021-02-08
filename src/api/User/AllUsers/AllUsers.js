export default {
  Query: {
    AllUsers: async (parent, args, context) => {
      return await context.prisma.user.findMany();
    },
  },
};
