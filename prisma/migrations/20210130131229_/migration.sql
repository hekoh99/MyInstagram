/*
  Warnings:

  - You are about to drop the column `toId` on the `message` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_4`;

-- AlterTable
ALTER TABLE `message` DROP COLUMN `toId`;
