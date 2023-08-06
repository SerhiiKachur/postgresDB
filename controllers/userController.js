const { Op } = require("sequelize");
const { User } = require("../models");

module.exports.createUser = async (req, res) => {
  const { body } = req;

  const user = await User.create(body);

  res.send({ data: user });
};

module.exports.getUsers = async (req, res) => {
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

  const users = await User.findAll({
    where: {
      [Op.or]: [{ firstName: "User" }, { id: 5 }],
    },
  });

  res.send({ data: users });
};

module.exports.getUser = async (req, res) => {
  const {
    params: { userId },
  } = req;
  // const user = await User.findOne({
  //   where: {
  //     id: userId,
  //   },
  // });

  const user = await User.findByPk(userId,{
    attributes: {
      exclude:['password'],
    },
  });

  res.send({ data: user });
};

module.exports.updateUser = (req, res) => {};

module.exports.deleteUser = (req, res) => {
  const {
    params: { userId },
  } = req;

  res.send(`user ${userId} is deleted`);
};
