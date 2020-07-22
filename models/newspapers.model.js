const db = require("../utils/db");

const TBL_NEWSPAPER = "newspapers";
const TBL_CATEGORIES = 'categories';
const TOP_NEWS_NUM = 10;

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

  newsByTitle: function(title){
    return db.load(`select * from ${TBL_NEWSPAPER} where Title like '${title}'`);
  },

  newsBySearch: function (input){
    return db.load(`SELECT * FROM ${TBL_NEWSPAPER} WHERE MATCH(Title, TinyContent, Content) AGAINST('${input}')`);
  },

  newsByAuthor: function (id){
    return db.load(`SELECT * FROM ${TBL_NEWSPAPER} JOIN ${TBL_CATEGORIES} ON ${TBL_NEWSPAPER}.CatID = ${TBL_CATEGORIES}.CatID WHERE ${TBL_NEWSPAPER}.Author = ${id}`);
  },

  newsByStatus: function(status, id){
    return db.load(`select * from ${TBL_NEWSPAPER} JOIN ${TBL_CATEGORIES} ON ${TBL_NEWSPAPER}.CatID = ${TBL_CATEGORIES}.CatID where Status like '${status}' and Author = ${id}`);
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
  }
};
