/*
  Warnings:

  - You are about to drop the `_userfollow` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_2`;

-- CreateTable
CREATE TABLE `post` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `caption` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `postId` INT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DropTable
DROP TABLE `_userfollow`;

-- AddForeignKey
ALTER TABLE `post` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post` ADD FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
