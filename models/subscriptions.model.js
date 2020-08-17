const db = require("../utils/db");
const TBL_SUBSCRIPTIONS = "subscriptions";

module.exports = {
  add: function (entity) {
    return db.add(TBL_SUBSCRIPTIONS, entity);
  },
  all: function () {
    return db.load(`select * from ${TBL_SUBSCRIPTIONS}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_SUBSCRIPTIONS} where IDUser = ${id} and Status = N'Còn hạn'`);
  },

  singleExpired: function(id)
  {
    return db.load(`select * from ${TBL_SUBSCRIPTIONS} where IDUser = ${id} and Status = N'Hết hạn'`);
  },

  patch: function (entity) {
    const condition = {
      IDUser: entity.IDUser
    };
    return db.patch(TBL_SUBSCRIPTIONS, entity, condition);
  },
  del: function (id) {
    const condition = {
      IDUser: id,
    };
    return db.del(TBL_SUBSCRIPTIONS, condition);
  },
};
