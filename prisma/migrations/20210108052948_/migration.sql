/*
  Warnings:

  - You are about to drop the column `authorId` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `user` table. All the data in the column will be lost.
  - The migration will add a unique constraint covering the columns `[nickname]` on the table `User`. If there are existing duplicate values, the migration will fail.
  - The migration will add a unique constraint covering the columns `[email]` on the table `User`. If there are existing duplicate values, the migration will fail.
  - Added the required column `caption` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Made the column `email` on table `user` required. The migration will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_ibfk_1`;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `authorId`,
    ADD COLUMN     `caption` VARCHAR(191) NOT NULL,
    ADD COLUMN     `userId` INT NOT NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `name`,
    ADD COLUMN     `nickname` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN     `firstname` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN     `lastname` VARCHAR(191) NOT NULL DEFAULT '',
    MODIFY `email` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `Like` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `postId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,
    `postId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `File` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `postId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UserFollow` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_UserFollow_AB_unique`(`A`, `B`),
INDEX `_UserFollow_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `User.nickname_unique` ON `User`(`nickname`);

-- CreateIndex
CREATE UNIQUE INDEX `User.email_unique` ON `User`(`email`);

-- AddForeignKey
ALTER TABLE `Like` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Like` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `File` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`A`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
