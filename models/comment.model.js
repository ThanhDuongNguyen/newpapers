const db = require("../utils/db");

const TBL_COMMENT = "comments";
const TBL_USERS = "users";


module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_COMMENT}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_COMMENT} where IDComment = ${id}`);
  },

  commentByNews: function (id){
    return db.load(`SELECT DISTINCT ${TBL_USERS}.Name, ${TBL_USERS}.Avatar, ${TBL_COMMENT}.Comment, ${TBL_COMMENT}.Time FROM ${TBL_COMMENT} JOIN ${TBL_USERS} ON ${TBL_COMMENT}.IDUser = ${TBL_USERS}.IDUser WHERE ${TBL_COMMENT}.IDPage = ${id} limit 4`)
  },

  countAll: async function(){
    const row = await db.load(`select count(*) as totalComment from ${TBL_COMMENT}`);
    return row[0].totalComment;
  },
  
  add: function (entity) {
    return db.add(TBL_COMMENT, entity);
  },
  patch: function (entity) {
    const condition = {
      IDComment: entity.IDComment,
    };
    delete entity.IDComment;
    return db.patch(TBL_COMMENT, entity, condition);
  },
  del: function (IDUser) {
    const condition = {
      IDUser: IDUser,
    };
    return db.del(TBL_COMMENT, condition);
  },
};
