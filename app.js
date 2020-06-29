// Khai bao
const express = require("express");


const app = express();


require("./middleware/session.middleware")(app);
require("./middleware/view.middleware")(app);
require("./middleware/locals.middleware")(app);


app.use(express.urlencoded({
  extended: true
}));

// public folder
app.use('/public', express.static('public'));

// Khai bao router
app.use("/news", require("./routers/detail.router"));
app.use("/", require("./routers/home.router"));
app.use("/Account", require("./routers/account.router"));
app.use('/Category', require("./routers/category.router"));


// Error
app.use(function (req, res) {
  res.render("viewMessage/Error", {layout: false});
});

app.listen(3000);