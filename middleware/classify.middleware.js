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
};
