const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const categoryModel = require("../models/category.model");
const tagModel = require("../models/tag.model");
const restrict = require("../middleware/auth.middleware");
const commentModel = require("../models/comment.model");
const userModel = require("../models/user.model");

var router = express.Router();

router.get("/:id", async function (req, res) {
  const id = +req.params.id || -1;
  const News = await newspaperModel.single(id);

  const [list, total] = await Promise.all([
    (arrayCat = await categoryModel.all()),
    (NewsByCat = await categoryModel.newspaperByCat(News[0].CatID)),
    (allTag = await tagModel.all()),
    (author = await userModel.single(News[0].Author)),
  ]);

  var arrayTagID = await tagModel.tagsByNews(News[0].IDPage);

  const TagsName = [];
  for (const idTag of arrayTagID) {
    const name = await tagModel.single(idTag.IDTags);
    TagsName.push(name[0]);
  }

  res.render("viewDetail/News", {
    News: News,
    listCat: arrayCat,
    listNewsByCat: NewsByCat,
    listTags: TagsName,
    AllTags: allTag,
    author: author[0],
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
