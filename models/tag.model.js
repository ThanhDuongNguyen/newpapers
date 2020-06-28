const db = require('../utils/db');

const TBL_TAGS = 'tags';

module.exports = {
  add: function (entity) {
    return db.add(TBL_TAGS, entity);
  },
};
