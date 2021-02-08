-- AlterIndex
ALTER TABLE `_userfollow` RENAME INDEX `_UserFollow_AB_unique` TO `_userfollow_AB_unique`;

-- AlterIndex
ALTER TABLE `_userfollow` RENAME INDEX `_UserFollow_B_index` TO `_userfollow_B_index`;

-- AlterIndex
ALTER TABLE `comment` RENAME INDEX `postId` TO `post_like_delete`;
