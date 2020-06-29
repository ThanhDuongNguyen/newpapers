module.exports = function (req, res, next) {
  if (!req.session.isAuthenticated) {
    return res.redirect(`/Account/SignIn?retUrl=${req.originalUrl}`);
  }
  next();
};
