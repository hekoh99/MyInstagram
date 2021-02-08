export default {
  Query: {
    SearchUsers: async (_, args, context) =>
      context.prisma.user.findMany({
        where: {
          OR: [
            {
              nickname: {
                contains: args.term,
              },
            },
            {
              firstname: {
                contains: args.term,
              },
            },
            {
              lastname: {
                contains: args.term,
              },
            },
          ],
        },
      }),
  },
};
