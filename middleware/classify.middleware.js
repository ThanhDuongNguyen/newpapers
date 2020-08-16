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
};
