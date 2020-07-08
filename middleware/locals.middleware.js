const homeModel = require("../models/home.model");
const moment = require("moment");

module.exports = function (app) {
  app.use(function (req, res, next) {
    if (!req.session.isAuthenticated === null) {
      req.session.isAuthenticated = false;
    }

    res.locals.lcIsAuthenticated = req.session.isAuthenticated;
    res.locals.lcAuthUser = req.session.authUser;

    next();
  });

  app.use(async function (req, res, next) {
    const listSeafood = await homeModel.menu(3);

    for (const seafood of listSeafood) {
      seafood.Day = moment(seafood.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
    }

    const listAgricultural = await homeModel.menu(2);

    for (const agricultural of listAgricultural) {
      agricultural.Day = moment(agricultural.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
    }
    const listHotNews = await homeModel.hotnewsmenu();

    for (const hotNews of listHotNews) {
      hotNews.Day = moment(hotNews.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
    }

    res.locals.lcSeafood = listSeafood;
    res.locals.lcAgricultural = listAgricultural;
    res.locals.lcHotNews = listHotNews;

    next();
  });
};
