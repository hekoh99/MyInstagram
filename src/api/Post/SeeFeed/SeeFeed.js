import { isAuthenticated } from "../../../middlewares";

export default {
  Query: {
    SeeFeed: async (_, args, context) => {
      isAuthenticated(context.req);
      const { user } = context.req;
      const following = await context.prisma.user
        .findUnique({
          where: { id: user.id },
        })
        .following();
      //내가 팔로우 하는 사람들의 post를 리스트 형태로 반환
      return context.prisma.post.findMany({
        where: {
          author: {
            id: { in: [...following.map((follow) => follow.id), user.id] },
          },
        },
        include: {
          files: true,
          author: true,
        },
        orderBy: [
          {
            updatedAt: "desc",
          },
          {
            createdAt: "desc",
          },
        ],
      });
    },
  },
};
