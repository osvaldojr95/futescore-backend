import { User } from "@prisma/client";
import Joi from "joi";

const signinSchema = Joi.object<User>({
    email: Joi.string().required(),
    username: Joi.string().alphanum().required(),
    password: Joi.string().min(6).required(),
});

export default signinSchema;
