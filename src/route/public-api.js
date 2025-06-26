import express from "express";
import userController from "../controller/user-controller.js";
import healthController from "../controller/health-controller.js";

const publicRouter = new express.Router();
publicRouter.post('/users', userController.register);
publicRouter.post('/users/login', userController.login);
publicRouter.get('/ping', healthController.ping);

export {
    publicRouter
}
