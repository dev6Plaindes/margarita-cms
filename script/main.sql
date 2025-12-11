
-- Volcando estructura para tabla db_web_admin.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ruc` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `email_contact` varchar(255) DEFAULT NULL,
  `phone_contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `terms_and_conditions` text DEFAULT NULL,
  `privacy_policies` text DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.companies_colors
CREATE TABLE IF NOT EXISTS `companies_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.companies_logos
CREATE TABLE IF NOT EXISTS `companies_logos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contents_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_contents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.contents_colors
CREATE TABLE IF NOT EXISTS `contents_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.contents_images
CREATE TABLE IF NOT EXISTS `contents_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.menus_sections
CREATE TABLE IF NOT EXISTS `menus_sections` (
  `menu_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `order` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`section_id`) USING BTREE,
  KEY `idx_menus_sections_section_id_foreign` (`section_id`) USING BTREE,
  CONSTRAINT `fk_menus_sections_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menus_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_messages_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_messages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `type_id` bigint(20) unsigned DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sections_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_sections_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.sections_contents
CREATE TABLE IF NOT EXISTS `sections_contents` (
  `section_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `order` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`,`content_id`) USING BTREE,
  KEY `idx_sections_contents_content_id_foreign` (`content_id`) USING BTREE,
  CONSTRAINT `fk_sections_contents_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sections_contents_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.transfers
CREATE TABLE IF NOT EXISTS `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cci` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_web_admin.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT 'M',
  `profile_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `idx_users_profile_id_foreign` (`profile_id`) USING BTREE,
  CONSTRAINT `fk_users_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `products` (
	`id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`caption` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`description` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`image` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`video` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`url` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`price` DECIMAL(9,2) NULL DEFAULT NULL,
	`status` INT(1) NULL DEFAULT '1',
	`category_id` BIGINT(20) UNSIGNED NOT NULL,
	`type_id` BIGINT(20) UNSIGNED NOT NULL,
	`company_id` BIGINT(20) UNSIGNED NOT NULL,
	`created_at` DATETIME NULL DEFAULT current_timestamp(),
	`updated_at` DATETIME NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`deleted_at` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_products_company_id_foreign` (`company_id`) USING BTREE,
	CONSTRAINT `fk_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- La exportación de datos fue deseleccionada.

INSERT INTO `companies` (`name`) values ('Mi Empresa');

INSERT INTO `profiles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Master', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL);
INSERT INTO `profiles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Administrador', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL);
INSERT INTO `profiles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Cliente', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL);


INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Master', 'Usuario', 'master@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 1, '2021-07-16 21:54:59', '2021-07-16 21:54:59', NULL);
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Admin', 'Usuario', 'admin@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 2, '2021-07-16 21:54:59', '2021-08-02 21:03:02', NULL);
