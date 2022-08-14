import { Request, Response } from "express";
import seasonService from "../services/seasonService.js";

export async function getTeams(req: Request, res: Response) {
    const { id } = req.params;
    const teams = await seasonService.findTeams(+id);
    res.send({ teams });
}
