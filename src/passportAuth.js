require("dotenv").config();
import passport from "passport";
import { Strategy, ExtractJwt } from "passport-jwt";
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

var opts = {
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.JWT_SECRET,
};

const varifyUser = async (payload, done) => {
  try {
    const user = await prisma.user.findUnique({ where: { id: payload.id } }); // 토큰에서 해석된 id로 user 찾기
    if (user !== null) {
      return done(null, user);
    } else {
      return done(null, false);
      // or you could create a new account
    }
  } catch (error) {
    return done(error, false);
  }
};

export const authenticateJwt = (req, res, next) =>
  passport.authenticate("jwt", { sessions: false }, (error, user) => {
    if (user) {
      req.user = user;
    }
    next();
  })(req, res, next); // graphqlServer에 request가 담김

export const subscriptionAuthJwt = async (connectionParams) => {
  const tokenArray = connectionParams.Authorization.split(" ");
  const token = tokenArray[1];
  const verifiedToken = jwt.verify(token, process.env.JWT_SECRET);
  const user = await prisma.user.findUnique({
    where: { id: verifiedToken.id },
  });
  return user;
};

passport.use(new Strategy(opts, varifyUser)); // jwt 토큰을 추출 strategy. opts로 추출한 토큰으로 varifyUser 실행
passport.initialize();
