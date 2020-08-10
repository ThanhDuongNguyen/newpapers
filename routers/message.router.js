const express = require("express");

var router = express.Router();

// Upload completed
router.get("/upload-completed", function(req, res){
  res.render("viewMessage/Upload-Completed", {layout: false});
})

router.post("/upload-completed", function(req, res){
  const url = req.query.retUrl || "/";
  res.redirect(url);
})

// Success
router.get("/success", function(req, res){
  res.render("viewMessage/Success", {layout: false});
})

router.post("/success", function(req, res){
  const url = req.query.retUrl || "/";
  res.redirect(url);
})

// Error
router.get("/error", function(req, res){
  res.render("viewMessage/Error", {layout: false});
})

router.post("/error", function(req, res){
  const url = req.query.retUrl || "/";
  res.redirect(url);
})

module.exports = router;