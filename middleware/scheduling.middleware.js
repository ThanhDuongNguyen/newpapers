var schedule = require('node-schedule');
const acceptModel = require("../models/accept.model");
const newspapersModel = require("../models/newspapers.model");
const moment = require('moment');

module.exports = async function () {

    const listJob = await acceptModel.all();
    // console.log(listJob);
    for (i = 0; i < listJob.length; i++) {

        if (moment(listJob[i].Day).diff(moment(), 'seconds') <= 0) {
            const ob = {
                IDPage: listJob[i].IDPage,
                Status: "Đã được duyệt"
            }
            newspapersModel.patch(ob);
            acceptModel.delete(listJob[i].IDPage);
        }
        else {
            var date = new Date(listJob[i].Day);
            var IDPage = listJob[i].IDPage;
            var j = schedule.scheduleJob(date, function(IDPage) {
                const ob = {
                    IDPage: IDPage,
                    Status: "Đã được duyệt"
                }
                newspapersModel.patch(ob);
                acceptModel.delete(IDPage);
            }.bind(null,IDPage));
        }
    }

};
