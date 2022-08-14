import { prisma } from "./../config/database.js";

async function findAll() {
    return await prisma.leagues.findMany({
        include: {
            Seasons: true
        }
    });
}

export default {
    findAll,
};
