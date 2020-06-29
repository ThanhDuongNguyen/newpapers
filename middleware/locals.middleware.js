const homeModel = require("../models/home.model");

module.exports = function (app) {
  app.use(function (req, res, next) {
    if (!req.session.isAuthenticated === null) {
      req.session.isAuthenticated = false;
    }

    res.locals.lcIsAuthenticated = req.session.isAuthenticated;
    res.locals.lcAuthUser = req.session.authUser;

    next();
  });

  app.use(async function(req, res, next){
    const listSeafood = await homeModel.menu(3);
    const listAgricultural = await homeModel.menu(2);
    const listHotnews= await homeModel.hotnewsmenu();

    res.locals.lcSeafood = listSeafood;
    res.locals.lcAgricultural = listAgricultural;
    res.locals.lcHotnews = listHotnews;

    next();
  });
};
