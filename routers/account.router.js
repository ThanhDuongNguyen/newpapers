const express = require("express");
const accountModel = require("../models/account.model");
const catergoryModel = require("../models/category.model");
const homeModel= require("../models/home.model");
var router = express.Router();

router.get('/Contact_us', async function (req, res) {
  var idSeafoodCat = 3;
  var idAgriculturalCat = 2;
  const listSeafood = await homeModel.menu(idSeafoodCat);
  const listAgricultural = await homeModel.menu(idAgriculturalCat);
  const listHotnews = await homeModel.hotnewsmenu();
  const id = +req.params.id || -1;
  const list = await catergoryModel.newspaperbyCat(id);
  res.render('Contact_us', {
      listNewspaper: list,
      listSeafood: listSeafood,
      listAgricultural: listAgricultural,
      listHotnews: listHotnews,
  })
})
router.get('/About_us', async function (req, res) {
  var idSeafoodCat = 3;
  var idAgriculturalCat = 2;
  const listSeafood = await homeModel.menu(idSeafoodCat);
  const listAgricultural = await homeModel.menu(idAgriculturalCat);
  const listHotnews = await homeModel.hotnewsmenu();
  const id = +req.params.id || -1;
  const list = await catergoryModel.newspaperbyCat(id);
  res.render('About_us', {
      listNewspaper: list,
      listSeafood: listSeafood,
      listAgricultural: listAgricultural,
      listHotnews: listHotnews,
  })
})
//Login
router.get("/Login", async function(req, res)
{
  res.render("Login", {layout: false});
})

// Sign Up
router.get("/SignUp", async function(req, res)
{
  res.render("SignUp", {layout: false});
})
// 
module.exports = router;