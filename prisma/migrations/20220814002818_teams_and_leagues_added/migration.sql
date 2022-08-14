-- CreateTable
CREATE TABLE "Leagues" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Leagues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Seasons" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "Seasons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teams" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "Teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Season_Teams" (
    "id" SERIAL NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "Season_Teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rounds" (
    "id" SERIAL NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,

    CONSTRAINT "Rounds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Games" (
    "id" SERIAL NOT NULL,
    "roundId" INTEGER NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "homeTeamId" INTEGER NOT NULL,
    "awayTeamId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,

    CONSTRAINT "Games_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Games_Statistic" (
    "id" SERIAL NOT NULL,
    "gameId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,
    "goals" INTEGER NOT NULL,
    "kicks" INTEGER NOT NULL,
    "ballPossesion" INTEGER NOT NULL,
    "pases" INTEGER NOT NULL,
    "passAcurracy" INTEGER NOT NULL,
    "faults" INTEGER NOT NULL,
    "yellowCards" INTEGER NOT NULL,
    "impediments" INTEGER NOT NULL,
    "corners" INTEGER NOT NULL,

    CONSTRAINT "Games_Statistic_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Seasons" ADD CONSTRAINT "Seasons_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "Leagues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teams" ADD CONSTRAINT "Teams_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "Leagues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Season_Teams" ADD CONSTRAINT "Season_Teams_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "Leagues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Season_Teams" ADD CONSTRAINT "Season_Teams_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "Seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rounds" ADD CONSTRAINT "Rounds_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "Seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games" ADD CONSTRAINT "Games_roundId_fkey" FOREIGN KEY ("roundId") REFERENCES "Rounds"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games" ADD CONSTRAINT "Games_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "Seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games" ADD CONSTRAINT "Games_homeTeamId_fkey" FOREIGN KEY ("homeTeamId") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games" ADD CONSTRAINT "Games_awayTeamId_fkey" FOREIGN KEY ("awayTeamId") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games_Statistic" ADD CONSTRAINT "Games_Statistic_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Games"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Games_Statistic" ADD CONSTRAINT "Games_Statistic_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
