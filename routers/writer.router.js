const express = require("express");
const moment = require('moment');
const classifyMdw = require("../middleware/classify.middleware");
moment().format();
var router = express.Router();

const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const tagModel = require("../models/tag.model");

router.get("/new", classifyMdw.checkWriterClass ,async function (req, res) {
    const list = await categoryModel.all();
    res.render("viewWriter/new", {
        layout: false,
        listCat: list
    });
});

router.post('/new', async function (req, res) {
    const newspaper = req.body;
    const tagList = req.body.TagsList.split(',');
    newspaper.Status = "Chưa được duyệt";
    newspaper.View = 0;
    newspaper.Day = moment().format();
    delete newspaper.TagsList;
    console.log(newspaper);
    const rs = await newspaperModel.add(newspaper);
    console.log(tagList);
    for(var index = 0; index < tagList.length; ++index) {
        console.log(tagList[index]);
        const newspaperTag = {
            IDNewspaper: rs.insertId,
            TagName: tagList[index]
        }
        await tagModel.add(newspaperTag);
    }
    res.render('viewWriter/new',{
        // layout: false,
        listCat: await categoryModel.all()
    });
})



module.exports = router;