-- CreateTable
CREATE TABLE `_userfollow` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_userfollow_AB_unique`(`A`, `B`),
INDEX `_userfollow_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_userfollow` ADD FOREIGN KEY (`A`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_userfollow` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
