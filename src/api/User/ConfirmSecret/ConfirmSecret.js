import { generateToken } from "../../../Utils";

export default {
  Mutation: {
    ConfirmSecret: async (_, args, context) => {
      const { secret, email } = args;
      const authUser = await context.prisma.user.findUnique({
        where: { email },
      });
      if (authUser.loginSecret == secret) {
        // 로그인 종료 후 데이터베이스에서 시크릿 키 정보 지우기
        const token = generateToken(authUser.id);
        return token;
      } else {
        throw Error("inconsistant login key");
      }
    },
  },
};
