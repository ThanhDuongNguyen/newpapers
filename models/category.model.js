const  db = require ('../utils/db');

const TBL_CATEGORIES = 'categories';
const TBL_NEWSPAPER = 'newspapers';
const TOP_NEWS_NUM = 5;
// 
module.exports = {
    all: function (){
        return db.load(`select * from ${TBL_CATEGORIES}`);
    },
    single: function (id) {
        return db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    },
    newspaperByCat: function (id){
        return db.load(`select * from ${TBL_NEWSPAPER} where CatID = ${id} limit ${TOP_NEWS_NUM}`);
    },
    add: function (entity) {
        return db.add(TBL_CATEGORIES, entity);
    },
    patch: function (entity) {
        const condition = {
            CatID: entity.CatID
        }
        delete entity.CatID;
        return db.patch(TBL_CATEGORIES, entity, condition)
    },
    del: function (id) {
        const condition = {
            CatID: id
        }
        return db.del(TBL_CATEGORIES, condition);
    }
};