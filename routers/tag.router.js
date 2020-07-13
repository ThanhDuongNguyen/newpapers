
const express = require('express');
const tagModel = require("../models/tag.model");
const newspaperModel = require('../models/newspapers.model');
const userModel = require("../models/user.model");

var router = express.Router();

router.get('/:id', async function (req, res) {
  const id = +req.params.id || -1;
  
  const [list, total] = await Promise.all([
    listNews = await tagModel.newsByTag(id),
    listTags = await tagModel.anotherTags(id),
    listPopular = await newspaperModel.allPopular(),
  ]);


  res.render('viewCategory/list', {
    listNewspaper: listNews,
    listTags: listTags,
    listPopular: listPopular,
  })
})

router.get('/add', function (req, res) {
  res.render('viewCategory/add');
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
