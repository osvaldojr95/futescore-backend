import { Router } from "express";
import { getAll } from "../controllers/leaguesController.js";

const leaguesRouter = Router();

leaguesRouter.get("/leagues", getAll);

export default leaguesRouter;
