const exphbs = require("express-handlebars");


module.exports = function (app) {
  app.engine(
    "hbs",
    exphbs({
      layoutsDir: "views/_layouts",
      defaultLayout: "main",
      extname: ".hbs",
    })
  );
  app.set("view engine", "hbs");
};
