const express = require('express');
const catergoryModel = require('../models/category.model');
var router = express.Router();

router.get("/", async function(req, res){
    const list = await catergoryModel.all();
    res.render('viewCategory/list', {
        categories: list, 
        empty: list.length === 0
    });
})

router.get('/:id', async function(req, res){
    const id = +req.params.id || -1;
    const list = await catergoryModel.newspaperbyCat(id);
    res.render('viewCategory/list', {
        listNewspaper: list
    })
} )

router.get('/add', function(req, res){
    res.render('viewCategoty/add');
})

router.post('/add', async function (req, res){
    await categoryModel.add(req.body);
    res.render('viewCategory/add');
})
// router.get('/edit/:id', async function (req, res) {
//     const id = +req.params.id || -1;
//     const rowws = await categoryModel.single(id);
//     if(rowws.length === 0)
//         return res.send('Invalid parameter.');
//     const category = rows[0];
//     res.render('viewCategory/edit', { category });
// })
router.post('/del', async function (req, res){
    await categoryModel.del(req.body.CatID);
    res.redirect('/admin/catergories');
})
router.post('/update', async function (req, res) {
    await categoryModel.patch(req.body);
    res.redirect('/admin/categories');
  })
module.exports = router;
