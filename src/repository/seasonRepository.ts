import { prisma } from "./../config/database.js";

async function findTeams(id: number) {
    return await prisma.teams.findMany({
        include: {
            Season_Teams: {
                where: {
                    seasonId: id,
                },
            },
        },
    });
}

export default {
    findTeams,
};
