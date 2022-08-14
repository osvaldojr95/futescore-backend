/*
  Warnings:

  - You are about to drop the `Games` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Games_Statistic` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Leagues` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Rounds` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Season_Teams` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Seasons` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Teams` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Games" DROP CONSTRAINT "Games_awayTeamId_fkey";

-- DropForeignKey
ALTER TABLE "Games" DROP CONSTRAINT "Games_homeTeamId_fkey";

-- DropForeignKey
ALTER TABLE "Games" DROP CONSTRAINT "Games_roundId_fkey";

-- DropForeignKey
ALTER TABLE "Games" DROP CONSTRAINT "Games_seasonId_fkey";

-- DropForeignKey
ALTER TABLE "Games_Statistic" DROP CONSTRAINT "Games_Statistic_gameId_fkey";

-- DropForeignKey
ALTER TABLE "Games_Statistic" DROP CONSTRAINT "Games_Statistic_teamId_fkey";

-- DropForeignKey
ALTER TABLE "Rounds" DROP CONSTRAINT "Rounds_seasonId_fkey";

-- DropForeignKey
ALTER TABLE "Season_Teams" DROP CONSTRAINT "Season_Teams_leagueId_fkey";

-- DropForeignKey
ALTER TABLE "Season_Teams" DROP CONSTRAINT "Season_Teams_seasonId_fkey";

-- DropForeignKey
ALTER TABLE "Seasons" DROP CONSTRAINT "Seasons_leagueId_fkey";

-- DropForeignKey
ALTER TABLE "Teams" DROP CONSTRAINT "Teams_leagueId_fkey";

-- DropTable
DROP TABLE "Games";

-- DropTable
DROP TABLE "Games_Statistic";

-- DropTable
DROP TABLE "Leagues";

-- DropTable
DROP TABLE "Rounds";

-- DropTable
DROP TABLE "Season_Teams";

-- DropTable
DROP TABLE "Seasons";

-- DropTable
DROP TABLE "Teams";

-- CreateTable
CREATE TABLE "leagues" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "leagues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seasons" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "seasons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teams" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "leagueId" INTEGER NOT NULL,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "season_teams" (
    "id" SERIAL NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,

    CONSTRAINT "season_teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "rounds" (
    "id" SERIAL NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,

    CONSTRAINT "rounds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "games" (
    "id" SERIAL NOT NULL,
    "roundId" INTEGER NOT NULL,
    "seasonId" INTEGER NOT NULL,
    "homeTeamId" INTEGER NOT NULL,
    "awayTeamId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,

    CONSTRAINT "games_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "games_statistic" (
    "id" SERIAL NOT NULL,
    "gameId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,
    "goals" INTEGER NOT NULL,
    "kicks" INTEGER,
    "ballPossesion" INTEGER,
    "pases" INTEGER,
    "passAcurracy" INTEGER,
    "faults" INTEGER,
    "yellowCards" INTEGER,
    "impediments" INTEGER,
    "corners" INTEGER,

    CONSTRAINT "games_statistic_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "seasons" ADD CONSTRAINT "seasons_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "leagues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teams" ADD CONSTRAINT "teams_leagueId_fkey" FOREIGN KEY ("leagueId") REFERENCES "leagues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "season_teams" ADD CONSTRAINT "season_teams_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "season_teams" ADD CONSTRAINT "season_teams_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rounds" ADD CONSTRAINT "rounds_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games" ADD CONSTRAINT "games_roundId_fkey" FOREIGN KEY ("roundId") REFERENCES "rounds"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games" ADD CONSTRAINT "games_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games" ADD CONSTRAINT "games_homeTeamId_fkey" FOREIGN KEY ("homeTeamId") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games" ADD CONSTRAINT "games_awayTeamId_fkey" FOREIGN KEY ("awayTeamId") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games_statistic" ADD CONSTRAINT "games_statistic_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "games"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "games_statistic" ADD CONSTRAINT "games_statistic_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
