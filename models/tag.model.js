const db = require("../utils/db");

const TBL_TAGS = "tags";
const TBL_REFERENCETAGSNEWS = "referencetagsnews";
const TBL_NEWSPAPER = "newspapers";
const TBL_USERS = "users";


module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_TAGS}`);
  },

  tagsByTagName: function (TagName) {
    return db.load(`select * from ${TBL_TAGS} where TagName like N'${TagName}'`);
  },

  allLimit: function () {
    return db.load(`select * from ${TBL_TAGS} ORDER BY RAND() limit 10`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_TAGS} join ${TBL_USERS} on ${TBL_TAGS}.IDUser = ${TBL_USERS}.IDUser where IDTags = ${id}`);
  },

  singleByTagName: function (TagName) {
    return db.load(
      `select IDTags from ${TBL_TAGS} where TagName like '${TagName}'`
    );
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

  pageByTag: function (id, limit, offset) {
    return db.load(
      `SELECT *, DateDiff(Now(), ${TBL_NEWSPAPER}.Day) as time FROM ${TBL_REFERENCETAGSNEWS} JOIN ${TBL_NEWSPAPER} ON ${TBL_REFERENCETAGSNEWS}.IDPage = ${TBL_NEWSPAPER}.IDPage WHERE IDTags = ${id} ORDER BY time ASC LIMIT ${limit} OFFSET ${offset}`
    );
  },

  pageAllTag: function (limit, offset) {
    return db.load(
      `select * from ${TBL_TAGS} LIMIT ${limit} OFFSET ${offset}`
    );
  },

  countByTag: async function (id) {
    const row = await db.load(
      `SELECT count(*) as total FROM ${TBL_REFERENCETAGSNEWS} JOIN ${TBL_NEWSPAPER} ON ${TBL_REFERENCETAGSNEWS}.IDPage = ${TBL_NEWSPAPER}.IDPage WHERE IDTags = ${id}`
    );
    return row[0].total;
  },

  countAllTag: async function (id) {
    const row = await db.load(
      `select count(*) as totalTags from ${TBL_TAGS}`
    );
    return row[0].totalTags;
  },

  add: function (entity) {
    return db.add(TBL_TAGS, entity);
  },
  patch: function (entity) {
    const condition = {
      IDTags: entity.IDTags,
    };
    delete entity.IDComment;
    return db.patch(TBL_TAGS, entity, condition);
  },
  del: function (id) {
    const condition = {
      IDTags: id,
    };
    return db.del(TBL_TAGS, condition);
  },
};
