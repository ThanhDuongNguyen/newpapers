const db = require("../utils/db");

const TBL_USERS = "users";
//
module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_USERS}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_USERS} where IDUser = ${id}`);
  },

  singleByEmail: async function (email) {
    return db.load(`select * from ${TBL_USERS} where Email = '${email}'`);
  },

  add: function (entity) {
    return db.add(TBL_USERS, entity);
  },
  patch: function (entity) {
    const condition = {
      IDUser: entity.IDUser,
    };
    delete entity.IDUser;
    return db.patch(TBL_USERS, entity, condition);
  },
  del: function (id) {
    const condition = {
      IDUser: id,
    };
    return db.del(TBL_USERS, condition);
  },
};
