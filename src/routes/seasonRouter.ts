import { Router } from "express";
import { getTeams } from "../controllers/seasonController.js";

const seasonRouter = Router();

seasonRouter.get("/seasons/:id", getTeams);

export default seasonRouter;
