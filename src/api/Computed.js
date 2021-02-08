export default {
  User: {
    fullname: (parent) => {
      return `${parent.firstname} ${parent.lastname}`;
    },
    isfollowing: async (parent, args, context) => {
      const I = context.req.user;
      const followerList = await context.prisma.user
        .findUnique({
          where: { id: parent.id },
        })
        .follower({ where: { id: I.id } }); // 상대방의 follower 리스트에 내가 있는가
      if (followerList.length === 0) return false;
      // 없으면 false 있으면 true
      else return true;
    },
    isSelf: async (parent, args, context) => {
      const I = context.req.user;
      return I.id === parent.id;
    },
  },
  Post: {
    isLiked: async (parent, args, context) => {
      const I = context.req.user;
      const postId = parent.id;
      const info = await context.prisma.post
        .findUnique({
          where: { id: postId },
        })
        .likes({ where: { user: { id: I.id } } });
      if (info.length === 0) {
        return false;
      } else return true;
    },
    countLike: async (parent, args, context) => {
      const postId = parent.id;
      const likes = await context.prisma.likeb.count({
        where: { post: { id: postId } },
      });
      return likes;
    },
  },
};
