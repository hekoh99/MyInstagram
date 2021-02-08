/*
  Warnings:

  - You are about to drop the `_userfollows` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_userfollows` DROP FOREIGN KEY `_userfollows_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_userfollows` DROP FOREIGN KEY `_userfollows_ibfk_2`;

-- CreateTable
CREATE TABLE `_UserFollow` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_UserFollow_AB_unique`(`A`, `B`),
INDEX `_UserFollow_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- DropTable
DROP TABLE `_userfollows`;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`A`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UserFollow` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
