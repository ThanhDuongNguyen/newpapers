const express = require("express");
const moment = require('moment');
const homeModel = require("../models/home.model");
const newspaperModel = require("../models/newspapers.model")
const categoryModel = require("../models/category.model");

var router = express.Router();
// 
router.get("/", async function (req, res) {
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

  });
});


router.get("/About_us", function(req, res)
{
  res.render("About_us");
})

router.get("/Contact_us", function(req, res)
{
  res.render("Contact_us");
})

module.exports = router;
