<<<<<<< HEAD
const express = require('express');
const catergoryModel = require('../models/category.model');
//const categoryModel = require('../models/category.model');
var router = express.Router();

router.get("/", async function(req, res){
    
    const list = await catergoryModel.all()
    const tag = await catergoryModel.alls();
    const popular = await catergoryModel.allpopular();
    res.render('viewCategory/list', {
        categories: list, 
        tags: tag,
        populars: popular,
        empty: list.length === 0
=======
const express = require("express");
const catergoryModel = require("../models/category.model");
const homeModel = require("../models/home.model");

var router = express.Router();

router.get("/", async function (req, res) {
  list = await catergoryModel.all(),
    res.render("viewCategory/list", {
      categories: list,
      empty: list.length === 0,
>>>>>>> 73cb407564f04f9b2ddebb4a173e9ab7e35f6931
    });
});

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (listSeafood = await homeModel.menu(3)),
    (listAgricultural = await homeModel.menu(2)),
    (listHotnews = await homeModel.hotnewsmenu()),
    (listNews = await catergoryModel.newspaperbyCat(id)),
  ]);

<<<<<<< HEAD
router.get('/:id', async function(req, res){
    const id = +req.params.id || -1;
    const list = await catergoryModel.newspaperbyCat(id);
    const tag = await catergoryModel.tagsby(id);
    const popular = await catergoryModel.mostpopular(id)
    res.render('viewCategory/list', {
        listNewspaper: list,
        tags: tag,
        populars: popular
    })
} )
=======
  res.render("viewCategory/list", {
    listNewspaper: listNews,
    listSeafood: listSeafood,
    listAgricultural: listAgricultural,
    listHotnews: listHotnews,
  });
});
>>>>>>> 73cb407564f04f9b2ddebb4a173e9ab7e35f6931

router.get("/add", function (req, res) {
  res.render("viewCategoty/add");
});

router.post("/add", async function (req, res) {
  await categoryModel.add(req.body);
  res.render("viewCategory/add");
});
router.get("/edit/:id", async function (req, res) {
  const id = +req.params.id || -1;
  const rowws = await categoryModel.single(id);
  if (rowws.length === 0) return res.send("Invalid parameter.");
  const category = rows[0];
  res.render("viewCategory/edit", { category });
});
router.post("/del", async function (req, res) {
  await categoryModel.del(req.body.CatID);
  res.redirect("/admin/catergories");
});
router.post("/update", async function (req, res) {
  await categoryModel.patch(req.body);
  res.redirect("/admin/categories");
});
module.exports = router;
