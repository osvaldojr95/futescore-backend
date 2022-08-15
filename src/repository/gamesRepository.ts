import { prisma } from "./../config/database.js";

async function getStatisticBySide(season: number, id: number, side: boolean) {
    if (side) {
        return await prisma.games.findMany({
            where: {
                seasonId: season,
                homeTeamId: id,
            },
            include: {
                Games_Statistic: {
                    where: {
                        teamId: id,
                    },
                },
            },
        });
    }
    return await prisma.games.findMany({
        where: {
            seasonId: season,
            awayTeamId: id,
        },
        include: {
            Games_Statistic: {
                where: {
                    teamId: id,
                },
            },
        },
    });
}

export default {
    getStatisticBySide,
};
