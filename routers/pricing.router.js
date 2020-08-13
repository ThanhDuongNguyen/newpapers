const express = require("express");
const moment = require('moment');
const packageModel = require("../models/package.model");

var router = express.Router();

router.get("/", async function (req, res) {
  res.render("Pricing",{
      layout: false,
      listPackage: await packageModel.all()
  });
});

module.exports = router;