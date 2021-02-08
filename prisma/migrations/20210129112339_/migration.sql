/*
  Warnings:

  - You are about to alter the column `createdAt` on the `message` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.
  - You are about to alter the column `updatedAt` on the `message` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `message` MODIFY `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);
