-- AlterTable
ALTER TABLE `user` ADD COLUMN     `loginSecret` VARCHAR(191),
    ADD COLUMN     `roomId` INT;

-- CreateTable
CREATE TABLE `Room` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `createdAt` VARCHAR(191) NOT NULL,
    `updatedAt` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Message` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(191) NOT NULL,
    `createdAt` VARCHAR(191) NOT NULL,
    `updatedAt` VARCHAR(191) NOT NULL,
    `userId` INT NOT NULL,
    `roomId` INT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_RoomTouser` (
    `A` INT NOT NULL,
    `B` INT NOT NULL,
UNIQUE INDEX `_RoomTouser_AB_unique`(`A`, `B`),
INDEX `_RoomTouser_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RoomTouser` ADD FOREIGN KEY (`A`) REFERENCES `Room`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_RoomTouser` ADD FOREIGN KEY (`B`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
