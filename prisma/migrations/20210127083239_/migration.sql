-- CreateTable
CREATE TABLE `Post` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `caption` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `File` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `postId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Post` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `File` ADD FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `user.email_unique` TO `User.email_unique`;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `user.nickname_unique` TO `User.nickname_unique`;
