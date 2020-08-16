const exphbs = require("express-handlebars");
const hbs_sections = require("express-handlebars-sections");


module.exports = function (app) {
  app.engine(
    "hbs",
    exphbs({
      layoutsDir: "views/_layouts",
      defaultLayout: "_main",
      extname: ".hbs",
      helpers: {
        section: hbs_sections(),
        inc: function (value) {
          return parseInt(value) + 1;
        }
      }
    })
  );
  app.set("view engine", "hbs");
};
