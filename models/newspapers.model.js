const db = require("../utils/db");

const TBL_NEWSPAPER = "newspapers";
const TBL_TAGS = "tags";
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
