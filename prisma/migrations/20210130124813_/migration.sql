/*
  Warnings:

  - You are about to drop the column `userId` on the `message` table. All the data in the column will be lost.
  - Added the required column `fromId` to the `message` table without a default value. This is not possible if the table is not empty.
  - Added the required column `toId` to the `message` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_1`;

-- AlterTable
ALTER TABLE `message` DROP COLUMN `userId`,
    ADD COLUMN     `fromId` INT NOT NULL,
    ADD COLUMN     `toId` INT NOT NULL;

-- CreateIndex
CREATE INDEX `fromId` ON `message`(`fromId`);

-- AddForeignKey
ALTER TABLE `message` ADD FOREIGN KEY (`fromId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `message` ADD FOREIGN KEY (`toId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
