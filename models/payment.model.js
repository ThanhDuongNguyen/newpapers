const db = require("../utils/db");
const TBL_PAYMENT = "payment";

module.exports = {
  single: function (NumOnCard) {
    return db.load(`select * from ${TBL_PAYMENT} where NumOnCard = ${NumOnCard}`);
  }
};
