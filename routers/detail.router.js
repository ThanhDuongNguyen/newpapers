const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const categoryModel = require("../models/category.model");
const tagModel = require("../models/tag.model");
const restrict = require("../middleware/auth.middleware");
const commentModel = require("../models/comment.model");
const userModel = require("../models/user.model");
const moment = require("moment");

var router = express.Router();

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;
  const News = await newspaperModel.single(id);

  // const view = ;

  var viewNews = {
    IDPage: News[0].IDPage,
    View: News[0].View + 1,
  };



  const [list, total] = await Promise.all([
    await newspaperModel.patch(viewNews),
    (arrayCat = await categoryModel.all()),
    (newsByCat = await categoryModel.newspaperByCat(News[0].CatID)),
    (allTag = await tagModel.all()),
    (author = await userModel.single(News[0].Author)),
    (tagsName = await tagModel.tagsByNews(News[0].IDPage)),
    (comments = await commentModel.commentByNews(News[0].IDPage)),
  ]);

  for (const news of News) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  for (const comment of comments) {
    comment.Time = moment(comment.Time, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewDetail/News", {
    News: News,
    listCat: arrayCat,
    listNewsByCat: newsByCat,
    listTags: tagsName,
    AllTags: allTag,
    author: author[0],
    comments,
  });
});

router.post("/:id", restrict, async function (req, res) {
  const id = +req.params.id || -1;

  const comment = {
    IDPage: id,
    IDUser: req.session.authUser.IDUser,
    Comment: req.body.Comment,
  };

  await commentModel.add(comment);
  res.redirect(`/message/upload-completed?retUrl=${req.originalUrl}`);
});

module.exports = router;
