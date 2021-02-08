/*
  Warnings:

  - You are about to drop the column `roomId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `loginSecret` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `_roomtouser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_userfollow` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `likeb` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `room` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_roomtouser` DROP FOREIGN KEY `_roomtouser_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_roomtouser` DROP FOREIGN KEY `_roomtouser_ibfk_2`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_2`;

-- DropForeignKey
ALTER TABLE `comment` DROP FOREIGN KEY `comment_ibfk_2`;

-- DropForeignKey
ALTER TABLE `comment` DROP FOREIGN KEY `comment_ibfk_1`;

-- DropForeignKey
ALTER TABLE `file` DROP FOREIGN KEY `file_ibfk_1`;

-- DropForeignKey
ALTER TABLE `likeb` DROP FOREIGN KEY `likeb_ibfk_2`;

-- DropForeignKey
ALTER TABLE `likeb` DROP FOREIGN KEY `likeb_ibfk_1`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_1`;

-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_ibfk_1`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `roomId`,
    DROP COLUMN `loginSecret`;

-- DropTable
DROP TABLE `_roomtouser`;

-- DropTable
DROP TABLE `_userfollow`;

-- DropTable
DROP TABLE `comment`;

-- DropTable
DROP TABLE `file`;

-- DropTable
DROP TABLE `likeb`;

-- DropTable
DROP TABLE `message`;

-- DropTable
DROP TABLE `post`;

-- DropTable
DROP TABLE `room`;
