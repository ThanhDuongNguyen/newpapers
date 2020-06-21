// Khai bao
const express = require("express");
const exphbs = require("express-handlebars");
const app = express();

// Set app engine
app.engine(
  "hbs",
  exphbs({
    layoutsDir: "views/_layouts",
    defaultLayout: "main",
    extname: ".hbs",
  })
);
app.set("view engine", "hbs");

// public folder
app.use('/public', express.static('public'));
app.use("/news", require("./routers/detail.router"));
app.use("/", require("./routers/home.router"));

app.use(
  express.urlencoded({
    extended: true,
  })
);

// Error
app.use(function (req, res) {
  res.render("404", { layout: false });
});

app.listen(3000);
