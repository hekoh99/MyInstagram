/*
  Warnings:

  - You are about to drop the column `userId` on the `room` table. All the data in the column will be lost.
  - You are about to drop the column `roomId` on the `user` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `room` DROP FOREIGN KEY `room_ibfk_1`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- AlterTable
ALTER TABLE `room` DROP COLUMN `userId`;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `roomId`;

-- CreateTable
CREATE TABLE `_participate` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_participate_AB_unique`(`A`, `B`),
INDEX `_participate_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_participate` ADD FOREIGN KEY (`A`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_participate` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
