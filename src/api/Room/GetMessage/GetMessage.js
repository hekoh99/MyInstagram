import { isAuthenticated } from "../../../middlewares";
import { withFilter } from "graphql-subscriptions";

export default {
  Subscription: {
    GetMessage: {
      subscribe: withFilter(
        (_, __, context) => {
          isAuthenticated(context);
          return context.pubsub.asyncIterator(["sendChat"]);
        },
        (payload, variables) => {
          console.log(payload);
          return payload.GetMessage.to === variables.receiveId;
        }
      ),
    },
  },
};
