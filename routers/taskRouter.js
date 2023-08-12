const taskRouter = require("express").Router();
const TaskController = require("../controllers/taskController");

taskRouter.post("/", TaskController.createTask);
taskRouter.get("/", TaskController.getTasks);

taskRouter.get("/:taskId", TaskController.getTask);
taskRouter.put("/:taskId", TaskController.updateTask);
taskRouter.delete("/:taskId", TaskController.deleteTaks);

module.exports = taskRouter;
