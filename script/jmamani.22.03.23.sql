CREATE TABLE `products_images` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`image` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`order` INT(11) NULL DEFAULT '0',
	`product_id` BIGINT(20) UNSIGNED NOT NULL,
	`company_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '1',
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
);

