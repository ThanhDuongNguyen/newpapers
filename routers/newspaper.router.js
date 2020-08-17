const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const categoryModel = require("../models/category.model");
const tagModel = require("../models/tag.model");
const refTagNewsModel = require("../models/refTagsNews.model");
const restrict = require("../middleware/auth.middleware");
const commentModel = require("../models/comment.model");
const userModel = require("../models/user.model");
const moment = require("moment");
const check = require("../middleware/classify.middleware");
var router = express.Router();

// Detail
router.get("/:id",check.checkPremium, async function (req, res) {
  const id = +req.params.id || -1;

  console.log("id:", id);

  const News = await newspaperModel.single(id);

  var viewNews = {
    IDPage: News[0].IDPage,
    View: News[0].View + 1,
  };

  const [list, total] = await Promise.all([
    await newspaperModel.patch(viewNews),
    (arrayCat = await categoryModel.all()),
    (newsByCat = await newspaperModel.newspaperByCat(News[0].CatID)),
    (allTag = await tagModel.allLimit()),
    (author = await userModel.single(News[0].Author)),
    (tagsName = await tagModel.tagsByNews(News[0].IDPage)),
    (comments = await commentModel.commentByNews(News[0].IDPage)),
  ]);

  // console.log(comments);

  for (const news of News) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  for (const comment of comments) {
    comment.Time = moment(comment.Time, "YYYY-MM-DD,h:mm:ss a").format("LLL");
  }

  res.render("viewNewspaper/Detail", {
    News: News,
    listCat: arrayCat,
    listNewsByCat: newsByCat,
    listTags: tagsName,
    AllTags: allTag,
    author: author[0].Name,
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

// Edit
router.get("/edit/:id", restrict, async function (req, res) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (News = await newspaperModel.single(id)),
    (Tags = await tagModel.tagsByNews(id)),
  ]);

  var strTags = "";
  for (const tag of Tags) {
    strTags += tag.TagName + ",";
  }

  console.log(strTags);

  // console.log("news: ", News);
  // console.log("tags: ", Tags);

  res.render("viewNewspaper/Edit", {
    layout: false,
    IDPage: id,
    Title: News[0].Title,
    TinyContent: News[0].TinyContent,
    Content: News[0].Content,
    ImgAvatar: News[0].ImgAvatar,
    strTags,
    listCat: await categoryModel.all(),
    Premium: News[0].Premium === 1,
  });
});

// router.post("/edit/:id", async function (req, res) {
//   const id = +req.params.id || -1;

//   const titleNews = await newspaperModel.newsByTitle(req.body.Title);

//   if (titleNews.length > 1) {
//     const [list, total] = await Promise.all([
//       (News = await newspaperModel.single(id)),
//       (Tags = await tagModel.tagsByNews(id)),
//     ]);

//     var strTags = "";
//     for (const tag of Tags) {
//       strTags += tag.TagName + ",";
//     }

//     return res.render("viewNewspaper/Edit", {
//       layout: false,
//       err: "The article already exists.",
//       IDPage: News[0].IDPage,
//       Title: News[0].Title,
//       TinyContent: News[0].TinyContent,
//       Content: News[0].Content,
//       ImgAvatar: News[0].ImgAvatar,
//       strTags,
//       listCat: await categoryModel.all(),
//       Premium: News[0].Premium === 1,
//     });
//   } else {
//     strTags = req.body.TagsList.replace(" ", "");
//     const tagList = strTags.split(",");
//     console.log(tagList);
//     for (const tag of tagList) {
//       //if tag exist get ID, else create and get ID
//       const checkTagName = await tagModel.singleByTagName(tag);
//       var TagID = null;
//       if (checkTagName.length === 0) {
//         const Tag = {
//           TagName: tag,
//         };
//         const tagResult = await tagModel.add(Tag);

//         TagID = tagResult.insertId;
//         const refTagsNews = {
//           IDTags: TagID,
//           IDPage: id,
//         };
//         // await refTagNewsModel.add(refTagsNews);
//       } else {
//         TagID = checkTagName[0].IDTags;
//         console.log(checkTagName);

//         const refTagsNews = {
//           IDTags: TagID,
//           IDPage: id,
//         };
//         // await refTagNewsModel.patch(refTagsNews);
//       }
//     }
//   }

//   // await newspaperModel.patch(req.body);

//   res.redirect(`/message/success?retUrl=${req.originalUrl}`);
// });

module.exports = router;
