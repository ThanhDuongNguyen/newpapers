const newspaperModel = require("../models/newspapers.model");
const categoryModel = require("../models/category.model");
const moment = require("moment");
const { footerByCat } = require("../models/category.model");
const { all } = require("../models/newspapers.model");

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
      (listMostViewFooter = await newspaperModel.topMostViewFooter()),
      (allCat = await categoryModel.all()),
      footerbyCat = await categoryModel.footerByCat(),
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

    for (var i = 0; i < listMostViewFooter.length; i++) {
      var day = moment(listMostViewFooter[i].Day).format('ll');
      listMostViewFooter[i].Day = day;
    }
    var listCat = [];
    var listCatParent = [];
    for (var i = 0; i < allCat.length; i++) {
      if (allCat[i].ParentCatID == 0) {
        listCatParent.push(allCat[i]);
      }else{
        listCat.push(allCat[i]);
      }
    }
    for (var i = 0; i < listCatParent.length; i++) {
      listchil = [];
      for (var j = 0; j < listCat.length; j++) {
        
        if(listCat[j].ParentCatID == listCatParent[i].CatID){
          listchil.push(listCat[j]);
        }
        
      }
      listCatParent[i].chil = listchil;
    }
    


    res.locals.lcSeafood = listSeafood;
    res.locals.lcAgricultural = listAgricultural;
    res.locals.lcHotNews = listHotNews;
    res.locals.lcChildBusiness = listChildBusiness;
    res.locals.lcChildMineral = listChildMineral;
    res.locals.lcAllCat = listCatParent;
    res.locals.listMostViewFooter = listMostViewFooter;
    res.locals.lcFooterCat = footerbyCat;
    next();
  });
};
