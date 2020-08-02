const express = require("express");
const classifyMdw = require("../middleware/classify.middleware");
const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const commentModel = require("../models/comment.model");
const userModel = require("../models/user.model");
const tagModel = require("../models/tag.model");
const defaults = require("../config/default.json");
const moment = require("moment");

var router = express.Router();

router.get("/", classifyMdw.checkAdminClass, async function (req, res) {
  const nViewInYear = [];
  for (let i = 1; i < 13; i++) {
    var nNewsInMonth = await newspaperModel.countByMonth(i);

    nViewInYear.push(nNewsInMonth);
  }

  res.locals.nViewInYearJson = JSON.stringify(nViewInYear);

  if (typeof localStorage === "undefined" || localStorage === null) {
    var LocalStorage = require("node-localstorage").LocalStorage;
    localStorage = new LocalStorage("./scratch");
  }

  const [list, total] = await Promise.all([
    (totalComment = await commentModel.countAll()),
    (totalNews = await newspaperModel.countAllNews()),
    (totalNewsPremium = await newspaperModel.countPremium()),
    (totalSubscriber = await userModel.countSubscriber()),
  ]);

  res.render("viewAdmin/Dashboard", {
    layout: false,
    totalComment,
    totalNews,
    totalNewsPremium,
    totalSubscriber,
  });
});

// category
router.get("/category", classifyMdw.checkAdminClass, async function (req, res) {
  // query page
  var page = +req.query.page;
  if (!page || page < 0 || page === 'undefined') {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listCat = await categoryModel.pageAllCat(
      defaults.pagination.limit,
      offset
    )),
    (Total = await categoryModel.countAllCat()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  // get parent cat name
  for (const category of listCat) {
    if (category.ParentCatID === null) {
      category.ParentCatID = "Không thuộc danh mục khác.";
    } else {
      const parentCat = await categoryModel.single(category.ParentCatID);
      category.ParentCatID = parentCat[0].CatName;
    }
  }

  res.render("viewAdmin/Category", {
    layout: false,
    listCat,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
    nPages,
    page,
  });
});

router.get("/category/detail", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  res.send("test");
});

router.get("/category/edit", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  res.send("test");
});

// Tags
router.get("/tags", classifyMdw.checkAdminClass, async function (req, res) {
  // query page
  console.log(req.query.page);

  var page = +req.query.page;
  if (!page || page < 0) {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listTags = await tagModel.pageAllTag(defaults.pagination.limit, offset)),
    (Total = await tagModel.countAllTag()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  res.render("viewAdmin/Tags", {
    layout: false,
    listTags,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
    nPages,
    page,
  });
});

// News
router.get("/news", classifyMdw.checkAdminClass, async function (req, res) {
  // query page
  var page = +req.query.page;
  if (!page || page < 0) {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listNews = await newspaperModel.pageAllNews(
      defaults.pagination.limit,
      offset
    )),
    (Total = await newspaperModel.countAllNews()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  for (const news of listNews) {
    news.Day = moment(news.Day, "YYYY-MM-DD,h:mm:ss a").format("L");

    if (news.Premium === 1) {
      news.Premium = "x";
    } else {
      news.Premium = " ";
    }
  }

  res.render("viewAdmin/News", {
    layout: false,
    listNews,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
    nPages,
    page,
  });
});

// User
router.get("/users", classifyMdw.checkAdminClass, async function (req, res) {
  // query page
  var page = +req.query.page;
  if (!page || page < 0) {
    page = 1;
  }
  const offset = (page - 1) * defaults.pagination.limit;

  const [list, total] = await Promise.all([
    (listUser = await userModel.pageAllUser(defaults.pagination.limit, offset)),
    (Total = await userModel.countAllUser()),
  ]);

  const nPages = Math.ceil(Total / defaults.pagination.limit);

  for (const user of listUser) {
    user.DOB = moment(user.DOB, "YYYY-MM-DD,h:mm:ss a").format("L");
  }

  res.render("viewAdmin/Users", {
    layout: false,
    listUser,
    prev_value: page - 1,
    next_value: page + 1,
    prev: page > 1,
    next: page < nPages,
    nPages,
    page,
  });
});

module.exports = router;
