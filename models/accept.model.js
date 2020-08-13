const db = require("../utils/db");
const TBL_Accept = "acept";

module.exports = {
    all: function(){
        return db.load(`select * from ${TBL_Accept}`);
    },
    add: function(entity) {
        return db.add(TBL_Accept ,entity);
    },
    delete: function(id){
        const condition = {
            IDPage : id
        };
       return db.del(TBL_Accept, condition); 
    },
};