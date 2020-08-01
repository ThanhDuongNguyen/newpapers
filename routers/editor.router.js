const express = require("express");
const userModel = require("../models/user.model");
const categoryModel = require("../models/category.model");
const newspaperModel = require("../models/newspapers.model");
const bcryptjs = require("bcryptjs");
const restrict = require("../middleware/auth.middleware");
const moment = require("moment");
const multer = require("multer");
const path = require("path");
const { url } = require("inspector");
// const { delete } = require("./account.router");
var router = express.Router();

router.get("/", restrict, async function (req, res) {
    const listEditor = await newspaperModel.newByEditor(req.session.authUser.IDUser); 
    var list = [];
    for (var index =0; index<listEditor.length; index++ ){
        
        if(listEditor[index].Status == "Chưa được duyệt")
        {
            list.push(listEditor[index]);
        }
    }
    
    res.render("viewEditer/listEditor", {
        layout: false,
        listEditor: list
    });
});


module.exports = router;