import express from "express";
import { UserController } from "../modules/user/controller/user.controller";

var router = express.Router();


var userController = new UserController();

router.get("/users", userController.renderListOfUsersResource);
router.get("/users/:id", userController.renderSpecificUserResource);
router.delete("/users/:id", userController.obliterateUser);
router.patch("/users/:id", userController.editUser);
router.post("/users", userController.appendUserToListOfUsers);

export default router;
