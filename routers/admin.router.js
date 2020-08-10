const express = require("express");
const classifyMdw = require("../middleware/classify.middleware");
const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const commentModel = require("../models/comment.model");
const userModel = require("../models/user.model");
const tagModel = require("../models/tag.model");
const editor_catModel = require("../models/edit_cat.model");
const refTagNewsModel = require("../models/refTagsNews.model");
const defaults = require("../config/default.json");
const moment = require("moment");
const bcryptjs = require("bcryptjs");

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
  if (!page || page < 0 || page === "undefined") {
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
    if (category.ParentCatID === 0) {
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

router.get("/category/add", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const [list, total] = await Promise.all([
    (allCat = await categoryModel.all()),
    (allUser = await userModel.allEditor()),
  ]);

  res.render("viewCategory/Add", {
    layout: false,
    allCat,
    allUser,
  });
});

router.post("/category/add", async function (req, res) {
  console.log(req.body);

  const checkCatName = await categoryModel.singleByCatName(req.body.CatName);
  if (checkCatName.length > 0) {
    return res.render("viewCategory/Add", {
      layout: false,
      err: "Danh mục đã tồn tại. Vui lòng đặt tên khác",
      allCat,
    });
  } else {
    const entity_cat = {
      CatName: req.body.CatName,
      ParentCatID: req.body.ParentCatID,
      IDUser: req.session.authUser.IDUser,
    };

    const addCat = await categoryModel.add(entity_cat);

    for (const IDUser of req.body.IDUser) {
      var entity_edit_cat = {
        IDUser: IDUser,
        CatID: addCat.insertId,
      };

      await editor_catModel.add(entity_edit_cat);
    }
  }

  res.redirect("/admin/category");
});

router.get("/category/detail/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  // get id category
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (category = await categoryModel.single(id)),
    (censors = await categoryModel.censorOfCat(id)),
  ]);

  const userAdd = await userModel.single(category[0].IDUser);
  // Format parent id to parent name
  if (category[0].ParentCatID === null || category[0].ParentCatID === 0) {
    category[0].ParentCatID = "Không thuộc danh mục khác.";
  } else {
    const parentCat = await categoryModel.single(category[0].ParentCatID);
    category[0].ParentCatID = parentCat[0].CatName;
  }

  // format time
  category[0].Time = moment(category[0].Time, "YYYY-MM-DD,h:mm:ss a").format(
    "LLL"
  );

  var censorName = "";
  for (const censor of censors) {
    censorName += censor.Name + " ,";
  }

  res.render("viewCategory/Detail", {
    layout: false,
    Parent: category[0].ParentCatID,
    CatName: category[0].CatName,
    CatID: category[0].CatID,
    Time: category[0].Time,
    UserAdd: userAdd[0].Name,
    censorName,
  });
});

router.get("/category/edit/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (allCat = await categoryModel.all()),
    (allUser = await userModel.allEditor()),
    (category = await categoryModel.single(id)),
    (censors = await categoryModel.censorOfCat(id)),
  ]);

  const userAdd = await userModel.single(category[0].IDUser);

  // format time
  category[0].Time = moment(category[0].Time, "YYYY-MM-DD,h:mm:ss a").format(
    "LLL"
  );

  for (const censor of censors) {
    var index = allUser
      .map(function (censor) {
        return censor.IDUser;
      })
      .indexOf(censor.IDUser);

    if (index > -1) {
      allUser.splice(index, 1);
    }
  }

  // console.log("all user censor after remove element", allUser);

  res.render("viewCategory/Edit", {
    layout: false,
    CatID: category[0].CatID,
    CatName: category[0].CatName,
    allCat: allCat.map((cat) => ({
      ...cat,
      isCurrent: cat.CatID === category[0].ParentCatID,
    })),
    censor: censors,
    allUser,
  });
});

