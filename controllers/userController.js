const { Op } = require("sequelize");
const { User } = require("../models");

module.exports.createUser = async (req, res, next) => {
  try{
  const { body } = req;

  const user = await User.create(body);

  res.status(201).send({ data: user });
  } catch (error){
    next(error);
  }
};

module.exports.getUsers = async (req, res, next) => {
  try {
  const users = await User.findAll();
    // const users = await User.findAll({
  //   attributes: [['first_name','name'], 'email', 'isMale'],
  // });
  // const users = await User.findAll({
  //   attributes: {
  //     exclude: ['password','createdAt','updatedAt']
  //   }
  // });
  // const users = await User.findAll({
  //   where: {
  //     isMale: true
  //   }
  // })
  // const users = await User.findAll({
  //   where: {
  //     [Op.or]: [{ firstName: "User" }, { id: 5 }],
  //   },
  // });
  res.send({ data: users });
  } catch (error){
    next(error);
  }
};

module.exports.getUser = async (req, res, next) => {
  try {
  const {
    params: { userId },
  } = req;
  // const user = await User.findOne({
  //   where: {
  //     id: userId,
  //   },
  // });

  const user = await User.findByPk(userId, {
    attributes: {
      exclude: ["password"],
    },
  });

  res.send({ data: user });
} catch (error) {
  next(error);
}
};

module.exports.updateUser = async (req, res, next) => {
  try{
  const {
    body,
    params: { userId },
  } = req;

  const [usersUpdated, [updatedUser]] = await User.update(body, {
    where: {
      id: userId,
    },
    returning: true,
  });
   if(usersUpdated !==1){
    throw new Error ('User not fount');
   }

  const userWithoutPassword = updatedUser.get();
  delete userWithoutPassword.password;
  userWithoutPassword.password = undefined;

  res.send({ data: userWithoutPassword });
} catch (error){
  next(error);
}
};

module.exports.updateUserInstance = async (req, res, next) => {
  try{
  const {
    body,
    params: { userId },
  } = req;

  const userToUpdate = await User.findByPk(userId);

  const updatedUser = await userToUpdate.update(body);

  res.send({ data: updatedUser });
} catch(error){
  next(error);
}
};

module.exports.deleteUser = async (req, res, next) => {
  try{
  const {
    params: { userId },
  } = req;

  const amountDeleted = await User.destroy({
    where: {
      id: userId,
    },
  });

  res.send({ data: amountDeleted });
} catch(error){
  next(error);
}
};

module.exports.deleteUserInstance = async (req, res, next) => {
  try{
  const {
    params: { userId },
  } = req;

  const user = await User.findByPk(userId);

  await user.destroy();
  
  res.send({data:user});
  } catch (error){
    next(error);
  }
};
