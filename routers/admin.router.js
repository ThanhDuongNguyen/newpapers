const express = require("express");
const classifyMdw = require("../middleware/classify.middleware");

var router = express.Router();

router.get("/", classifyMdw.checkAdminClass, async function(req, res){
  res.render("viewAdmin/Dashboard", {layout: false});
})

module.exports = router;