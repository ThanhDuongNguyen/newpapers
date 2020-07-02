const db = require('../utils/db');

const TBL_TAGS = 'tags';
const TBL_NEWSPAPER = 'newspapers';
const TBL_REFERENCETAGSNEWS = 'referencetagsnews';
module.exports = {
  add: function (entity) {
    return db.add(TBL_TAGS, entity);
  },
  all: function (){
    return db.load(`select * from ${TBL_TAGS}`)
  },
  newbyTag: function(id){
    return db.load(`SELECT ${TBL_NEWSPAPER}.IDPage, ${TBL_NEWSPAPER}.Title, ${TBL_NEWSPAPER}.TinyContent, ${TBL_NEWSPAPER}.Content, ${TBL_NEWSPAPER}.CatID, ${TBL_NEWSPAPER}.Status, ${TBL_NEWSPAPER}.View, ${TBL_NEWSPAPER}.Day, ${TBL_NEWSPAPER}.ImgAvatar FROM ${TBL_NEWSPAPER} JOIN ${TBL_REFERENCETAGSNEWS} ON ${TBL_NEWSPAPER}.IDPage = ${TBL_REFERENCETAGSNEWS}.IDPage JOIN tags ON ${TBL_REFERENCETAGSNEWS}.IDTags = ${TBL_TAGS}.IDTags WHERE ${TBL_TAGS}.IDTags = ${id} GROUP BY ${TBL_NEWSPAPER}.IDPage, ${TBL_NEWSPAPER}.Title, ${TBL_NEWSPAPER}.TinyContent, ${TBL_NEWSPAPER}.Content, ${TBL_NEWSPAPER}.CatID, ${TBL_NEWSPAPER}.Status, ${TBL_NEWSPAPER}.View, ${TBL_NEWSPAPER}.Day, ${TBL_NEWSPAPER}.ImgAvatar`);
  },
};
