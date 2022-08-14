import { Request, Response } from "express";
import leaguesService from "../services/leaguesService.js";

export async function getAll(req: Request, res: Response) {
    const leagues = await leaguesService.findAll();
    res.send(leagues);
}
