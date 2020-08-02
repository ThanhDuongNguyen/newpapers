const db = require("../utils/db");

const TBL_USERS = "users";
const TBL_PERMISSION = "permission";

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

  pageAllUser: function(limit, offset){
    return db.load(`select * from ${TBL_USERS} join ${TBL_PERMISSION} on ${TBL_USERS}.PermissionID = ${TBL_PERMISSION}.PermissionID limit ${limit} offset ${offset}`);
  },

  countSubscriber: async function(){
    const row = await db.load(`select count(*) as totalSubscriber from ${TBL_USERS} where PermissionID = 4`);
    return row[0].totalSubscriber;
  },

  countAllUser: async function(){
    const row = await db.load(`select count(*) as totalUser from ${TBL_USERS} join ${TBL_PERMISSION} on ${TBL_USERS}.PermissionID = ${TBL_PERMISSION}.PermissionID`);
    return row[0].totalUser;
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
