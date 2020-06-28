const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const homeModel = require("../models/home.model");
const categoryModel = require("../models/category.model");
const { tagsInNews } = require("../models/newspapers.model");

var router = express.Router();

router.get("/:id", async function (req, res) {

  const id = +req.params.id || -1;
  const News = await newspaperModel.single(id);

  const [list, total] = await Promise.all([
    listSeafood = await homeModel.menu(3),
    listAgricultural = await homeModel.menu(2),
    listHotnews = await homeModel.hotnewsmenu(),
    arrayTags = await newspaperModel.tagsInNews(News[0].Tags),
    arrayCat = await categoryModel.all(),
    NewsByCat = await categoryModel.newspaperbyCat(News[0].CatID),
    AllTags = await newspaperModel.allTags(),
  ]);

// 
  res.render("viewDetail/News", {
    News: News,
    listTags: arrayTags,
    listCat: arrayCat,
    listNewsByCat: NewsByCat,
    listSeafood: listSeafood,
    listAgricultural: listAgricultural,
    listHotnews: listHotnews,
    AllTags: AllTags
  });
});

module.exports = router;
