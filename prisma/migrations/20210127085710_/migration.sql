-- CreateTable
CREATE TABLE `Comment` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,
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

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`A`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AlterIndex
ALTER TABLE `likeb` RENAME INDEX `postId` TO `post_like_delete`;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `User.email_unique` TO `user.email_unique`;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `User.nickname_unique` TO `user.nickname_unique`;
