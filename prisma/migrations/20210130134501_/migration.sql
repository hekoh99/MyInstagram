/*
  Warnings:

  - You are about to drop the column `postId` on the `post` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_ibfk_2`;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `postId`;
