/*
  Warnings:

  - You are about to drop the `_userfollow` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollow` DROP FOREIGN KEY `_userfollow_ibfk_2`;

-- CreateTable
CREATE TABLE `_UserFollows` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_UserFollows_AB_unique`(`A`, `B`),
INDEX `_UserFollows_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DropTable
DROP TABLE `_userfollow`;

-- AddForeignKey
ALTER TABLE `_UserFollows` ADD FOREIGN KEY (`A`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollows` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
