/*
  Warnings:

  - You are about to alter the column `createdAt` on the `room` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.
  - You are about to alter the column `updatedAt` on the `room` table. The data in that column could be lost. The data in that column will be cast from `String` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `room` MODIFY `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);
