const express = require("express");
const moment = require("moment");
const classifyMdw = require("../middleware/classify.middleware");

const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const tagModel = require("../models/tag.model");
const refTagNewsModel = require("../models/refTagsNews");

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
    return res.render("/writer/new", { layout: false });
  } else {
    const tagList = req.body.TagsList.split(",");
    newspaper.Status = "Chưa được duyệt";
    newspaper.View = 0;
    newspaper.Day = moment().format();
    delete newspaper.TagsList;

    var tagNames = [];

    const rs = await newspaperModel.add(newspaper);
    for (var index = 0; index < tagList.length; ++index) {
      const newspaperTag = {
        TagName: tagList[index],
      };

      const checkTagName = await tagModel.singleByTagName(tagList[index]);

      console.log(checkTagName);

      if (checkTagName.length === 0) {
        await tagModel.add(newspaperTag);
      }

      tagNames.push(newspaperTag.TagName);
    } 

    const listRefTagsNews = [];

    for (const tagName of tagNames) {
      const IDTag = await tagModel.singleByTagName(tagName);
      const IDPage = await newspaperModel.newsByTitle(req.body.Title);      

      const refTagsNews = {
        IDPage: IDPage[0].IDPage,
        IDTags: IDTag[0].IDTags
      }

      listRefTagsNews.push(refTagsNews);
    }

    console.log(listRefTagsNews);
    
    for (const refTagsNews of listRefTagsNews) {
      await refTagNewsModel.add(refTagsNews);
    }

    res.render("viewWriter/new", {
      // layout: false,
      listCat: await categoryModel.all(),
    });
  }
});

module.exports = router;
