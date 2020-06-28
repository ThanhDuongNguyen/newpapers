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
// 
  tagsInNews: async function (id) {
    const tagParent = await db.load(
      `select IDParents from ${TBL_TAGS} where IDTags = ${id}`
    );
    const temp = tagParent[0].IDParents;
    if (temp != 0) {
      return db.load(`select * from ${TBL_TAGS} where IDParents = ${temp}`);
    }
    return db.load(`select * from ${TBL_TAGS} where IDParents = ${id}`);
  },

  allTags: function () {
    return db.load(`select * from ${TBL_TAGS} limit 8`);
  },
  allpopular: function(){
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
