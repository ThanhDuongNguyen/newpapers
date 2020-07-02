const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const homeModel = require("../models/home.model");
const categoryModel = require("../models/category.model");


var router = express.Router();

router.get("/:id", async function (req, res) {

  const id = +req.params.id || -1;
  const News = await newspaperModel.single(id);

  const [list, total] = await Promise.all([
    arrayCat = await categoryModel.all(),
    NewsByCat = await categoryModel.newspaperbyCat(News[0].CatID),
  ]);

// 
  res.render("viewDetail/News", {
    News: News,
    listCat: arrayCat,
    listNewsByCat: NewsByCat,
  });
});

module.exports = router;
