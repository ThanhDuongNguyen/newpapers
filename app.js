// Khai bao
const express = require("express");
const exphbs = require("express-handlebars");
const hbs_sections = require('express-handlebars-sections');
const path = require("path");

const app = express();


app.use(express.urlencoded({
  extended: true,
}));


// Set app engine
app.engine(
  "hbs",
  exphbs({
    layoutsDir: "views/_layouts",
    defaultLayout: "main",
    extname: ".hbs",
    helpers: {
      section: hbs_sections()
    }
  })
);

app.set("view engine", "hbs");

// public folder
app.use('/public', express.static('public'));
app.use("/news", require("./routers/detail.router"));
app.use("/", require("./routers/home.router"));
app.use("/Account", require("./routers/account.router"));
app.use('/Category', require("./routers/category.router"));
app.use('/writer', require("./routers/writer.router"));


// Success
app.use("/Success",function (req, res) {
  res.render("viewMessage/Success", {layout: false});
});

// Warning
app.use("/Warning",function (req, res) {
  res.render("viewMessage/Warning", {layout: false});
});

// Upload Complete
app.use("/UploadCompleted",function (req, res) {
  res.render("viewMessage/UploadCompleted", {layout: false});
});

// Error
app.use(function (req, res) {
  res.render("viewMessage/Error", {layout: false});
});

app.listen(3000);


