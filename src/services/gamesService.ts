import gamesRepository from "../repository/gamesRepository.js";

async function getStatistic(season: number, id: number) {
    const home = await gamesRepository.getStatisticBySide(season, id, true);
    const away = await gamesRepository.getStatisticBySide(season, id, false);
    const allStatistic = averageStatistic([...home, ...away]);
    const homeStatistic = averageStatistic(home);
    const awayStatistic = averageStatistic(away);

    return {
        goals: [homeStatistic.goals, allStatistic.goals, awayStatistic.goals],
        kicks: [homeStatistic.kicks, allStatistic.kicks, awayStatistic.kicks],
        ballPossesion: [
            homeStatistic.ballPossesion,
            allStatistic.ballPossesion,
            awayStatistic.ballPossesion,
        ],
        passes: [
            homeStatistic.passes,
            allStatistic.passes,
            awayStatistic.passes,
        ],
        passAcurracy: [
            homeStatistic.passAcurracy,
            allStatistic.passAcurracy,
            awayStatistic.passAcurracy,
        ],
        faults: [
            homeStatistic.faults,
            allStatistic.faults,
            awayStatistic.faults,
        ],
        yellowCards: [
            homeStatistic.yellowCards,
            allStatistic.yellowCards,
            awayStatistic.yellowCards,
        ],
        impediments: [
            homeStatistic.impediments,
            allStatistic.impediments,
            awayStatistic.impediments,
        ],
        corners: [
            homeStatistic.corners,
            allStatistic.corners,
            awayStatistic.corners,
        ],
    };
}

function averageStatistic(list: any) {
    const tam = list.length;
    let statistic = {
        goals: 0,
        kicks: 0,
        ballPossesion: 0,
        passes: 0,
        passAcurracy: 0,
        faults: 0,
        yellowCards: 0,
        impediments: 0,
        corners: 0,
    };
    list.forEach((game) => {
        statistic.goals += game.Games_Statistic[0].goals;
        statistic.kicks += game.Games_Statistic[0].kicks;
        statistic.ballPossesion += game.Games_Statistic[0].ballPossesion;
        statistic.passes += game.Games_Statistic[0].passes;
        statistic.passAcurracy += game.Games_Statistic[0].passAcurracy;
        statistic.faults += game.Games_Statistic[0].faults;
        statistic.yellowCards += game.Games_Statistic[0].yellowCards;
        statistic.impediments += game.Games_Statistic[0].impediments;
        statistic.corners += game.Games_Statistic[0].corners;
    });
    return {
        goals: statistic.goals / tam,
        kicks: statistic.kicks / tam,
        ballPossesion: statistic.ballPossesion / tam,
        passes: statistic.passes / tam,
        passAcurracy: statistic.passAcurracy / tam,
        faults: statistic.faults / tam,
        yellowCards: statistic.yellowCards / tam,
        impediments: statistic.impediments / tam,
        corners: statistic.corners / tam,
    };
}

export default {
    getStatistic,
};
