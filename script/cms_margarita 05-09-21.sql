-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db_margarita
CREATE DATABASE IF NOT EXISTS `db_margarita` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_margarita`;

-- Volcando estructura para tabla db_margarita.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.categories: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `color`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Piel cosmética', '#b89a9a', 1, '2021-09-02 12:07:52', '2021-09-02 12:07:52', NULL),
	(2, 'Farmacia', '#e6e6e6', 1, '2021-09-02 12:08:09', '2021-09-02 12:08:09', NULL),
	(3, 'Limpieza', '#73023d', 1, '2021-09-02 12:08:22', '2021-09-02 12:08:22', NULL),
	(4, 'Cuidado', '#45e0d6', 1, '2021-09-02 12:08:38', '2021-09-02 12:08:38', NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.characteristics
CREATE TABLE IF NOT EXISTS `characteristics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `design_icon_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `product_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.characteristics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url_codigo` varchar(250) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT 0,
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_companies_templates` (`template_id`),
  CONSTRAINT `FK_companies_templates` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `description`, `url_codigo`, `template_id`, `ruc`, `meta_title`, `email_contact`, `phone_contact`, `address`, `favicon`, `terms_and_conditions`, `privacy_policies`, `facebook_link`, `whatsapp_link`, `twitter_link`, `linkedin_link`, `instagram_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ML STETIC', 'Lorem ipsum dolor sit ametcon, sectetur adipiscing elit. Phasellus vehic sagittis euismod.', 'app.margarita.com', 1, '', 'ML STETIC', 'info@mlstetic.com', '+51 999 999 999', '', '/upload/company/16287263946114647a0829e-ms-icon-150x150.png', '', '', 'https://www.facebook.com/mlstetic', '+51 999 999 999', '', '', 'https://www.instagram.com/ml.stetic/?hl=es', '2021-08-10 10:57:27', '2021-08-30 19:35:40', NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.companies_colors
CREATE TABLE IF NOT EXISTS `companies_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_colors: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `companies_colors` DISABLE KEYS */;
INSERT INTO `companies_colors` (`id`, `color`, `alias`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '#4e2271', 'for', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:19', NULL),
	(2, '#bfbfbd', 'one', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:24', NULL),
	(3, '#b49f5e', 'two', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:28', NULL),
	(4, '#000000', 'five', 1, '2021-08-11 19:01:12', '2021-08-13 15:52:51', NULL),
	(5, '#000000', 'three', 1, '2021-08-11 19:01:12', '2021-08-13 15:52:57', NULL),
	(6, '#dabb69', 'six', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:42', NULL),
	(7, '#ececec', 'seven', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:45', NULL);
/*!40000 ALTER TABLE `companies_colors` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.companies_logos
CREATE TABLE IF NOT EXISTS `companies_logos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_logos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `companies_logos` DISABLE KEYS */;
INSERT INTO `companies_logos` (`id`, `logo`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '/upload/logos/162872641661146490a9e8e-logo.png', 1, '2021-08-11 19:00:16', '2021-08-11 19:00:16', NULL),
	(2, 'logo.png', 1, '2021-08-11 19:00:16', '2021-08-13 15:40:19', '2021-08-13 15:40:18'),
	(3, '/upload/logos/1630370279612d79e7c88c2-logo.png', 1, '2021-08-30 19:36:28', '2021-08-30 19:37:59', NULL);
/*!40000 ALTER TABLE `companies_logos` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `section_id` bigint(20) unsigned DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contents_company_id_foreign` (`company_id`) USING BTREE,
  KEY `FK_contents_contents_types` (`type_id`),
  KEY `FK_contents_sections` (`section_id`),
  CONSTRAINT `FK_contents_contents_types` FOREIGN KEY (`type_id`) REFERENCES `contents_types` (`id`),
  CONSTRAINT `FK_contents_sections` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `fk_contents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` (`id`, `name`, `caption`, `description`, `image`, `file`, `color`, `status`, `section_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 'Empiece a aprender de nuestros expertos', 'kipso-icon-training', '', NULL, NULL, NULL, 1, 3, 2, 1, '2021-08-12 16:52:36', '2021-08-30 17:34:51', NULL),
	(6, 'Mejore sus habilidades con nosotros ahora', 'kipso-icon-knowledge', '', NULL, NULL, NULL, 1, 3, 2, 1, '2021-08-12 16:53:37', '2021-08-30 17:34:54', NULL),
	(7, 'Capacitados', '4890', '', NULL, NULL, NULL, 1, 3, 3, 1, '2021-08-12 16:52:36', '2021-08-30 17:35:39', NULL),
	(8, 'Especialízate<br>en estética', '¿Estas listo para aprender?', NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2021-08-17 17:40:04', '2021-08-30 18:21:24', NULL),
	(12, 'Especialízate<br>en estética', '¿Estas listo para aprender?', '', NULL, NULL, NULL, 1, 1, 1, 1, '2021-08-17 17:41:32', '2021-08-30 17:37:40', NULL),
	(14, 'Bienvenido a\r\nML STETIC donde\r\nestudiamos la belleza', 'Somos un centro de especialización y asesoría en estética profesional y dermocosmética, potenciando tu experiencia elevamos tu competitividad profesional, con un enfoque práctico y multidisciplinario.', '', NULL, NULL, NULL, 1, 3, 1, 1, '2021-08-12 16:50:50', '2021-08-30 17:39:38', NULL),
	(15, 'La única\r\nmisión de ML STETIC\r\nes potenciar tu experiencia y\r\nconocimientos', 'https://www.youtube.com/embed/VJSwxINgJaw?controls=0', '', NULL, NULL, NULL, 1, 4, 1, 1, '2021-08-30 13:10:18', '2021-08-30 17:15:53', NULL),
	(16, '¡Registrate ahora y obten una clase gratis!', 'https://www.youtube.com/embed/VJSwxINgJaw', 'Teoria y practica es la sinergia que todo esteticista debe de manejar, los principios cientificos de piel se complementan y se aplican en la practica.', NULL, NULL, NULL, 1, 5, 4, 1, '2021-08-30 17:18:06', '2021-08-30 17:22:13', NULL),
	(19, 'Beneficios de aprender con ML STETIC', NULL, NULL, NULL, NULL, NULL, 1, 6, 8, 1, '2021-08-30 17:59:12', '2021-09-02 22:19:02', '2021-08-30 18:01:23'),
	(20, 'Beneficios de aprender con ML STETIC', 'CCAS, ML STETIC , rompe con el esquema robotizado de la estética convencional, creyendo en la libertad de creación y diseño de tratamientos estéticos integrales basándonos en el CONOCIMIENTO DE LA CIENCIA.\r\n• Modalidad semi presencial\r\n• Modalidad remota 100% online\r\n• Metodología patentada\r\n• Enseñanza personalizada', NULL, NULL, NULL, NULL, 1, 6, 1, 1, '2021-08-30 18:00:41', '2021-08-30 18:03:55', NULL),
	(21, 'Cursos profesionales', 'kipso-icon-strategy', NULL, NULL, NULL, NULL, 1, 6, 2, 1, '2021-08-30 18:01:52', '2021-08-30 18:03:50', NULL),
	(22, 'Aprendizaje en vivo', 'kipso-icon-training', NULL, NULL, NULL, NULL, 1, 6, 2, 1, '2021-08-30 18:02:15', '2021-08-30 18:03:51', NULL),
	(23, 'Profesores expertos', 'kipso-icon-human-resources', NULL, NULL, NULL, NULL, 1, 6, 2, 1, '2021-08-30 18:02:34', '2021-08-30 18:03:51', NULL),
	(24, 'www.google.com', NULL, NULL, NULL, NULL, NULL, 1, 7, 5, 1, '2021-08-30 18:24:53', '2021-08-30 18:25:50', NULL),
	(25, 'www.facebook.com', NULL, NULL, NULL, NULL, NULL, 1, 7, 5, 1, '2021-08-30 18:25:16', '2021-08-30 18:25:53', NULL),
	(26, 'www.twitter.com', NULL, NULL, NULL, NULL, NULL, 1, 7, 5, 1, '2021-08-30 18:25:39', '2021-08-30 18:25:55', NULL),
	(27, 'Tenemos los mejores profesores en todas las materias.', 'Lorem ipsum gravida nibh vel velit auctor aliquetnean sollicitudin, lorem quis bibendum auci elit\r\nconsequat is simply free text available in the psutis sem nibh id eis sed odio sit amet.', NULL, NULL, NULL, NULL, 1, 8, 7, 1, '2021-08-30 18:34:43', '2021-09-02 22:16:10', NULL),
	(28, 'imagen 1', NULL, NULL, NULL, NULL, NULL, 1, 9, 6, 1, '2021-09-02 16:09:18', '2021-09-02 16:09:18', NULL),
	(29, 'Imagen 2', NULL, NULL, NULL, NULL, NULL, 1, 9, 6, 1, '2021-09-02 16:09:43', '2021-09-02 16:09:43', NULL),
	(30, 'Imagen 3', NULL, NULL, NULL, NULL, NULL, 1, 9, 6, 1, '2021-09-02 16:09:58', '2021-09-02 16:09:58', NULL),
	(31, 'Imagen 4', NULL, NULL, NULL, NULL, NULL, 1, 9, 6, 1, '2021-09-02 16:10:23', '2021-09-02 16:10:23', NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.contents_colors
CREATE TABLE IF NOT EXISTS `contents_colors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_colors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contents_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents_colors` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.contents_images
CREATE TABLE IF NOT EXISTS `contents_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_images: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `contents_images` DISABLE KEYS */;
INSERT INTO `contents_images` (`id`, `image`, `content_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(7, '/upload/images/1628804846611596eed735a-slider-1-scratch.png', 8, '2021-08-12 16:47:26', '2021-08-19 10:47:50', NULL),
	(8, '/upload/images/1630365694612d67feaf211-chica-piel.png', 8, '2021-08-12 16:47:26', '2021-08-30 18:21:34', NULL),
	(10, '/upload/images/1628805070611597ce06545-estudiante-1.jpg', 14, '2021-08-12 16:51:10', '2021-08-30 15:10:18', '2021-08-30 15:10:18'),
	(16, '/upload/images/1628804846611596eed735a-slider-1-scratch.png', 12, '2021-08-12 16:47:26', '2021-08-19 10:57:12', NULL),
	(17, '/upload/images/1628804846611596eed0064-chica-piel.png', 12, '2021-08-12 16:47:26', '2021-08-19 10:57:16', NULL),
	(18, '/upload/images/1630347129612d1f79e6395-estudiante-2.jpg', 15, '2021-08-30 13:12:09', '2021-08-30 13:12:09', NULL),
	(19, '/upload/images/1630354900612d3dd42f02c-estudiante-1.jpg', 14, '2021-08-30 15:21:40', '2021-08-30 15:23:05', '2021-08-30 15:23:05'),
	(20, '/upload/images/1630355026612d3e529198e-estudiante-1.jpg', 14, '2021-08-30 15:23:46', '2021-08-30 15:25:36', '2021-08-30 15:25:36'),
	(21, '/upload/images/1630356766612d451e76756-estudiante-1.jpg', 14, '2021-08-30 15:52:46', '2021-08-30 16:17:45', NULL),
	(22, '/upload/images/1630364473612d63399fd04-estudiante-3.jpg', 20, '2021-08-30 18:01:13', '2021-08-30 18:01:13', NULL),
	(23, '/upload/images/1630365893612d68c52faa0-logo-dark.png', 24, '2021-08-30 18:24:53', '2021-08-30 18:24:53', NULL),
	(24, '/upload/images/1630365916612d68dc743a6-logo.png', 25, '2021-08-30 18:25:16', '2021-08-30 18:25:16', NULL),
	(25, '/upload/images/1630365939612d68f33bf6a-logo-dark.png', 26, '2021-08-30 18:25:39', '2021-08-30 18:25:39', NULL),
	(26, '/upload/images/1630366483612d6b13f3093-profesional-1.png', 27, '2021-08-30 18:34:43', '2021-08-30 18:34:43', NULL),
	(27, '/upload/images/163061695861313d7eb8a03-estudiante-2.jpg', 28, '2021-09-02 16:09:18', '2021-09-02 16:09:18', NULL),
	(28, '/upload/images/163061698361313d979b5fc-estudiante-2.jpg', 29, '2021-09-02 16:09:43', '2021-09-02 16:09:43', NULL),
	(29, '/upload/images/163061699861313da6decb6-estudiante-5.jpg', 30, '2021-09-02 16:09:58', '2021-09-02 16:09:58', NULL),
	(30, '/upload/images/163061702361313dbfaeba1-estudiante-6.jpg', 31, '2021-09-02 16:10:23', '2021-09-02 16:10:23', NULL);
/*!40000 ALTER TABLE `contents_images` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.contents_types
CREATE TABLE IF NOT EXISTS `contents_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create` int(11) DEFAULT 1,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `settings` CHECK (json_valid(`settings`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_types: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `contents_types` DISABLE KEYS */;
INSERT INTO `contents_types` (`id`, `name`, `alias`, `settings`, `create`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Banner', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-25 10:23:39', '2021-09-02 22:14:15', NULL),
	(2, 'Caracteristica', 'caracterisitca', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "code-icono", \r\n        "type": "input"\r\n    }\r\n}', 1, 1, '2021-08-25 10:24:12', '2021-09-02 22:17:21', NULL),
	(3, 'Capacitados', 'capacitados', '{ \r\n    "name": {\r\n        "label": "Atributo", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Cantidad", \r\n        "type": "input"\r\n    }\r\n}', 1, 1, '2021-08-25 10:24:18', '2021-09-02 22:17:13', NULL),
	(4, 'Registros', 'registro', '{ \r\n    "name": {\r\n        "label": "Promoción", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Video Embebido", \r\n        "type": "input"\r\n    }, \r\n    "description": {\r\n        "label": "Descripción Video", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 1, '2021-08-30 17:21:23', '2021-09-02 22:17:32', NULL),
	(5, 'Socios', 'socios', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-30 17:57:55', '2021-09-02 22:18:42', NULL),
	(6, 'Galería', 'galeria', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-09-02 16:06:09', '2021-09-02 22:28:33', NULL),
	(7, 'Profecionales', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-25 10:23:39', '2021-09-02 22:14:15', NULL),
	(8, 'Beneficios', 'beneficio', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-30 17:57:55', '2021-09-02 22:18:50', NULL);
/*!40000 ALTER TABLE `contents_types` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.designs_icons
CREATE TABLE IF NOT EXISTS `designs_icons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.designs_icons: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `designs_icons` DISABLE KEYS */;
INSERT INTO `designs_icons` (`id`, `name`, `icon`, `color`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'reloj', 'far fa-clock', '#1888c9', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(2, 'Folder', 'far fa-folder-open', '#000000', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(3, 'Usuario', 'far fa-user-circle', '#b49f5e', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(4, 'Video', 'fas fa-play', '#bfbfbd', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(5, 'Nivel', 'far fa-flag', '#d23f3f', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(6, 'Idioma', 'far fa-bell', '#33a9bb', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL);
/*!40000 ALTER TABLE `designs_icons` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `template_view_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_menus_templates_views` (`template_view_id`),
  CONSTRAINT `FK_menus_templates_views` FOREIGN KEY (`template_view_id`) REFERENCES `templates_views` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.menus: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `image`, `order`, `slug`, `url`, `parent_id`, `company_id`, `template_view_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Nosotros', '/assets/template/stetic/images/banner-2.png', 1, 'nosotros', '', 0, 1, 1, '2021-08-10 22:33:03', '2021-09-05 01:19:53', NULL),
	(2, 'Especialidades', '/assets/template/stetic/images/banner-2.png', 2, 'especialidades', '', 0, 1, 2, '2021-08-10 22:33:32', '2021-09-05 01:19:55', NULL),
	(3, 'Cursos', '/assets/template/stetic/images/banner-2.png', 3, 'cursos', '', 0, 1, 2, '2021-08-10 22:33:50', '2021-09-05 01:19:55', NULL),
	(4, 'Complementarios', '/assets/template/stetic/images/banner-2.png', 4, 'complementarios', '', 3, 1, 2, '2021-08-10 22:39:08', '2021-09-05 01:19:55', NULL),
	(5, 'Diplomados', '/assets/template/stetic/images/banner-2.png', 5, 'diplomados', '', 2, 1, 2, '2021-08-10 22:39:26', '2021-09-05 01:19:56', NULL),
	(6, 'Talleres', '/assets/template/stetic/images/banner-2.png', 6, 'talleres', '', 2, 1, 2, '2021-08-10 22:39:48', '2021-09-05 01:19:56', NULL),
	(7, 'Contáctanos', '/assets/template/stetic/images/banner-2.png', 8, 'contactanos', '', 0, 1, 4, '2021-08-10 22:40:29', '2021-09-05 01:19:57', NULL),
	(9, 'Galería', '/assets/template/stetic/images/banner-2.png', 7, 'galeria', NULL, 0, 1, 3, '2021-08-30 18:43:15', '2021-09-05 01:19:58', NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.menus_products
CREATE TABLE IF NOT EXISTS `menus_products` (
  `menu_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`product_id`) USING BTREE,
  KEY `idx_menus_products_id_foreign` (`product_id`) USING BTREE,
  CONSTRAINT `fk_menus_products_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menus_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.menus_products: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_products` DISABLE KEYS */;
INSERT INTO `menus_products` (`menu_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 1, '2021-09-05 01:20:28', '2021-09-05 01:20:28', NULL),
	(5, 2, '2021-09-05 01:27:09', '2021-09-05 01:27:09', NULL),
	(6, 3, '2021-09-05 01:28:07', '2021-09-05 01:28:07', NULL),
	(6, 4, '2021-09-05 01:30:00', '2021-09-05 01:30:00', NULL);
/*!40000 ALTER TABLE `menus_products` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.menus_sections
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.menus_sections: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_sections` DISABLE KEYS */;
INSERT INTO `menus_sections` (`menu_id`, `section_id`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 0, '2021-08-11 18:55:09', '2021-08-11 18:55:09', NULL),
	(1, 2, 0, '2021-08-11 18:55:22', '2021-08-11 18:55:22', NULL),
	(1, 3, 0, '2021-08-11 18:56:12', '2021-08-11 18:56:12', NULL),
	(1, 4, 0, '2021-08-30 13:08:52', '2021-08-30 13:08:52', NULL),
	(1, 5, 0, '2021-08-30 17:13:54', '2021-08-30 17:13:54', NULL),
	(1, 6, 0, '2021-08-30 17:55:31', '2021-08-30 17:55:31', NULL),
	(1, 7, 0, '2021-08-30 18:16:00', '2021-08-30 18:16:00', NULL),
	(1, 8, 0, '2021-08-30 18:33:45', '2021-08-30 18:33:45', NULL),
	(9, 9, 0, '2021-09-02 12:49:58', '2021-09-02 12:49:58', NULL);
/*!40000 ALTER TABLE `menus_sections` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.messages
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.messages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `category_id` bigint(20) unsigned NOT NULL,
  `teacher_id` bigint(20) DEFAULT 0,
  `type_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_products_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.products: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `caption`, `description`, `slug`, `overview`, `image`, `video`, `url`, `price`, `status`, `category_id`, `teacher_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'producto 1', NULL, NULL, 'producto-1', '', NULL, NULL, '', 450.00, 1, 2, 1, 1, 1, '2021-09-05 01:20:28', '2021-09-05 01:20:28', NULL),
	(2, 'producto 2', NULL, NULL, 'producto-2', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 500.00, 1, 3, 2, 1, 1, '2021-09-05 01:27:09', '2021-09-05 01:27:09', NULL),
	(3, 'producto 3', NULL, NULL, 'producto-3', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 360.00, 1, 4, 1, 1, 1, '2021-09-05 01:28:07', '2021-09-05 01:28:07', NULL),
	(4, 'producto 4', NULL, NULL, 'producto-4', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 620.00, 1, 1, 2, 1, 1, '2021-09-05 01:30:00', '2021-09-05 01:30:00', NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.profiles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Master', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL),
	(2, 'Administrador', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL),
	(3, 'Cliente', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `type_id` bigint(20) unsigned DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sections_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_sections_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.sections: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` (`id`, `name`, `description`, `caption`, `color`, `alias`, `status`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Slide principal', '', 'Slide', '', 'slide', 1, NULL, 1, '2021-08-11 18:55:09', '2021-08-13 18:34:38', NULL),
	(2, 'Slide principal', '', 'Slide', '', NULL, 1, NULL, 1, '2021-08-11 18:55:22', '2021-08-11 18:55:36', '2021-08-11 18:55:36'),
	(3, 'Bienvenido', '', '', '', 'bienvenido', 1, NULL, 1, '2021-08-11 18:56:12', '2021-08-19 22:00:02', NULL),
	(4, 'Video corporativo', '', '', NULL, 'videocorp', 1, NULL, 1, '2021-08-30 13:08:52', '2021-08-30 13:18:16', NULL),
	(5, 'Registro', '', '', NULL, 'registro', 1, NULL, 1, '2021-08-30 17:13:54', '2021-08-30 17:49:20', NULL),
	(6, 'Beneficio', '', '', NULL, 'beneficio', 1, NULL, 1, '2021-08-30 17:55:31', '2021-08-30 18:09:29', NULL),
	(7, 'Socios', '', '', NULL, 'socios', 1, NULL, 1, '2021-08-30 18:16:00', '2021-08-30 18:24:17', NULL),
	(8, 'Profecionales', '', '', NULL, 'profecionales', 1, NULL, 1, '2021-08-30 18:33:45', '2021-08-30 18:40:26', NULL),
	(9, 'Galería', '', 'Slide', NULL, 'galeria', 1, NULL, 1, '2021-09-02 12:49:58', '2021-09-02 22:27:37', NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.subtopics
CREATE TABLE IF NOT EXISTS `subtopics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `design_icon_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topic_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.subtopics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `subtopics` DISABLE KEYS */;
/*!40000 ALTER TABLE `subtopics` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.teachers: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`id`, `name`, `lastname`, `email`, `image`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'María', 'Moya', NULL, '/upload/teacher/16306025706131054a598a1-estudiante-1.jpg', 1, '2021-09-02 12:09:30', '2021-09-02 12:09:30', NULL),
	(2, 'Raul', 'Moya', NULL, '/upload/teacher/16306025886131055c2de50-estudiante-7.jpg', 1, '2021-09-02 12:09:48', '2021-09-02 12:09:48', NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.templates
CREATE TABLE IF NOT EXISTS `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` (`id`, `nombre`, `codigo`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Tema belleza', 'stetic', 'plantilla con tienda de cursos', '2021-08-10 15:46:15', '2021-08-10 15:46:40', NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.templates_views
CREATE TABLE IF NOT EXISTS `templates_views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `view_twig` varchar(150) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_templates_views_templates` (`template_id`),
  CONSTRAINT `FK_templates_views_templates` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates_views: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `templates_views` DISABLE KEYS */;
INSERT INTO `templates_views` (`id`, `nombre`, `view_twig`, `index`, `template_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Principal', 'inicio.twig', 1, 1, '2021-08-12 10:19:31', '2021-08-12 17:38:17', NULL),
	(2, 'Ecomerce', 'cursos.twig', 2, 1, '2021-08-12 10:23:25', '2021-09-04 23:33:36', NULL),
	(3, 'Galeria', 'galeria.twig', 3, 1, '2021-08-12 10:23:42', '2021-09-04 23:33:39', NULL),
	(4, 'Contacto', 'contacto.twig', 4, 1, '2021-08-12 10:24:01', '2021-09-04 23:33:41', NULL);
/*!40000 ALTER TABLE `templates_views` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.topics
CREATE TABLE IF NOT EXISTS `topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `product_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.topics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.transfers
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.transfers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.users
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Master', 'Usuario', 'master@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 1, '2021-07-16 21:54:59', '2021-07-16 21:54:59', NULL),
	(2, 'Admin', 'Usuario', 'admin@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 2, '2021-07-16 21:54:59', '2021-08-02 21:03:02', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
