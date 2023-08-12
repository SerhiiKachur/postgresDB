const createHttpError = require("http-errors");
const { User } = require("../models");

module.exports.checkUserExistanceMW = async (req, res, next) => {
  try {
    const {
      params: { userId },
    } = req;
    const user = await User.findByPk(userId);

    if (!user) {
      return next(createHttpError(404, "User doesnot exist"));
    }

    req.user = user;
  } catch (error) {
    next(error);
  }
};
