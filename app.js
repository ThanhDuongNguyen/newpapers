// require package and module
const express = require("express");

const app = express();

// require middleware
require("./middleware/session.middleware")(app);
require("./middleware/view.middleware")(app);
require("./middleware/locals.middleware")(app);

app.use(express.urlencoded({
  extended: true
}));

// public folder
app.use('/public', express.static('public'));

// require routers
app.use("/news", require("./routers/detail.router"));
app.use("/", require("./routers/home.router"));
app.use("/Account", require("./routers/account.router"));
app.use('/Category', require("./routers/category.router"));
app.use('/writer', require("./routers/writer.router"));
app.use('/message', require("./routers/message.router"));
app.use('/tags', require("./routers/tag.router"));
app.use('/admin', require("./routers/admin.router"));
// Error
app.use(function (req, res) {
  res.redirect(`/message/error?retUrl=${req.originalUrl}`);
  // res.render("viewMessage/Error", {layout: false});
});

app.listen(3000);