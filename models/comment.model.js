const db = require("../utils/db");

const TBL_COMMENT = "comments";

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_COMMENT}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_COMMENT} where IDComment = ${id}`);
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
  del: function (id) {
    const condition = {
      IDComment: id,
    };
    return db.del(TBL_COMMENT, condition);
  },
};
