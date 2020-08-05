const express = require("express");
const newspaperModel = require("../models/newspapers.model");
const restrict = require("../middleware/auth.middleware");

var router = express.Router();

router.get("/", restrict, async function (req, res) {
  const listEditor = await newspaperModel.newByEditor(
    req.session.authUser.IDUser
  );
  var list = [];
  for (var index = 0; index < listEditor.length; index++) {
    if (listEditor[index].Status == "Chưa được duyệt") {
      list.push(listEditor[index]);
    }
  }

  res.render("viewEditer/list", {
    layout: false,
    listEditor: list,
  });
});

router.get("/rafity", async function(req, res) {
  res.render("viewEditer/ratify", {
    layout: false,
  });
});

module.exports = router;
