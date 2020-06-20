const express = require("express");

var router = express.Router();

router.get("/", function (req, res) {
  res.render("viewDetail/News");
});



module.exports = router;
