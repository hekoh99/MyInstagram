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
ALTER TABLE `like` DROP FOREIGN KEY `like_ibfk_2`;

-- DropForeignKey
ALTER TABLE `like` DROP FOREIGN KEY `like_ibfk_1`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_2`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_1`;

-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_ibfk_1`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- AlterTable
ALTER TABLE `user` ADD COLUMN     `loginSecret` VARCHAR(191);

-- AddForeignKey
ALTER TABLE `_RoomToUser` ADD FOREIGN KEY (`A`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RoomToUser` ADD FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`A`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `File` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Like` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Like` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
