const db = require("../utils/db");

const TBL_CATEGORIES = "categories";
const TBL_NEWSPAPER = "newspapers";
const TBL_EDITOR_CAT = "editor_cat";
const TBL_USER = "users";
const TOP_NEWS_NUM = 5;
//
module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_CATEGORIES}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
  },

  singleByIDPage: async function (id) {
    const row = await db.load(`select ${TBL_CATEGORIES}.CatName from ${TBL_CATEGORIES} join ${TBL_NEWSPAPER} on ${TBL_CATEGORIES}.CatID = ${TBL_NEWSPAPER}.CatID where ${TBL_NEWSPAPER}.IDPage = ${id}`);

    return row[0];
  },

  singleByCatName: function (CatName) {
    return db.load(`select * from ${TBL_CATEGORIES} where CatName like N'${CatName}'`);
  },

  childCategory: function (id) {
    return db.load(`SELECT * FROM ${TBL_CATEGORIES} WHERE ${TBL_CATEGORIES}.ParentCatID = ${id}`);
  },

  censorOfCat: function (id) {
    return db.load(`select ${TBL_USER}.Name, ${TBL_USER}.IDUser, ${TBL_USER}.PermissionID from ${TBL_EDITOR_CAT} join ${TBL_USER} on ${TBL_EDITOR_CAT}.IDUser = ${TBL_USER}.IDUser where CatID = ${id} and ${TBL_USER}.PermissionID <> 1`);
  },
  editorByCat: function (id) {
    return db.load(`SELECT * FROM ${TBL_CATEGORIES} cat JOIN ${TBL_EDITOR_CAT} ec WHERE cat.CatID=ec.CatID and ec.IDUser = ${id} `);
  },
  pageByCat: function (id, limit, offset) {
    return db.load(
      `select *, DateDiff(Now(), ${TBL_NEWSPAPER}.Day) as time from ${TBL_NEWSPAPER} where CatID = ${id} ORDER BY time ASC limit ${limit} offset  ${offset}`
    );
  },

  pageAllCat: function (limit, offset) {
    return db.load(`select * from ${TBL_CATEGORIES} limit ${limit} offset ${offset}`);
  },

  countByCat: async function (id) {
    const row = await db.load(
      `select count(*) as total from ${TBL_NEWSPAPER} where CatID = ${id}`
    );
    return row[0].total;
  },

  countAllCat: async function () {
    const row = await db.load(`select count(*) as total from ${TBL_CATEGORIES}`);
    return row[0].total;
  },
  
  footerByCat: function () {
    return db.load(`select * from ${TBL_CATEGORIES} limit 6`);
  },
  add: function (entity) {
    return db.add(TBL_CATEGORIES, entity);
  },
  patch: function (entity) {
    const condition = {
      CatID: entity.CatID,
    };
    delete entity.CatID;
    return db.patch(TBL_CATEGORIES, entity, condition);
  },
  del: function (id) {
    const condition = {
      CatID: id,
    };
    return db.del(TBL_CATEGORIES, condition);
  },

};
