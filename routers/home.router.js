const express = require("express");
const homeModel = require("../models/home.model");

var router = express.Router();
// 
router.get("/", async function (req, res) {
<<<<<<< HEAD
  var idSeafoodCat = 3;
  var idAgriculturalCat = 2;
  const listSeafood = await homeModel.menu(idSeafoodCat);
  const listAgricultural = await homeModel.menu(idAgriculturalCat);
  const listHotnews = await homeModel.hotnewsmenu();
=======
  const listSeafood = await homeModel.menu(3);
  const listAgricultural = await homeModel.menu(2);
  const listHotnews= await homeModel.hotnewsmenu();
>>>>>>> 13400d75523b851c3c5a210b87d0cb88b0b67791
  const list = await homeModel.topNewsInWeek();

  res.render("home", {
    top1: list[0],
    topElse: list.slice(1, list.lenght),
    empty: list.lenght === 0,
    listSeafood: listSeafood,
    listAgricultural: listAgricultural,
    listHotnews: listHotnews,
  });
});


module.exports = router;
