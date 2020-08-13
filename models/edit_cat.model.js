const db = require("../utils/db");

const TBL_EDITOR_CAT = "editor_cat";

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_EDITOR_CAT} ORDER BY RAND() limit 10`);
  },

  editor_catByUser: function(id){
    return db.load(`select * from ${TBL_EDITOR_CAT} where IDUser = ${id}`);
  },

  editor_catByCat: function(id){
    return db.load(`select * from ${TBL_EDITOR_CAT} where CatID = ${id}`);
  },

  add: function (entity) {
    return db.add(TBL_EDITOR_CAT, entity);
  },
  patch: function (entity) {
    const condition = {
      IDUser: entity.IDUser,
      CatID: entity.CatID,
    };
    delete entity.IDUser, entity.CatID;
    return db.patch(TBL_EDITOR_CAT, entity, condition);
  },
  del: function (CatID) {
    const condition = {
      CatID: CatID,
    };
    return db.del(TBL_EDITOR_CAT, condition);
  },

  delByIDUser: function (IDUser) {
    const condition = {
      IDUser: IDUser,
    };
    return db.del(TBL_EDITOR_CAT, condition);
  },
};
