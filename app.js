const express = require('express');
const exphbs = require('express-handlebars');
require('express-async-errors');
const numeral = require('numeral');

const app = express();

app.use(express.urlencoded({
  extended: true
}));
 
app.engine('hbs', exphbs({
  layoutsDir: 'views/_layouts',
  defaultLayout: 'main',
  partialsDir: 'views/_partials',
  extname: '.hbs',
  helpers: {
    format_number: function (value) {
      return numeral(value).format('0,0');
    }
  }
}));
app.set('view engine', 'hbs');

app.use('/public', express.static('public'));
app.use('/Category', require('./routers/category.router'));

app.get('/', function (req, res) {
  res.render('home');
})


// app.use('/products', require('./routes/_product.route'));

app.get('/err', function (req, res) {
  throw new Error('beng beng');
})

app.use(function (req, res) {
  res.render('404', { layout: false });
})

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).render('500', { layout: false });
})

const PORT = 3000;
app.listen(PORT, function () {
  console.log(`Server is running at http://localhost:${PORT}`);
})