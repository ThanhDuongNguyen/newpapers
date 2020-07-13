const express = require("express");
const userModel = require("../models/user.model");
const bcryptjs = require("bcryptjs");
const restrict = require("../middleware/auth.middleware");
const moment = require("moment");
var router = express.Router();

// Login
router.get("/Sign-In", function (req, res) {
  res.render("viewAccount/SignIn", { layout: false });
});

router.post("/Sign-In", async function (req, res) {
  const user = await userModel.singleByEmail(req.body.Email);

  const pass = user[0].Password;

  if (user.length === 0) {
    return res.render("viewAccount/SignIn", {
      layout: false,
      err: "Invalid Email or Password.",
    });
  }

  const pw = bcryptjs.compareSync(req.body.Password, user[0].Password);
  if (pw === false) {
    return res.render("viewAccount/SignIn", {
      layout: false,
      err: "Invalid Email or Password",
    });
  }

  delete user[0].Password;

  req.session.isAuthenticated = true;
  req.session.authUser = user[0];

  const url = req.query.retUrl || "/";

  res.redirect(url);
});

// Sign Up
router.get("/Sign-Up", function (req, res) {
  res.render("viewAccount/SignUp", { 
    layout: false,
    dateMax: moment().format("YYYY-MM-DD")
  });
});

router.post("/Sign-Up", async function (req, res) {
  const user = await userModel.singleByEmail(req.body.Email);
  if (user.length > 0) {
    return res.render("viewAccount/SignUp", {
      layout: false,
      err: "Email already exists. Please use another email.",
    });
  }

  
  console.log(req.body.DOB);
  const password_hash = bcryptjs.hashSync(req.body.Password, 8);
  const entity = {
    Name: req.body.Name,
    Password: password_hash,
    Email: req.body.Email,
    DOB: req.body.DOB,
  };


  await userModel.add(entity);
  res.render("viewMessage/Success", { layout: false });
});

// Profile
router.get("/Profile", restrict, async function (req, res) {
  res.render("viewAccount/Profile", {
    layout: false,
    name: req.session.Name,
  });
});


// Logout
router.post("/Logout", restrict, function (req, res) {
  req.session.isAuthenticated = false;
  req.session.authUser = null;
  res.redirect(req.headers.referer);
});

module.exports = router;
