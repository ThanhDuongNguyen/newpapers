const newspaperModel = require("../models/newspapers.model");
const categoryModel = require("../models/category.model");
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
    const [list, total] = await Promise.all([
      (listHotNews = await newspaperModel.hotNewsMenu()),
      (listSeafood = await newspaperModel.newspaperByCat(3)),
      (listAgricultural = await newspaperModel.newspaperByCat(2)),
      (listChildBusiness = await categoryModel.childCategory(1)),
      (listChildMineral = await categoryModel.childCategory(4)),
      allCat = await categoryModel.all(),
    ]);

    for (const seafood of listSeafood) {
      seafood.Day = moment(seafood.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
    }

    for (const agricultural of listAgricultural) {
      agricultural.Day = moment(
        agricultural.Day,
        "YYYY-MM-DD,h:mm:ss a"
      ).format("LLL");
    }

    for (const hotNews of listHotNews) {
      hotNews.Day = moment(hotNews.Day, "YYYY-MM-DD,h:mm:ss a").format("LLL");
    }

    res.locals.lcSeafood = listSeafood;
    res.locals.lcAgricultural = listAgricultural;
    res.locals.lcHotNews = listHotNews;
    res.locals.lcChildBusiness = listChildBusiness;
    res.locals.lcChildMineral = listChildMineral;
    res.locals.lcAllCat = allCat;

    next();
  });
};
