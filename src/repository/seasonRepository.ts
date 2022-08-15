import { prisma } from "./../config/database.js";

async function findTeams(id: number) {
    return await prisma.season_Teams.findMany({
        where: {
            seasonId: id,
        },
        include: {
            teams: true,
        },
    });
}

export default {
    findTeams,
};
