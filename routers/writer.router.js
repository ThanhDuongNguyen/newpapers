const express = require("express");
const moment = require("moment");
const classifyMdw = require("../middleware/classify.middleware");

const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const tagModel = require("../models/tag.model");
const refTagNewsModel = require("../models/refTagsNews.model");

var router = express.Router();


router.get("/new", classifyMdw.checkWriterClass, async function (req, res) {
  const list = await categoryModel.all();
  res.render("viewWriter/new", {
    layout: false,
    listCat: list,
  });
});

router.post("/new", async function (req, res) {
  const newspaper = req.body;

  const titleNews = await newspaperModel.newsByTitle(req.body.Title);
  if (titleNews.length > 0) {
    return res.render("viewWriter/new", {
      layout: false,
      err: "The article already exists.",
      listCat: await categoryModel.all()
    });
  } else {
    const tagList = req.body.TagsList.split(",");
    newspaper.Status = "Chưa được duyệt";
    newspaper.View = 0;
    newspaper.Day = moment().format();
    newspaper.Author = req.session.authUser.IDUser;
    delete newspaper.TagsList;
    const rs = await newspaperModel.add(newspaper);

    console.log(tagList);

    for (var index = 0; index < tagList.length; ++index) {
      //if tag exist get ID, else create and get ID
      const checkTagName = await tagModel.singleByTagName(tagList[index]);
      var TagID = null;
      if (checkTagName.length === 0) {
        const Tag = {
          TagName: tagList[index]
        };
        const tagResult = await tagModel.add(Tag);
        console.log(tagResult);
        TagID = tagResult.insertId;
      }
      else {
        TagID = checkTagName[0].IDTags;
      }
      const refTagsNews = {
        IDPage: rs.insertId,
        IDTags: TagID
      }
      await refTagNewsModel.add(refTagsNews);
    }

    res.redirect(`/message/upload-completed?retUrl=${req.originalUrl}`);
  }
});

module.exports = router;
