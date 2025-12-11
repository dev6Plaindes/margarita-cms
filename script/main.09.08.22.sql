
CREATE TABLE `portafolios` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`caption` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`description` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`slug` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`overview` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`image` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`video` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`url` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`date` DATE NULL DEFAULT NULL,
	`price` DECIMAL(9,2) NULL DEFAULT NULL,
	`status` INT(1) NULL DEFAULT '1',
	`category_id` BIGINT(20) UNSIGNED NOT NULL,
	`teacher_id` BIGINT(20) NULL DEFAULT '0',
	`type_id` BIGINT(20) UNSIGNED NOT NULL,
	`company_id` BIGINT(20) UNSIGNED NOT NULL,
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_portafolios_company_id_foreign` (`company_id`) USING BTREE,
	CONSTRAINT `fk_portafolios_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE `menus_portafolios` (
	`menu_id` BIGINT(20) UNSIGNED NOT NULL,
	`portafolio_id` BIGINT(20) UNSIGNED NOT NULL,
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`menu_id`, `portafolio_id`) USING BTREE,
	INDEX `idx_menus_portafolios_id_foreign` (`portafolio_id`) USING BTREE,
	CONSTRAINT `fk_menus_portafolios_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `fk_menus_portafolios_id_foreign` FOREIGN KEY (`portafolio_id`) REFERENCES `portafolios` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE `topics_portafolios` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`order` INT(11) NULL DEFAULT '0',
	`portafolio_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `subtopics_portafolios` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`url` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`order` INT(11) NULL DEFAULT '0',
	`design_icon_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`topic_portafolio_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
);

