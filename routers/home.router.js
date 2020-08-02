const express = require("express");
const moment = require('moment');
const newspaperModel = require("../models/newspapers.model")

var router = express.Router();
// 

router.get("/", async function (req, res) {

  moment.locale("vi");

  const [list, total] = await Promise.all([
   listTrending = await newspaperModel.topNewsInWeek(),
   listMostView = await newspaperModel.topMostViews(),
   listMostViewFooter = await newspaperModel.topMostViewFooter(),
   listMostNews = await newspaperModel.topMostNews(),
   listTop1NewsEachCat = await newspaperModel.top1NewsEachCat(),
  ]);


  for(var i =0;i<listTrending.length; i++){
    var day = moment(listTrending[i].Day).format('ll');
    listTrending[i].Day = day;
  }
  
  res.render("home", {
    top1: listTrending[0],
    topElse: listTrending.slice(1, listTrending.length),
    empty: listTrending.length === 0,
    listMostView,
    listMostNews,
    listTop1NewsEachCat,
    listMostViewFooter
  });
});

router.get("/About", function(req, res)
{
  res.render("About-Us");
})

router.get("/Contact", function(req, res)
{
  res.render("Contact-Us");
})

module.exports = router;
