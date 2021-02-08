require("dotenv").config();
//import { GraphQLServer, PubSub } from "graphql-yoga";
import logger from "morgan";
import schema from "./schema";
import passport from "passport";
import { PrismaClient } from "@prisma/client";
import "./passportAuth";
import { authenticateJwt, subscriptionAuthJwt } from "./passportAuth";
const http = require("http");
const express = require("express");
const { ApolloServer, PubSub } = require("apollo-server-express");

const prisma = new PrismaClient();
const pubsub = new PubSub();
const app = express();
const path = "*";

const PORT = process.env.PORT || 4000;

const server = new ApolloServer({
  schema,
  context: ({ req, connection }) => {
    if (connection) {
      const user = connection.context.currentUser;
      return { user, prisma, pubsub };
    } else {
      return { req, prisma, pubsub };
    }
  }, //authenticateJwt를 거친 request가 담기고 resolver로 보냄
  subscriptions: {
    onConnect: async (connectionParams, webSocket, context) => {
      if (connectionParams.Authorization) {
        return subscriptionAuthJwt(connectionParams).then((user) => {
          return {
            currentUser: user,
          };
        });
      } else {
        throw Error("need to login");
      }
    },
  },
});

app.use(logger("dev"));
app.use(authenticateJwt); //모든 요청은 passportAuth의 authenticateJwt 함수를 통과함.

const httpServer = http.createServer(app);

server.applyMiddleware({ app, path });
server.installSubscriptionHandlers(httpServer);

//app.listen({ port: PORT }, () => console.log(`server running on port ${PORT}`));
httpServer.listen(PORT, () => {
  console.log(
    `🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`
  );
  console.log(
    `🚀 Subscriptions ready at ws://localhost:${PORT}${server.subscriptionsPath}`
  );
});
