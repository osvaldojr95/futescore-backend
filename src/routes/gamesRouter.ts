import { Router } from "express";
import { statisticByTeam } from "../controllers/statisticController.js";

const gamesRouter = Router();

gamesRouter.get("/seasons/:season/team/:id", statisticByTeam);

export default gamesRouter;
