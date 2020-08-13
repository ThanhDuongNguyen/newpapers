const db = require("../utils/db");

const TBL_TAGS = "tags";
const TBL_REFERENCETAGSNEWS = "referencetagsnews";
const TBL_NEWSPAPER = "newspapers";

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_TAGS} ORDER BY RAND() limit 10`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_TAGS} where IDTags = ${id}`);
  },

  tagsByNews: function (id) {
    return db.load(
      `SELECT DISTINCT ${TBL_TAGS}.TagName, ${TBL_TAGS}.IDTags FROM ${TBL_REFERENCETAGSNEWS} JOIN ${TBL_TAGS} ON ${TBL_REFERENCETAGSNEWS}.IDTags = ${TBL_TAGS}.IDTags WHERE IDPage = ${id}`
    );
  },

  newsByTag: function (id) {
    return db.load(
      `SELECT DISTINCT ${TBL_NEWSPAPER}.IDPage, ${TBL_NEWSPAPER}.Title, ${TBL_NEWSPAPER}.TinyContent, ${TBL_NEWSPAPER}.CatID, ${TBL_NEWSPAPER}.View, ${TBL_NEWSPAPER}.Day, ${TBL_NEWSPAPER}.ImgAvatar, ${TBL_NEWSPAPER}.Author FROM ${TBL_REFERENCETAGSNEWS} JOIN ${TBL_NEWSPAPER} ON ${TBL_REFERENCETAGSNEWS}.IDPage = ${TBL_NEWSPAPER}.IDPage WHERE IDTags = ${id}`
    );
  },

  anotherTags: function (id) {
    return db.load(
      `select * from ${TBL_TAGS} where IDTags <> ${id} ORDER BY RAND() limit 10`
    );
  },

  add: function (entity) {
    return db.add(TBL_REFERENCETAGSNEWS, entity);
  },
  patch: function (entity) {
    const condition = {
      IDPage: entity.IDPage,
      IDTags: entity.IDTags,
    };
    delete entity.IDTags, entity.IDPage;
    return db.patch(TBL_REFERENCETAGSNEWS, entity, condition);
  },
  del: function (IDPage, IDTags) {
    const condition = {
      IDTags: IDTags,
      IDPage: IDPage,
    };
    return db.del(TBL_REFERENCETAGSNEWS, condition);
  },
  deleteByIDPage: function (IDPage) {
    const condition = {
      IDPage: IDPage
    };
    return db.del(TBL_REFERENCETAGSNEWS, condition);
  }
};
