import leaguesRepository from "../repository/leaguesRepository.js";

async function findAll() {
    const leagues = await leaguesRepository.findAll();
    return leagues;
}

export default {
    findAll,
};
