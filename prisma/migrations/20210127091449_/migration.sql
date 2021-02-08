/*
  Warnings:

  - You are about to drop the `_userfollow` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_2`;

-- DropForeignKey
ALTER TABLE `_roomtouser` DROP FOREIGN KEY `_roomtouser_ibfk_1`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- DropTable
DROP TABLE `_userfollow`;

-- AddForeignKey
ALTER TABLE `_RoomTouser` ADD FOREIGN KEY (`A`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
