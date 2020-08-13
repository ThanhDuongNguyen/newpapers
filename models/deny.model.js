const db = require("../utils/db");
const TBL_DENY = "deny";

module.exports = {
    add: function(entity) {
        return db.add(TBL_DENY ,entity);
    }
};