const db = require("../utils/db");

const TBL_NEWSPAPER = "newspapers";
const TBL_CATEGORIES = "categories";
const TBL_EDITOR_CAT = "editor_cat";
const TOP_NEWS_NUM = 10;
const TRENDING_NUM = 5;

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_NEWSPAPER}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_NEWSPAPER} where IDPage = ${id}`);
  },

  allPopular: function () {
    return db.load(`select * from ${TBL_NEWSPAPER} ORDER BY View DESC limit 5`);
  },

  newsByTitle: function (title) {
    return db.load(
      `select * from ${TBL_NEWSPAPER} where Title like '${title}'`
    );
  },

  newspaperByCat: function (id) {
    return db.load(
      `select *, DateDiff(NOW(), ${TBL_NEWSPAPER}.Day) as time from ${TBL_NEWSPAPER} where CatID = ${id} ORDER BY time ASC limit 4`
    );
  },

  newsBySearch: function (input) {
    return db.load(
      `SELECT * FROM ${TBL_NEWSPAPER} WHERE MATCH(Title, TinyContent, Content) AGAINST('${input}')`
    );
  },

  pageBySearch: function (input, limit, offset) {
    return db.load(
      `SELECT * FROM ${TBL_NEWSPAPER} WHERE MATCH(Title, TinyContent, Content) AGAINST('${input}') limit ${limit} offset  ${offset}`
    );
  },

  countBySearch: async function (input) {
    const row = await db.load(
      `SELECT count(*) as total FROM ${TBL_NEWSPAPER} WHERE MATCH(Title, TinyContent, Content) AGAINST('${input}')`
    );
    return row[0].total;
  },

  newsByAuthor: function (id) {
    return db.load(
      `SELECT * FROM ${TBL_NEWSPAPER} JOIN ${TBL_CATEGORIES} ON ${TBL_NEWSPAPER}.CatID = ${TBL_CATEGORIES}.CatID WHERE ${TBL_NEWSPAPER}.Author = ${id}`
    );
  },

  newsByStatus: function (status, id) {
    return db.load(
      `select * from ${TBL_NEWSPAPER} JOIN ${TBL_CATEGORIES} ON ${TBL_NEWSPAPER}.CatID = ${TBL_CATEGORIES}.CatID where Status like '${status}' and Author = ${id}`
    );
  },
  
  hotNewsMenu: function () {
    return db.load(`select * from ${TBL_NEWSPAPER} ORDER BY View DESC limit 4`);
  },

  topNewsInWeek: function () {
    return db.load(`SELECT * FROM ${TBL_NEWSPAPER} WHERE DateDiff(${TBL_NEWSPAPER}.Day, NOW()) <= 7 ORDER BY View DESC LIMIT ${TRENDING_NUM}`);
  },
  newByEditor: function (id){
    return db.load(
      `SELECT * FROM ${TBL_NEWSPAPER} nb join ${TBL_EDITOR_CAT} ed join ${TBL_CATEGORIES} cat WHERE cat.CatID=ed.CatID AND nb.CatID=ed.CatID AND ed.IDUser= ${id}`
    );
  },

  add: function (entity) {
    return db.add(TBL_NEWSPAPER, entity);
  },
  patch: function (entity) {
    const condition = {
      IDPage: entity.IDPage,
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
  topMostViews: function(){
    return db.load(`SELECT * FROM ${TBL_NEWSPAPER} ORDER BY View DESC LIMIT ${TOP_NEWS_NUM}`);
  },
  topMostViewfooter: function () {
    return db.load(
      `SELECT * FROM ${TBL_NEWSPAPER} ORDER BY View DESC LIMIT 5`
    );
    },
  topMostNews:function(){
    return db.load(`SELECT * FROM ${TBL_NEWSPAPER} ORDER BY Day DESC LIMIT ${TOP_NEWS_NUM}`);
  },

  top1NewsEachCat:function(){
    return db.load(`SELECT ${TBL_NEWSPAPER}.* FROM (SELECT CatID, MAX(Day) AS last_day FROM ${TBL_NEWSPAPER} GROUP BY CatID) AS last_cat INNER JOIN ${TBL_NEWSPAPER} ON ${TBL_NEWSPAPER}.CatID = last_cat.CatID AND ${TBL_NEWSPAPER}.Day = last_cat.last_day`);
  }
};
