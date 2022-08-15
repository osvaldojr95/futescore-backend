import { Router } from "express";
import authRouter from "./authRouter.js";
import leaguesRouter from "./leaguesRouter.js";
import seasonRouter from "./seasonRouter.js";
import gamesRouter from "./gamesRouter.js";

const router = Router();

router.use(authRouter);
router.use(leaguesRouter);
router.use(seasonRouter);
router.use(gamesRouter);

export default router;
