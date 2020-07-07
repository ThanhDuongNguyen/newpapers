const db = require("../utils/db");

const TBL_TAGS = "tags";
const TBL_REFERENCETAGSNEWS = "referencetagsnews";

module.exports = {
  add: function (entity) {
    return db.add(TBL_TAGS, entity);
  },
  all: function () {
    return db.load(`select * from ${TBL_TAGS} limit 10`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_TAGS} where IDTags = ${id}`);
  },

  tagsByNews: function (id) {
    return db.load(`select * from ${TBL_REFERENCETAGSNEWS} where IDPage = ${id}`);
  },

  newsByTag: function(id)
  {
    return db.load(`select IDPage from ${TBL_REFERENCETAGSNEWS} where IDTags = ${id}`);
  },

  anotherTags: function(id)
  {
    return db.load(`select * from ${TBL_TAGS} where IDTags <> ${id} limit 10`);
  },
};
