import { Router } from "express";
import validSchema from "../middlewares/validSchema.js";
import userSchema from "../schemas/userSchema.js";
import signinSchema from "../schemas/signinSchema.js";
import { signUp, signIn } from "../controllers/authController.js";

const authRouter = Router();

authRouter.post("/signup", validSchema(userSchema), signUp);
authRouter.post("/signin", validSchema(signinSchema), signIn);

export default authRouter;