router.post("/category/update", async function (req, res) {
  console.log("req.body", req.body);

  const owl_censors = await categoryModel.censorOfCat(req.body.CatID);
  // const checkCatSame = await categoryModel.singleByCatName(req.body.CatName);
  console.log("owl censor", owl_censors);

  const new_censors = [];

  for (const IDUser of req.body.IDUser) {
    let user = await userModel.single(IDUser);
    new_censors.push(user[0].IDUser);
  }

  for (const owl_censor of owl_censors) {
    for (const new_censor of new_censors) {
      if (new_censors.includes(owl_censor.IDUser)) {
        var index_new_censor = new_censors
          .map(function (new_censor) {
            return new_censor;
          })
          .indexOf(new_censor);
        if (index_new_censor > -1) {
          new_censors.splice(index_new_censor, 1);
        }

        var index_owl_censor = owl_censors
          .map(function (owl_censor) {
            return owl_censor.IDUser;
          })
          .indexOf(owl_censor.IDUser);
        if (index_owl_censor > -1) {
          owl_censors.splice(index_owl_censor, 1);
        }
      }
    }
  }

  console.log("new censor after remove same value", new_censors);

  for (const new_censor of new_censors) {
    var entity = {
      IDUser: new_censor,
      CatID: req.body.CatID,
    };

    console.log("entity", entity);
    await editor_catModel.add(entity);
  }

  for (const owl_censor of owl_censors) {
    if (!new_censors.includes(owl_censor.IDUser)) {
      console.log("owl censor", owl_censor);
      await editor_catModel.delByIDUser(owl_censor.IDUser);
    }
  }

  if (req.body.ParentCatID === 0) {
    req.body.ParentCatID = null;
  }

  const edit_cat = {
    CatID: req.body.CatID,
    CatName: req.body.CatName,
    ParentCatID: req.body.ParentCatID,
    IDUser: req.session.authUser.IDUser,
  };

  await categoryModel.patch(edit_cat);

  res.redirect("/admin/category");
});

router.post("/category/delete/:id", async function (req, res) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (listChild = await categoryModel.childCategory(id)),
  ]);

  for (const child of listChild) {
    child.ParentCatID = null;
    var entity = {
      CatID: id,
      ParentCatID: child.ParentCatID,
    };
    await categoryModel.patch(entity);
  }

  console.log(id);
  await newspaperModel.delByCat(id);

  await editor_catModel.del(id);

  await categoryModel.del(id);
  res.redirect("/admin/category");
});

// Tags
router.get("/tags", classifyMdw.checkAdminClass, async function (req, res) {
  // query page
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

router.get("/tags/detail/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const detailTag = await tagModel.single(id);

  // format time
  detailTag[0].Time = moment(detailTag[0].Time, "YYYY-MM-DD,h:mm:ss a").format(
    "LLL"
  );

  res.render("viewTags/Detail", {
    layout: false,
    detailTag,
  });
});

router.get("/tags/add", classifyMdw.checkAdminClass, async function (req, res) {
  res.render("viewTags/Add", {
    layout: false,
  });
});

router.post("/tags/add", async function (req, res) {
  const checkTagsExists = await tagModel.tagsByTagName(req.body.TagName);

  if (checkTagsExists.length > 0) {
    return res.render("viewTags/Add", {
      layout: false,
      err: "Thẻ đã tồn tại. Vui lòng đặt tên thẻ khác",
      allCat,
    });
  } else {
    const entity = {
      TagName: req.body.TagName,
      IDUser: req.session.authUser.IDUser,
    };

    await tagModel.add(entity);
  }

  res.redirect("/admin/tags");
});

router.get("/tags/edit/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const detailTag = await tagModel.single(id);

  // console.log(detailTag);

  res.render("viewTags/Edit", {
    layout: false,
    detailTag,
  });
});

router.post("/tags/update", async function (req, res) {
  const checkTagsExists = await tagModel.tagsByTagName(req.body.TagName);

  if (checkTagsExists.length > 0) {
    const detailTag = await tagModel.single(req.body.IDTags);

    return res.render("viewTags/Edit", {
      layout: false,
      err: "Thẻ đã tồn tại. Vui lòng đặt tên thẻ khác",
      detailTag,
    });
  } else {
    const entity = {
      TagName: req.body.TagName,
      IDUser: req.session.authUser.IDUser,
    };

    await tagModel.patch(entity);
  }

  res.redirect("/admin/tags");
});

