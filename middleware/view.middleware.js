const exphbs = require("express-handlebars");


module.exports = function (app) {
  app.engine(
    "hbs",
    exphbs({
      layoutsDir: "views/_layouts",
      defaultLayout: "main",
      extname: ".hbs",
      helpers:{
        inc: function(value){
          return parseInt(value) + 1;
        }
      }
    })
  );
  app.set("view engine", "hbs");
};
