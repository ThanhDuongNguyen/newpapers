const express = require("express");
const tagModel = require("../models/tag.model");
const newspaperModel = require("../models/newspapers.model");
const classifyMdw = require("../middleware/classify.middleware");
const categoryModel = require("../models/category.model");
const userModel = require("../models/user.model");
const refTagNewsModel = require("../models/refTagsNews.model");
const denyModel = require("../models/deny.model");
const acceptModel = require("../models/accept.model");
const moment = require("moment");
var schedule = require('node-schedule');
var router = express.Router();

//list xử lí bài viết chưa được duyệt
router.get("/", classifyMdw.checkEditorClass, async function (req, res) {
  const listEditor = await newspaperModel.newByEditor(
    req.session.authUser.IDUser
  );
  var list = [];
  for (var index = 0; index < listEditor.length; index++) {
    if (listEditor[index].Status == "Chưa được duyệt") {
      list.push(listEditor[index]);
    }
  }

  res.render("viewEditer/listEditor", {
    layout: false,
    listEditor: list,
  });
});
 //list bài viết đã được duyệt
router.get("/accept", classifyMdw.checkEditorClass, async function (req, res) {
  const listEditor = await newspaperModel.newByEditorAccepted(
    req.session.authUser.IDUser
  );
  
  res.render("viewEditer/listAccept", {
    layout: false,
    listEditor: listEditor,
  });
});
router.get("/ratify/:id", classifyMdw.checkEditorClass, async function (req, res) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (News = await newspaperModel.single(id)),
    (Tags = await tagModel.tagsByNews(id)),
  ]);

  var strTags = "";
  for (const tag of Tags) {
    strTags += tag.TagName + ",";
  }

  const lists = await categoryModel.editorByCat(req.session.authUser.IDUser);
  console.log(lists);
  for(var i =0; i<lists.length; i++){
      if(News[0].CatID == lists[i].CatID){
          lists[i].selected = 1;
      }
      else{
        lists[i].selected = 0;
      }
  }
  console.log(lists);
  res.render("viewEditer/ratify", {
    layout: false,
    IDPage: id,
    strTags,
    listCat: lists,
    minDate: moment().format("YYYY-MM-DDTHH:mm")
  });
});

router.post("/ratify/:id", classifyMdw.checkEditorClass, async function (req, res) {
  const id = +req.params.id || -1;

  const ob = {
    CatID: req.body.CatID,
    Status: "Đã được duyệt & chờ xuất bản",
    IDPage: id
  }
  const accept = {
    IDPage: id,
    Day: req.body.DateTime
  }
  acceptModel.add(accept);
  newspaperModel.patch(ob);

  //them tag vo 
  refTagNewsModel.deleteByIDPage(id);
  const tagList = req.body.TagsList.split(",");
  for (var index = 0; index < tagList.length; ++index) {
    //if tag exist get ID, else create and get ID
    const checkTagName = await tagModel.singleByTagName(tagList[index]);
    var TagID = null;
    if (checkTagName.length === 0) {
      const Tag = {
        TagName: tagList[index]
      };
      const tagResult = await tagModel.add(Tag);
      //console.log(tagResult);
      TagID = tagResult.insertId;
    }
    else {
      TagID = checkTagName[0].IDTags;
    }
    const refTagsNews = {
      IDPage: id,
      IDTags: TagID
    } 
    await refTagNewsModel.add(refTagsNews);
  }
  //duyet dang bai
  var date = new Date(accept.Day);
  var j = schedule.scheduleJob(date, function () {
    const ob = {
      IDPage: accept.IDPage,
      Status: "Đã được duyệt"
    }
    newspaperModel.patch(ob);
    acceptModel.delete(accept.IDPage);
  });
  //thanh cong
  res.redirect(`/editor`);

});

router.get("/refuse/:id", classifyMdw.checkEditorClass, async function (req, res) {
  const id = +req.params.id || -1;
  res.render("viewEditer/refuse", {
    layout: false,
    IDPage: id
  });
});

router.post("/refuse/:id", classifyMdw.checkEditorClass, async function (req, res) {
  const id = +req.params.id || -1;
  const fall = {
    IDPage: id,
    Note: req.body.Note
  }
  denyModel.add(fall);
  res.redirect(`/editor`);
});

router.get("/:id", async function (req, res) {

  const id = +req.params.id || -1;

  const News = await newspaperModel.single(id);
  const tagsName = await tagModel.tagsByNews(id);
  author = await userModel.single(News[0].Author)

  res.render("viewEditer/listCatEdit", {
    layout: false,
    News: News[0],
    author : author[0]
  });
});

module.exports = router;
