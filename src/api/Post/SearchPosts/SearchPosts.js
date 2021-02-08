export default {
  Query: {
    SearchPosts: async (_, args, context) =>
      context.prisma.post.findMany({
        where: {
          OR: [
            {
              caption: {
                contains: args.term,
              },
            },
          ],
        },
        include: {
          author: true,
        },
      }),
  },
};
