import express from 'express';
import { RootController } from '../modules/root/controller/root.controller';

var router = express.Router()

var rootController = new RootController()

router.get('/', rootController.renderRootResource)

export default router

