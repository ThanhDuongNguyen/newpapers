const express = require("express");
const moment = require('moment');
const packageModel = require("../models/package.model");
const checkPremium = require("../middleware/classify.middleware");
const restrict = require("../middleware/auth.middleware");

var router = express.Router();

router.get("/" , restrict,async function (req, res) {
  res.render("Pricing",{
      listPackage: await packageModel.all()
  });
});

module.exports = router;