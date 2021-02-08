-- AlterIndex
ALTER TABLE `file` RENAME INDEX `postId` TO `post_file_delete`;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `User.email_unique` TO `user.email_unique`;

-- AlterIndex
ALTER TABLE `user` RENAME INDEX `User.nickname_unique` TO `user.nickname_unique`;
