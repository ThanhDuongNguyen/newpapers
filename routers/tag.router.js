const express = require('express');
const catergoryModel = require('../models/category.model');
const newspaperModel = require('../models/newspapers.model');
const homeModel = require("../models/home.model");
const tagModel = require("../models/tag.model");

var router = express.Router();


router.get("/:IDTags", async function (req, res) {

    const id = +req.params.IDTags || -1;
    const newbyTags = await tagModel.newbyTag(id);
    const tag = await newspaperModel.allTags();
    const popular = await newspaperModel.allpopular();
    res.render('viewCategory/list', {
      listNewspaper: newbyTags,
      listPopular: popular,
      listTag: tag,
      empty: newbyTags.length === 0
    });
});


module.exports = router;