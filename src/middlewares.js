export const isAuthenticated = (req) => {
  if (!req.user) {
    throw Error("You need to login to perform this action");
  }
};
