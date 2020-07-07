const db = require("../utils/db");

const TBL_NEWSPAPER = "newspapers";
const TBL_TAGS = "tags";

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_NEWSPAPER}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_NEWSPAPER} where IDPage = ${id}`);
  },

  allpopular: function () {
    return db.load(`select * from ${TBL_NEWSPAPER} ORDER BY View DESC limit 5`);
  },
  
  add: function (entity) {
    return db.add(TBL_NEWSPAPER, entity);
  },
  patch: function (entity) {
    const condition = {
      CatID: entity.IDPage,
    };
    delete entity.IDPage;
    return db.patch(TBL_NEWSPAPER, entity, condition);
  },
  del: function (id) {
    const condition = {
      IDPage: id,
    };
    return db.del(TBL_NEWSPAPER, condition);
  },
};
