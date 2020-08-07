const db = require("../utils/db");
const TBL_SUBSCRIPTIONS = "subscriptions";

module.exports = {
  add: function (entity) {
    return db.add(TBL_SUBSCRIPTIONS, entity);
  },
};
