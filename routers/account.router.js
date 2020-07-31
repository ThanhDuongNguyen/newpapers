const express = require("express");
const userModel = require("../models/user.model");
const newspaperModel = require("../models/newspapers.model");
const bcryptjs = require("bcryptjs");
const restrict = require("../middleware/auth.middleware");
const moment = require("moment");
const multer = require("multer");
const path = require("path");
const { add } = require("numeral");
var router = express.Router();

// Set Storage Engine
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../public/images-upload"));
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

// Init upload
const upload = multer({
  storage: storage,
});

// Body-parser
router.use(
  express.urlencoded({
    extended: true,
  })
);

// Login
router.get("/Sign-In", function (req, res) {
  res.render("viewAccount/Sign-In", { layout: false });
});

router.post("/Sign-In", async function (req, res) {
  const user = await userModel.singleByEmail(req.body.Email);

  if (user.length === 0) {
    return res.render("viewAccount/Sign-In", {
      layout: false,
      err: "Invalid Email or Password.",
    });
  }

  const pw = bcryptjs.compareSync(req.body.Password, user[0].Password);
  if (pw === false) {
    return res.render("viewAccount/Sign-In", {
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
  res.render("viewAccount/Sign-Up", {
    layout: false,
    dateMax: moment().format("YYYY-MM-DD"),
  });
});

router.post("/Sign-Up", async function (req, res) {
  const user = await userModel.singleByEmail(req.body.Email);
  if (user.length > 0) {
    return res.render("viewAccount/Sign-Up", {
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

  const addUser = await userModel.add(entity);

  console.log(addUser);

  const newUser = await userModel.single(addUser.insertId);

  delete newUser[0].Password;

  req.session.isAuthenticated = true;
  req.session.authUser = newUser[0];


  res.render("viewMessage/Success", { layout: false });
});

// Profile
router.get("/Profile", restrict, async function (req, res) {
  const DOB = moment(req.session.authUser.DOB).format("L");

  var listConfirmed = []; 
  var listNotConfirmedYet = []; 
  var listNotAccepted = []; 
  var listPublished = []; 

  if (req.session.authUser.PermissionID !== 4) {
    const [list, total] = await Promise.all([
      (listConfirmed = await newspaperModel.newsByStatus(
        "Đã được duyệt & chờ xuất bản",
        req.session.authUser.IDUser
      )),
      (listNotConfirmedYet = await newspaperModel.newsByStatus(
        "Chưa được duyệt",
        req.session.authUser.IDUser
      )),
      (listNotAccepted = await newspaperModel.newsByStatus(
        "Bị từ chối",
        req.session.authUser.IDUser
      )),
      (listPublished = await newspaperModel.newsByStatus(
        "Đã xuất bản",
        req.session.authUser.IDUser
      )),
    ]);

    if (listConfirmed.length !== 0) {
      listConfirmed[0].Day = moment(listConfirmed[0].Day).format("L");
    }
    if (listNotConfirmedYet.length !== 0) {
      listNotConfirmedYet[0].Day = moment(listNotConfirmedYet[0].Day).format(
        "L"
      );
    }
    if (listNotAccepted.length !== 0) {
      listNotAccepted[0].Day = moment(listNotAccepted[0].Day).format("L");
    }
    if (listPublished.length !== 0) {
      listPublished[0].Day = moment(listPublished[0].Day).format("L");
    }
  }

  res.render("viewAccount/Profile", {
    layout: false,
    DOB,
    Subscriber: req.session.authUser.PermissionID === 4,
    Writer: req.session.authUser.PermissionID === 3,
    Editor: req.session.authUser.PermissionID === 2,
    listConfirmed,
    listNotConfirmedYet,
    listNotAccepted,
    listPublished,
  });
});

// Change avatar
router.get("/change-avatar", restrict, async function (req, res) {
  res.render("viewAccount/Change-Avatar", { layout: false });
});

router.post("/change-avatar", upload.single("Avatar"), async function (
  req,
  res
) {
  console.log(req.file.filename);

  // get file name
  const filename = req.file.filename;
  const Avatar = {
    IDUser: req.session.authUser.IDUser,
    Avatar: filename,
  };
  // update avatar
  await userModel.patch(Avatar);

  req.session.authUser.Avatar = filename;

  res.redirect("/account/profile");
});

// Edit Profile
router.get("/profile/edit", restrict, async function (req, res) {
  console.log(req.session.authUser.DOB);
  res.render("viewAccount/Edit", {
    layout: false,
    Writer: req.session.authUser.PermissionID === 3,
    dateMax: moment().format("YYYY-MM-DD"),
    DOB: moment(req.session.authUser.DOB).format("YYYY-MM-DD"),
  });
});

router.post("/profile/edit", async function (req, res) {
  console.log("input", req.body);
  var alias = "";
  // check permission
  if (req.session.authUser.PermissionID === 3) {
    alias = req.body.Alias;
  }
  const user = {
    IDUser: req.session.authUser.IDUser,
    Name: req.body.Name,
    Alias: alias,
    Email: req.body.Email,
    DOB: req.body.DOB,
  };
  // update profile
  await userModel.patch(user);

  // update session
  req.session.authUser.Name = req.body.Name;
  req.session.authUser.Alias = req.body.Alias;
  req.session.authUser.Email = req.body.Email;
  req.session.authUser.DOB = req.body.DOB;

  res.redirect("/account/profile");
});

// Change Password
router.get("/profile/change-password", restrict, async function (req, res) {
  console.log(req.session);
  res.render("viewAccount/Change-Password", {
    layout: false,
  });
});

router.post("/profile/change-password", async function (req, res) {
  const user = await userModel.single(req.session.authUser.IDUser);
  console.log("old user pass", user);
  // check password
  const pw = bcryptjs.compareSync(req.body.Password, user[0].Password);
  if (pw === false) {
    return res.render("viewAccount/Change-Password", {
      layout: false,
      err: "The password entered is incorrect, please enter it again!",
    });
  }

  const npw = bcryptjs.compareSync(req.body.New_Password, user[0].Password);
  if (npw === true) {
    return res.render("viewAccount/Change-Password", {
      layout: false,
      err: "Password already exists!",
    });
  }

  // hash new password
  const password_hash = bcryptjs.hashSync(req.body.New_Password, 8);
  const entity = {
    IDUser: req.session.authUser.IDUser,
    Password: password_hash
  };

  // update new password
  await userModel.patch(entity);

  const temp = await userModel.single(req.session.authUser.IDUser);
  console.log("new user pass", temp);

  // remove session
  req.session.isAuthenticated = false;
  req.session.authUser = null;

  res.redirect("/account/sign-in");
});

// Logout
router.post("/Logout", restrict, function (req, res) {
  req.session.isAuthenticated = false;
  req.session.authUser = null;
  res.redirect(req.headers.referer);
});

module.exports = router;
