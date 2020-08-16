// require package and module
const express = require("express");

const app = express();

// require middleware
require("./middleware/session.middleware")(app);
require("./middleware/view.middleware")(app);
require("./middleware/locals.middleware")(app);
const scheduling = require("./middleware/scheduling.middleware");
scheduling();

app.use(express.urlencoded({
  extended: true
}));

// public folder
app.use('/public', express.static('public'));
  
// require routers
app.use("/", require("./routers/home.router"));
app.use("/pricing", require("./routers/pricing.router"));
app.use("/checkout", require("./routers/checkout.router"));
app.use("/news", require("./routers/newspaper.router"));
app.use("/Account", require("./routers/account.router"));
app.use('/Category', require("./routers/category.router"));
app.use('/writer', require("./routers/writer.router"));
app.use('/message', require("./routers/message.router"));
app.use('/tags', require("./routers/tag.router"));
app.use('/admin', require("./routers/admin.router"));
app.use('/editor', require("./routers/editor.router"));
// Error
app.use(function (req, res) {
  res.redirect(`/message/error`);
});

app.listen(process.env.PORT || 3000, () => {
  console.log("app is running")
});