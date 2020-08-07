const express = require("express");
const restrict = require("../middleware/auth.middleware");
const packageModel = require("../models/package.model");
const paymentModel = require("../models/payment.model");
const subscriptionsModel = require("../models/subscriptions.model");
const moment = require('moment');

var router = express.Router();

router.get("/:packID", restrict, async function (req, res) {
    const id = +req.params.packID || -1;
    const pack = await packageModel.single(id);
    res.render("Checkout", {
        layout: false,
        package: pack[0]
    });
});

router.post("/:packID", async function (req, res) {
    const packID = +req.params.packID || -1;
    const card = await paymentModel.single(req.body.NumOnCard);
    const pack = await packageModel.single(packID);
    if (card.length === 0) {
        return res.render("Checkout", {
            layout: false,
            NumErr: 1,
            package: pack[0]
        });
    }

    if (card.NameOnCard == req.body.NameOnCard) {
        return res.render(`/checkout/${packID}`, {
            layout: false,
            NameErr: 1,
            package: pack[0]
        });
    }

    if (card.Expiration == req.body.Expiration) {
        return res.render(`/checkout/${packID}`, {
            layout: false,
            ExpErr: 1,
            package: pack[0]
        });
    }

    if (card.CVV == req.body.CVV) {
        return res.render(`/checkout/${packID}`, {
            layout: false,
            CVVErr: 1,
            package: pack[0]
        });
    }

    var start_time = moment().format();
    var end_time = moment().add(pack[0].Minutes, 'minutes').format();
    const sub = {
        IDUser: req.session.authUser.IDUser,
        PackageID: packID,
        Start_timestamp: start_time,
        End_timestamp: end_time
    }
    await subscriptionsModel.add(sub);
    res.render("viewMessage/Success", { layout: false });
});

module.exports = router;