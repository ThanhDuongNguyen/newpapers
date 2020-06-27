const express = require("express");
const accountModel = require("../models/account.model");

var router = express.Router();

// Login
router.get("/Login", async function(req, res)
{
  res.render("Login", {layout: false});
})

// Sign Up
router.get("/SignUp", async function(req, res)
{
  res.render("SignUp", {layout: false});
})
// 
module.exports = router;