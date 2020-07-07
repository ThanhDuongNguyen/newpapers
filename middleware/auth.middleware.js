module.exports = function (req, res, next) {
  if (!req.session.isAuthenticated) {
    return res.redirect(`/Account/Sign-In?retUrl=${req.originalUrl}`);
  }
  next();
};