router.post("/tags/delete/:id", async function (req, res) {
  const id = +req.params.id || -1;
  console.log(id);

  await refTagNewsModel.delByIDTags(id);

  await tagModel.del(id);

  res.redirect("/admin/tags");
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

router.get("/news/add", classifyMdw.checkAdminClass, async function (req, res) {
  const allCat = await categoryModel.all();
  res.render("viewNewspaper/Add", {
    layout: false,
    allCat,
  });
});

router.post("/news/add", async function (req, res) {
  const newspaper = req.body;

  const titleNews = await newspaperModel.newsByTitle(req.body.Title);
  if (titleNews.length > 0) {
    return res.render("viewNewspaper/Add", {
      layout: false,
      err: "Bài viết đã tồn tại.",
      allCat: await categoryModel.all(),
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
          TagName: tagList[index],
          IDUser: req.session.authUser.IDUser,
        };
        const tagResult = await tagModel.add(Tag);
        console.log(tagResult);
        TagID = tagResult.insertId;
      } else {
        TagID = checkTagName[0].IDTags;
      }
      const refTagsNews = {
        IDPage: rs.insertId,
        IDTags: TagID,
      };
      await refTagNewsModel.add(refTagsNews);
    }

    res.redirect("/admin/news");
  }
});

router.get("/news/detail/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const detailNews = await newspaperModel.single(id);

  const [list, total] = await Promise.all([
    (catOfNews = await categoryModel.singleByIDPage(id)),
    (author = await userModel.singleByIDPage(detailNews[0].Author)),
  ]);

  detailNews[0].Day = moment(detailNews[0].Day, "YYYY-MM-DD,h:mm:ss a").format(
    "L"
  );

  res.render("viewNewspaper/Admin-Detail", {
    layout: false,
    detailNews,
    IDPage: id,
    CatName: catOfNews.CatName,
    View: detailNews[0].View,
    Day: detailNews[0].Day,
    Author: author.Name,
    Status: detailNews[0].Status,
    draft:
      detailNews[0].Status === "Đã được duyệt & chờ xuất bản" ||
      detailNews[0].Status === "Chưa được duyệt",
  });
});

router.get("/news/edit/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const detailNews = await newspaperModel.single(id);

  const [list, total] = await Promise.all([
    (catOfNews = await categoryModel.singleByIDPage(id)),
    (allCat = await categoryModel.all()),
    (listTags = await refTagNewsModel.singleByNews(id)),
  ]);

  var strTags = "";

  for (const tag of listTags) {
    strTags += tag.TagName + ",";
  }

  res.render("viewNewspaper/Admin-Edit", {
    layout: false,
    IDPage: detailNews[0].IDPage,
    Title: detailNews[0].Title,
    TinyContent: detailNews[0].TinyContent,
    Content: detailNews[0].Content,
    allCat: allCat.map((cat) => ({
      ...cat,
      isCurrent: cat.CatID === detailNews[0].CatID,
    })),
    Status: detailNews[0].Status,
    ImgAvatar: detailNews[0].ImgAvatar,
    Premium: detailNews[0].Premium === 1,
    strTags,
  });
});

