const express = require("express");
const moment = require('moment');
const newspaperModel = require("../models/newspapers.model")

var router = express.Router();
// 
router.get("/", async function (req, res) {
  const listTrending = await newspaperModel.topNewsInWeek();
  const listMostView = await newspaperModel.topMostViews();
  const listMostNews = await newspaperModel.topMostNews();
  const listTop1NewsEachCat = await newspaperModel.top1NewsEachCat();

  moment.locale("vi");

  for(var i =0;i<listTrending.length; i++){
    var day = moment(listTrending[i].Day).format('ll');
    listTrending[i].Day = day;
  }
  for(var i =0;i<listMostView.length; i++){
    var day = moment(listMostView[i].Day).format('ll');
    listMostView[i].Day = day;
  }
  for(var i =0;i<listMostNews.length; i++){
    var day = moment(listMostNews[i].Day).format('ll');
    listMostNews[i].Day = day;
  }
  for(var i =0;i<listTop1NewsEachCat.length; i++){
    var day = moment(listTop1NewsEachCat[i].Day).format('ll');
    listTop1NewsEachCat[i].Day = day;
  }
  
  res.render("home", {
    top1: listTrending[0],
    topElse: listTrending.slice(1, listTrending.length),
    empty: listTrending.length === 0,
    listMostView: listMostView,
    listMostNews: listMostNews,
    listTop1NewsEachCat: listTop1NewsEachCat
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
