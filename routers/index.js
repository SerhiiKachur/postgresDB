const express = require('express');
const UserController = require("../controllers/userController");
const userRouter = express.Router();

// userRouter.use()


userRouter
  .route("/users")
  .get(UserController.getUsers)
  .post(UserController.createUser);

userRouter
  .route("/users/:userID")
  .get(UserController.getUser)
  .put(UserController.updateUser)
  .delete(UserController.deleteUser);

module.exports = userRouter;