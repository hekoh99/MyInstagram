/*
  Warnings:

  - You are about to drop the column `fromId` on the `message` table. All the data in the column will be lost.
  - Added the required column `userId` to the `message` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `message_ibfk_3`;

-- AlterTable
ALTER TABLE `message` DROP COLUMN `fromId`,
    ADD COLUMN     `userId` INT NOT NULL;

-- CreateIndex
CREATE INDEX `userId` ON `message`(`userId`);

-- AddForeignKey
ALTER TABLE `message` ADD FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
