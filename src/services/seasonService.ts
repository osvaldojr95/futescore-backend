import seasonRepository from "../repository/seasonRepository.js";

async function findTeams(id: number) {
    let teams = await seasonRepository.findTeams(id);
    if (!teams) throw { type: "notFound" };
    return teams.map((item) => {
        return item.teams;
    });
}

export default {
    findTeams,
};
