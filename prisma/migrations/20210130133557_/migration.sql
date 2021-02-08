/*
  Warnings:

  - You are about to drop the `_userfollow` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_2`;

-- DropTable
DROP TABLE `_userfollow`;
