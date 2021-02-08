-- CreateTable
CREATE TABLE `comment` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,
    `postId` INT NOT NULL,
INDEX `post_like_delete`(`postId`),
INDEX `userId`(`userId`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comment` ADD FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comment` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
