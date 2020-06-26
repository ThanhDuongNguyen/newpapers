const  db = require ('../utils/db');

const TBL_CATEGORIES = 'categories';
const TBL_NEWSPAPER = 'newspapers';
<<<<<<< HEAD
const TBL_TAG = 'tags';
=======
const TOP_NEWS_NUM = 5;

>>>>>>> 73cb407564f04f9b2ddebb4a173e9ab7e35f6931
module.exports = {
    all: function (){
        return db.load(`select * from ${TBL_CATEGORIES}`);
    },
    alls: function(){
        return db.load(`select * from ${TBL_TAG}`);
    },
    allpopular: function () {
      return db.load(`select * from ${TBL_NEWSPAPER} ORDER BY View DESC`);  
    },
    single: function (id) {
        return db.load(`select * from ${TBL_CATEGORIES} where CatID = ${id}`);
    },
    newspaperbyCat: function (id){
        return db.load(`select * from ${TBL_NEWSPAPER} where CatID = ${id} limit ${TOP_NEWS_NUM}`);
    },
    tagsby: function (id){
        return db.load(`select * from ${TBL_TAG} where IDPage = ${id}`);
    },
    mostpopular: function(id){
        return db.load(`select * from ${TBL_NEWSPAPER} where CatID = ${id} ORDER BY View DESC `);
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