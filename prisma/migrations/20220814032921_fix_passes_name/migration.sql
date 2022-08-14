/*
  Warnings:

  - You are about to drop the column `pases` on the `games_statistic` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "games_statistic" DROP COLUMN "pases",
ADD COLUMN     "passes" INTEGER;
