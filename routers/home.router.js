const express = require("express");
const homeModel = require("../models/home.model");

var router = express.Router();

router.get("/", async function (req, res) {
  var idSeafoodCat = 3;
  var idAgriculturalCat = 2;
  const listSeafood = await homeModel.menu(idSeafoodCat);
  const listAgricultural = await homeModel.menu(idAgriculturalCat);
  const listHotnews= await homeModel.hotnewsmenu();
  const list = await homeModel.topNewsInWeek();
  console.log(list);
  console.log(listSeafood);
  console.log(listAgricultural);
  console.log(listHotnews);
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
