const groupRouter = require('express').Router();
const GroupController = require('../controllers/groupController');

groupRouter.post('/', GroupController.createGroup);
groupRouter.get('/:userId',GroupController.getUserGroups);

module.exports = groupRouter;