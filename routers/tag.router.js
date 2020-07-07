
const express = require('express');
const tagModel = require("../models/tag.model");
const newspaperModel = require('../models/newspapers.model');
const userModel = require("../models/user.model");

var router = express.Router();

router.get('/:id', async function (req, res) {
  const id = +req.params.id || -1;
  
  const [list, total] = await Promise.all([
    listIDPage = await tagModel.newsByTag(id),
    listTags = await tagModel.anotherTags(id),
    listPopular = await newspaperModel.allpopular(),
  ]);

  const listNews = [];
  const author = [];

  for (const idPage of listIDPage) {
    const news = await newspaperModel.single(idPage.IDPage);
    listNews.push(news[0]);
    const listAuthor = await userModel.single(news[0].Author);
    author.push(listAuthor[0]);
  }

  res.render('viewCategory/list', {
    listNewspaper: listNews,
    listTags: listTags,
    listPopular: listPopular,
    author: author[0]
  })
})

router.get('/add', function (req, res) {
  res.render('viewCategoty/add');
})

router.post('/add', async function (req, res) {
  await categoryModel.add(req.body);
  res.render('viewCategory/add');
})

router.get('/edit/:id', async function (req, res) {
    const id = +req.params.id || -1;
    const rowws = await categoryModel.single(id);
    if(rowws.length === 0)
        return res.send('Invalid parameter.');
    const category = rows[0];
    res.render('viewCategory/edit', { category });
})

router.post('/del', async function (req, res) {
  await categoryModel.del(req.body.CatID);
  res.redirect('/admin/catergories');
})

router.post('/update', async function (req, res) {
  await categoryModel.patch(req.body);
  res.redirect('/admin/categories');
})

module.exports = router;
