const db = require("../utils/db");
const TBL_PACKAGE = "package";

module.exports = {
  all: function () {
    return db.load(`select * from ${TBL_PACKAGE}`);
  },
  single: function (id) {
    return db.load(`select * from ${TBL_PACKAGE} where PackageID = ${id}`);
  }
};
