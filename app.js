const express = require("express");
const UserController = require("./controllers/userController");

const app = express();

const bodyParser = express.json();

// app.get("/users", UserController.getUsers);

// app.post(
//   "/users",
//   bodyParser,
//   (req, res, next) => {
//     req.test = 212324;
//     next();
//   },
//   (req, res) => {
//     console.log(req.test);
//     console.log(req.body);
//     res.send(req.body);
//   },
//   UserController.createUser
// );

app
  .route("/users")
  .get(UserController.getUsers)
  .post(bodyParser, UserController.createUser);

app.delete("/users/:userId", UserController.deleteUser);

module.exports = app;
