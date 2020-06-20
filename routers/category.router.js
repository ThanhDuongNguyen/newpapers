const express = require('express');
// const catergoryModel = require('../modles/Category.model');
var router = express.Router();

router.get("/", function(req, res){
    res.render("viewCategory/list");
});


module.exports = router;