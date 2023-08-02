const express = require("express");
const router = require('./routers/index')

const app = express();

const bodyParser = express.json();
app.use(bodyParser); // монтує мідлвери на будь-які методи (get,post ....)

app.use(router);

module.exports = app;
