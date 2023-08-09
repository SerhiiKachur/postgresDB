const express = require("express");
const router = require("./routers/index");
const ErrorHandlers = require("./middlewares/errors");

const app = express();

const bodyParser = express.json();
app.use(bodyParser); // монтує мідлвери на будь-які методи (get,post ....)

app.use(router);

app.use(
  ErrorHandlers.sequelizeUniqueConflictHandler,
  ErrorHandlers.basicHandler
);

module.exports = app;
