const express = require("express");
const homeModel = require("../models/home.model");

var router = express.Router();
// 
router.get("/", async function (req, res) {
  const listSeafood = await homeModel.menu(3);
  const listAgricultural = await homeModel.menu(2);
  const listHotnews= await homeModel.hotnewsmenu();
  const list = await homeModel.topNewsInWeek();

  res.render("home", {
    top1: list[0],
    topElse: list.slice(1, list.lenght),
    empty: list.lenght === 0,
    listSeafood:listSeafood,
    listAgricultural:listAgricultural,
    listHotnews:listHotnews,
  });
});


module.exports = router;
