const express = require("express");
const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const tagModel = require("../models/tag.model");
const moment = require("moment");
const defaults = require("../config/default.json");

var router = express.Router();

router.get("/search", async function (req, res) {
  console.log(req.query.Search);
  console.log(req.query.page);

  var page = +req.query.page;
  if (!page || page < 0) {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listNews = await newspaperModel.pageBySearch(
      req.query.Search,
      defaults.pagination.limit,
      offset
    )),
    (Total = await newspaperModel.countBySearch(req.query.Search)),
    (listTags = await tagModel.allLimit()),
    (listPopular = await newspaperModel.allPopular()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  console.log("nPage: ", nPages);

  for (const news of listNews) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  for (const popular of listPopular) {
    popular.Day = moment(popular.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewCategory/List-Search", {
    input: req.query.Search,
    listNewspaper: listNews,
    listTags,
    listPopular,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
  });
});

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;

  const page = +req.query.page || 1;
  if (page < 0) {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listNewsByCat = await categoryModel.pageByCat(
      id,
      defaults.pagination.limit,
      offset
    )),
    (Total = await categoryModel.countByCat(id)),
    (listTags = await tagModel.allLimit()),
    (listPopular = await newspaperModel.allPopular()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  for (const news of listNewsByCat) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  for (const popular of listPopular) {
    popular.Day = moment(popular.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewCategory/List-Cat", {
    listNewspaper: listNewsByCat,
    listTags,
    listPopular,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
  });
});

module.exports = router;
