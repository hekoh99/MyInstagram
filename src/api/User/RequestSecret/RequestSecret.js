import { generateSecret, sendSecretEmail } from "../../../Utils";

export default {
  Mutation: {
    RequestSecret: async (_, args, context) => {
      const { email } = args;
      const loginSecret = generateSecret();
      try {
        await sendSecretEmail(email, loginSecret);
        await context.prisma.user.update({
          where: { email },
          data: { loginSecret },
        });
        return true;
      } catch (error) {
        console.log(error);
        return false;
      }
    },
  },
};
