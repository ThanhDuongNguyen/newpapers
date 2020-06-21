// Khai bao
const express = require("express");
const exphbs = require("express-handlebars");
const path = require("path");

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

app.get('/index', function(req,res)
{
  res.sendFile(__dirname + '/index.html');
}
)

// public folder
app.use('/public', express.static('public'));
app.use("/news", require("./routers/detail.router"));
app.use("/", require("./routers/home.router"));

app.use(
  express.urlencoded({
    extended: true,
  })
);

// Login
app.get("/Login", function(req, res){
  res.sendFile(path.join(__dirname+'/Login.html'));
})

// Sign Up
app.get("/SignUp", function(req, res){
  res.sendFile(path.join(__dirname+'/SignUp.html'));
})


// Success
app.use("/Success",function (req, res) {
  res.sendFile(path.join(__dirname+'/Success.html'));
});

// Warning
app.use("/Warning",function (req, res) {
  res.sendFile(path.join(__dirname+'/Warning.html'));
});

// Upload Complete
app.use("/UploadComplete",function (req, res) {
  res.sendFile(path.join(__dirname+'/UploadComplete.html'));
});

// Error
app.use(function (req, res) {
  res.sendFile(path.join(__dirname+'/Error.html'));
});

app.listen(3000);


