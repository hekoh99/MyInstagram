/*
  Warnings:

  - You are about to drop the column `loginSecret` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `roomId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `_roomtouser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `room` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_roomtouser` DROP FOREIGN KEY `_roomtouser_ibfk_3`;

-- DropForeignKey
ALTER TABLE `_roomtouser` DROP FOREIGN KEY `_roomtouser_ibfk_2`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_1`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `loginSecret`,
    DROP COLUMN `roomId`;

-- DropTable
DROP TABLE `_roomtouser`;

-- DropTable
DROP TABLE `message`;

-- DropTable
DROP TABLE `room`;
