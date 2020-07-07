const express = require("express");
const homeModel = require("../models/home.model");

var router = express.Router();
// 
router.get("/", async function (req, res) {
  const list = await homeModel.topNewsInWeek();

  res.render("home", {
    top1: list[0],
    topElse: list.slice(1, list.lenght),
    empty: list.lenght === 0,
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
