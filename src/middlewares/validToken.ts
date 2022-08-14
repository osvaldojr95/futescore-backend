import jwt from "jsonwebtoken";
import { Request, Response, NextFunction } from "express";
import userService from "../services/userService.js";
import "../config/config.js";

export default async function validToken(
    req: Request,
    res: Response,
    next: NextFunction
) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "").trim();
    if (!token) {
        res.locals.user = null;
    } else {
        try {
            const session = jwt.verify(token, process.env.SECRET_KEY);
            res.locals.user = await userService.findBySession(session.session);
        } catch (err) {
            res.locals.user = null;
        }
    }

    next();
}
