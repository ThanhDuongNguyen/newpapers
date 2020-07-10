const express = require("express");

var router = express.Router();
// 
router.get("/", async function (req, res) {
  res.render("viewAdmin/Dashboard", { layout:false});
});

router.get("/category", async function (req, res) {
  res.render("viewAdmin/listCategory", { layout:false});
});

module.exports = router;