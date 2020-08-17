const subModel = require("../models/subscriptions.model");
const moment = require("moment");

module.exports = {
  checkWriterClass: function (req, res, next) {
    if (!req.session.isAuthenticated) {
      return res.redirect(`/Account/Sign-In?retUrl=${req.originalUrl}`);
    }
    
    if (req.session.authUser.PermissionID !== 3) {
      return res.redirect(req.headers.referer);
    }
    next();
  },

  checkEditorClass: function (req, res, next) {
    if (!req.session.isAuthenticated) {
      return res.redirect(`/Account/Sign-In?retUrl=${req.originalUrl}`);
    }
    
    if (req.session.authUser.PermissionID !== 2) {
      return res.redirect(req.headers.referer);
    }
    next();
  },

  checkAdminClass: function (req, res, next) {
    if (!req.session.isAuthenticated) {
      return res.redirect(`/Account/Sign-In?retUrl=${req.originalUrl}`);
    }
    
    if (req.session.authUser.PermissionID !== 1) {
      if(req.originalUrl === "/admin")
      {
        return res.redirect("/");
      }
      return res.redirect(req.headers.referer);
    }
    next();
  },

  checkPremium: async function(req,res,next){
   
    if (!req.session.isAuthenticated) {
      return res.redirect(`/Account/Sign-In?retUrl=${req.originalUrl}`);
    }
    const sub = await subModel.single(req.session.authUser.IDUser);
    console.log(sub.length);
    if(sub.length === 0){
      return res.redirect('/pricing');
    }
    next();
  }
};
