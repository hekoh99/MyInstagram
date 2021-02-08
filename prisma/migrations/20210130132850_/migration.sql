/*
  Warnings:

  - You are about to drop the `_participate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `room` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_participate` DROP FOREIGN KEY `_participate_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_participate` DROP FOREIGN KEY `_participate_ibfk_2`;

-- DropTable
DROP TABLE `_participate`;

-- DropTable
DROP TABLE `room`;
