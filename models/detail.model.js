const db = require('../utils/db');

const TBL_NEWSPAPER = 'newspaper';

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_NEWSPAPER}`);
  },

  single: function (id) {
    return db.load(`select * from ${TBL_NEWSPAPER} where IDPage = ${id}`);
  },

  add: function (entity) {
    return db.add(TBL_NEWSPAPER, entity);
  },
  patch: function (entity) {
    const condition = {
      CatID: entity.IDPage
    }
    delete entity.IDPage;
    return db.patch(TBL_NEWSPAPER, entity, condition);
  },
  del: function (id) {
    const condition = {
      IDPage: id
    }
    return db.del(TBL_NEWSPAPER, condition);
  }
};
