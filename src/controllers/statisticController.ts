import { Request, Response } from "express";
import gamesService from "./../services/gamesService.js";

export async function statisticByTeam(req: Request, res: Response) {
    const { season, id } = req.params;
    const statistic = await gamesService.getStatistic(+season, +id);
    res.send({ statistic });
}
