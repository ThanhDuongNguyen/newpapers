const express = require("express");
const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const tagModel = require("../models/tag.model");
const moment = require("moment");

var router = express.Router();

router.get("/search", async function (req, res) {
  console.log(req.query.Search);

  const [list, total] = await Promise.all([
    (listNews = await newspaperModel.newsBySearch(req.query.Search)),
    (listTags = await tagModel.all()),
    (listPopular = await newspaperModel.allPopular()),
  ]);

  for (const news of listNews) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewCategory/list", {
    listNewspaper: listNews,
    listTags,
    listPopular,
  });
});

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (listNewsByCat = await categoryModel.newspaperByCat(id)),
    (listTags = await tagModel.all()),
  ]);


  for (const news of listNewsByCat) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewCategory/list", {
    listNewspaper: listNewsByCat,
    listTags,
  });
});

router.get("/add", function (req, res) {
  res.render("viewCategory/add");
});

router.post("/add", async function (req, res) {
  await categoryModel.add(req.body);
  res.render("viewCategory/add");
});
// router.get('/edit/:id', async function (req, res) {
//     const id = +req.params.id || -1;
//     const rowws = await categoryModel.single(id);
//     if(rowws.length === 0)
//         return res.send('Invalid parameter.');
//     const category = rows[0];
//     res.render('viewCategory/edit', { category });
// })
router.post("/del", async function (req, res) {
  await categoryModel.del(req.body.CatID);
  res.redirect("/admin/catergories");
});
router.post("/update", async function (req, res) {
  await categoryModel.patch(req.body);
  res.redirect("/admin/categories");
});

module.exports = router;
