const express = require("express");
const UserController = require('./controllers/userController');

const app = express();

const bodyParser = express.json();

app.get("/", (req, res) => {
  res.send("test");
});

app.post(
  "/users",
  bodyParser,
  (req, res, next) => {
    req.test = 212324;
    next();
  },
  (req, res) => {
    console.log(req.test);
    console.log(req.body);
    res.send(req.body);
  },
  UserController.createUser
);

module.exports = app;
