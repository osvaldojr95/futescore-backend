import seasonRepository from "../repository/seasonRepository.js";

async function findTeams(id: number) {
    const teams = await seasonRepository.findTeams(id);
    if (!teams) throw { type: "notFound" };
    return teams;
}

export default {
    findTeams,
};
