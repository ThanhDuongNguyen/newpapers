const express = require("express");
const moment = require('moment');
const homeModel = require("../models/home.model");
const newspaperModel = require("../models/newspaper.model")
const categoryModel = require("../models/category.model");

var router = express.Router();
// 
router.get("/", async function (req, res) {
  var idSeafoodCat = 3;
  var idAgriculturalCat = 2;
  const listSeafood = await homeModel.menu(idSeafoodCat);
  const listAgricultural = await homeModel.menu(idAgriculturalCat);
  const listHotnews = await homeModel.hotnewsmenu();

  
  const listTrending = await homeModel.topNewsInWeek();
  const listMostView = await newspaperModel.topMostViews();
  moment.locale("vi");
  for(var i =0;i<listTrending.length; i++){
    var day = moment(listTrending[i].Day).format('ll');
    listTrending[i].Day = day;
  }
  
  res.render("home", {
    top1: listTrending[0],
    topElse: listTrending.slice(1, listTrending.lenght),
    empty: listTrending.lenght === 0,
    listMostView: listMostView,

    listSeafood: listSeafood,
    listAgricultural: listAgricultural,
    listHotnews: listHotnews,
  });
});


module.exports = router;
