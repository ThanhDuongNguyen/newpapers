const express = require("express");
const tagModel = require("../models/tag.model");
const newspaperModel = require("../models/newspapers.model");
const config = require("../config/default.json");
const userModel = require("../models/user.model");
const moment = require("moment");

var router = express.Router();

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;
  const page = +req.query.page || 1;
  if (page < 0) {
    page = 1;
  }
  const offset = (page - 1) * config.pagination.limit;

  const [list, total] = await Promise.all([
    (listNews = await tagModel.pageByTag(id, config.pagination.limit, offset)),
    (Total = await tagModel.countByTag(id)),
    (listTags = await tagModel.anotherTags(id)),
    (listPopular = await newspaperModel.allPopular()),
  ]);

  const nPages = Math.ceil(Total / config.pagination.limit);

  for (const News of listNews) {
    News.Day = moment(News.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  for (const popular of listPopular) {
    popular.Day = moment(popular.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewCategory/List-Tags", {
    listNewspaper: listNews,
    listTags: listTags,
    listPopular: listPopular,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
  });
});

module.exports = router;