router.post("/news/update", async function (req, res) {
  const owl_listTags = await refTagNewsModel.singleByNews(req.body.IDPage);

  req.body.TagsList.replace(" ", "");

  console.log("req.body.TagsList", req.body.TagsList);
  const new_listTags = req.body.TagsList.split(",");
  const new_ListTags_length = new_listTags.length;
  for (let i = 0; i < new_ListTags_length; i++) {
    if (new_listTags[i] === "") {
      new_listTags.splice(i, 1);
    }
  }

  for (const owl_tag of owl_listTags) {
    for (const new_tag of new_listTags) {
      if (new_listTags.includes(owl_tag.TagName)) {
        var index_new_tag = new_listTags
          .map(function (new_tag) {
            return new_tag;
          })
          .indexOf(new_tag);
        if (index_new_tag > -1) {
          new_listTags.splice(index_new_tag, 1);
        }

        var index_owl_tag = owl_listTags
          .map(function (owl_tag) {
            return owl_tag.TagName;
          })
          .indexOf(owl_tag.TagName);
        if (index_owl_tag > -1) {
          owl_listTags.splice(index_owl_tag, 1);
        }
      }
    }
  }

  // console.log("owl list tag", owl_listTags);
  // console.log("new list tag", new_listTags);

  for (const new_tag of new_listTags) {
    const checkTagName = await tagModel.singleByTagName(new_tag);
    if (checkTagName.length === 0) {
      const tag = {
        TagName: new_tag,
        IDUser: req.session.authUser.IDUser,
      };
      const resultAddTag = await tagModel.add(tag);

      const entity_tag_news = {
        IDTags: resultAddTag.insertId,
        IDPage: req.body.IDPage,
      };

      await refTagNewsModel.add(entity_tag_news);
    }
  }

  for (const owl_Tag of owl_listTags) {
    if (!new_listTags.includes(owl_Tag.TagName)) {
      // console.log("owl tag", owl_Tag.TagName);

      await refTagNewsModel.delByIDTags(owl_Tag.IDTags);
    }
  }

  res.redirect("/admin/news");
});

router.post("/news/delete/:id", async function (req, res) {
  const id = +req.params.id || -1;

  console.log(id);

  await refTagNewsModel.del(id);

  await newspaperModel.del(id);

  res.redirect("/admin/news");
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

router.get("/users/add", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  res.render("viewUser/Add", {
    layout: false,
    dateMax: moment().format("YYYY-MM-DD"),
  });
});

router.post("/users/add", async function (req, res) {
  const user = await userModel.singleByEmail(req.body.Email);
  if (user.length > 0) {
    return res.render("viewAccount/Sign-Up", {
      layout: false,
      err: "Email đã tồn tại. Vui lòng sử dụng Email khác.",
    });
  }

  console.log(req.body.DOB);
  const password_hash = bcryptjs.hashSync(req.body.Password, 8);
  const entity = {
    Name: req.body.Name,
    Password: password_hash,
    Email: req.body.Email,
    DOB: req.body.DOB,
  };

  await userModel.add(entity);

  res.redirect("/admin/users");
});

router.get("/users/detail/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const detailUser = await userModel.single(id);

  detailUser[0].DOB = moment(detailUser[0].DOB, "YYYY-MM-DD,h:mm:ss a").format(
    "L"
  );

  res.render("viewUser/Detail", {
    layout: false,
    detailUser,
    writer: detailUser[0].PermissionID === 3,
  });
});

router.get("/users/edit/:id", classifyMdw.checkAdminClass, async function (
  req,
  res
) {
  const id = +req.params.id || -1;

  const [list, total] = await Promise.all([
    (detailUser = await userModel.single(id)),
    (allPermission = await userModel.allPermission()),
  ]);

  detailUser[0].DOB = moment(detailUser[0].DOB, "YYYY-MM-DD,h:mm:ss a").format(
    "L"
  );

  res.render("viewUser/Edit", {
    layout: false,
    IDUser: detailUser[0].IDUser,
    subscriber: detailUser[0].PermissionID === 4,
    allPermission: allPermission.map((user) => ({
      ...user,
      isCurrent: user.PermissionID === detailUser[0].PermissionID,
    })),
  });
});

router.post("/users/update", async function (req, res) {
  await userModel.patch(req.body);

  res.redirect("/admin/users");
});

router.post("/users/delete/:id", async function (req, res) {
  const id = +req.params.id || -1;

  await commentModel.del(id), await editor_catModel.delByIDUser(id);
  await newspaperModel.delByAuthor(id);
  await userModel.del(id);

  res.redirect("/admin/users");
});
module.exports = router;
