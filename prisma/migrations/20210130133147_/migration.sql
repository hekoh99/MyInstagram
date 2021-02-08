/*
  Warnings:

  - You are about to drop the `comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `likeb` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.

*/
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
ALTER TABLE `post` DROP FOREIGN KEY `post_ibfk_1`;

-- DropTable
DROP TABLE `comment`;

-- DropTable
DROP TABLE `file`;

-- DropTable
DROP TABLE `likeb`;

-- DropTable
DROP TABLE `post`;
