-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.categories: ~5 rows (aproximadamente)
INSERT INTO `categories` (`id`, `name`, `color`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '', '#b89a9a', 1, '2021-09-02 12:07:52', '2021-11-12 16:54:23', NULL),
	(2, '', '#e6e6e6', 1, '2021-09-02 12:08:09', '2021-11-12 16:54:30', NULL),
	(3, '', '#73023d', 1, '2021-09-02 12:08:22', '2021-11-12 16:54:42', NULL),
	(4, '', '#45e0d6', 1, '2021-09-02 12:08:38', '2021-11-12 16:54:52', NULL),
	(5, 'categoria 1', '', 5, '2022-05-19 10:50:12', '2022-05-19 10:50:12', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.characteristics: ~14 rows (aproximadamente)
INSERT INTO `characteristics` (`id`, `name`, `description`, `design_icon_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Duración', '4 meses', 1, 1, '2021-09-17 12:34:25', '2021-11-12 16:57:59', NULL),
	(2, 'Duración', '4 Meses', 1, 2, '2021-11-12 17:00:44', '2021-11-12 17:00:44', NULL),
	(3, 'Duración', '4 Meses', 1, 3, '2021-11-12 17:03:02', '2021-11-12 17:03:02', NULL),
	(4, 'Duración', '4 Meses', 1, 4, '2021-11-12 17:04:24', '2021-11-12 17:04:24', NULL),
	(5, 'Duración', '3 Meses', 1, 5, '2021-11-12 17:06:24', '2021-11-12 17:16:08', NULL),
	(6, 'Duración', '4 Meses', 1, 6, '2021-11-12 17:09:58', '2021-11-12 17:09:58', NULL),
	(7, 'Duración', '4 Meses', 1, 7, '2021-11-12 17:12:39', '2021-11-12 17:12:39', NULL),
	(8, 'Duración', '3 Meses', 1, 8, '2021-11-12 17:14:45', '2021-11-12 17:14:45', NULL),
	(9, 'Duración', '3 Meses', 1, 9, '2021-11-12 17:19:51', '2021-11-12 17:19:51', NULL),
	(10, 'Duración', '3 Meses', 1, 10, '2021-11-12 17:21:35', '2021-11-12 17:21:35', NULL),
	(11, 'Duración', '3 Meses', 1, 11, '2021-11-12 17:24:59', '2021-11-12 17:24:59', NULL),
	(12, 'Duración ', '1 Mes', 1, 12, '2021-11-12 17:28:22', '2021-11-12 17:28:22', NULL),
	(13, 'Duración', '1 Mes', 1, 13, '2021-11-12 17:29:32', '2021-11-12 17:29:32', NULL),
	(14, 'Duración', '1 Mes', 1, 14, '2021-11-12 17:30:43', '2021-11-12 17:30:43', NULL);

-- Volcando estructura para tabla db_margarita.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_codigo` varchar(250) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT 0,
  `ruc` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `email_contact` varchar(255) DEFAULT NULL,
  `phone_contact` varchar(255) DEFAULT NULL,
  `mailer_host` varchar(255) DEFAULT NULL,
  `mailer_username` varchar(255) DEFAULT NULL,
  `mailer_password` varchar(255) DEFAULT NULL,
  `mailer_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `terms_and_conditions` text DEFAULT NULL,
  `privacy_policies` text DEFAULT NULL,
  `mision` text DEFAULT NULL,
  `vision` text DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `latitude_maps` varchar(255) DEFAULT NULL,
  `longitude_maps` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_companies_templates` (`template_id`),
  CONSTRAINT `FK_companies_templates` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies: ~7 rows (aproximadamente)
INSERT INTO `companies` (`id`, `name`, `description`, `url_codigo`, `template_id`, `ruc`, `meta_title`, `email_contact`, `phone_contact`, `mailer_host`, `mailer_username`, `mailer_password`, `mailer_name`, `address`, `favicon`, `terms_and_conditions`, `privacy_policies`, `mision`, `vision`, `settings`, `facebook_link`, `whatsapp_link`, `twitter_link`, `linkedin_link`, `instagram_link`, `latitude_maps`, `longitude_maps`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ML STETIC', 'Somos un centro de especialización y asesoría en\r\nestética profesional y dermocosmetica.', 'mlstetic.com', 1, '', 'ML STETIC', 'info@mlstetic.com', '+51 01 3220391', '', '', '', '', 'Jr. Palma De Mallorca 192 San Luis, Lima', '/upload/company/163408148361661acb88767-android-icon-144x144.png', '<div class="C3i1Pd m2dIJf" style="-webkit-tap-highlight-color: transparent; text-align: center; padding-top: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><img class="HTjVbe" alt="" src="https://www.gstatic.com/identity/boq/policies/privacy/tos_main_illustration.svg" data-atf="false" data-iml="552.7000000029802" style="-webkit-tap-highlight-color: transparent; border-width: initial; border-color: initial; border-image: initial; display: inline-block; margin: 0px; vertical-align: top; width: 440px;"></div><h1 class="bVzSHe" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); display: inline-block; font-family: Roboto, arial, sans-serif; font-size: 12px; letter-spacing: 0.8px; line-height: 20px; margin: 1.236em 0px 0.618em; text-transform: uppercase;">TÉRMINOS DEL SERVICIO DE GOOGLE</h1><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Fecha de entrada en vigor: 31 de marzo de 2020 <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://policies.google.com/terms/archive?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Versiones archivadas</a><span class="LzjtMd" style="-webkit-tap-highlight-color: transparent;"> <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://www.gstatic.com/policies/terms/pdf/20200331/ba461e2f/google_terms_of_service_es.pdf" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Descargar PDF</a></span></p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-country-version" data-name="country-version" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">Versión específica de país:</a> Perú</p><div id="whats-covered" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Qué se trata en estos términos</h2><h3 class="XwcIZc" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 24px; line-height: 32px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 24px 0px 4px;">Sabemos que es tentador saltarse estos Términos del Servicio, pero es importante determinar qué puedes esperar de nosotros al usar los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google y qué esperamos nosotros de ti.</h3><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Estos Términos del Servicio reflejan <a href="https://about.google/intl/es_PE/how-our-business-works" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">la forma de trabajar de Google como empresa</a>, las leyes por las que nos regimos y <a href="https://www.google.com/about/philosophy.html?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">determinados aspectos que siempre hemos creído que son ciertos</a>. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Google contigo cuando interactúas con nuestros servicios. Por ejemplo, estos términos incluyen las siguientes secciones:</p><ul style="-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 16px; padding: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-you-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Qué puedes esperar de nosotros</a>, donde se describe cómo proporcionamos y desarrollamos nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-we-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Lo que esperamos de ti</a>, donde se establecen ciertas reglas para utilizar nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-content" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Contenido en los servicios de Google</a>, donde se describen los derechos de propiedad intelectual relacionados con el contenido que aparece en nuestros servicios, ya sea propiedad tuya, de Google o de terceros.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-problems" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">En caso de problemas o discrepancias</a>, donde se describen otros derechos legales que tienes y las consecuencias de infringir estos términos.</li></ul><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Es importante que entiendas estos términos porque el uso de nuestros servicios implica que los aceptas.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Además de estos términos, también publicamos una <a href="https://policies.google.com/privacy?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Política de Privacidad</a>. Aunque no forme parte de estos términos, te recomendamos que la leas para entender mejor cómo puedes <a href="https://myaccount.google.com/?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">actualizar, gestionar, exportar y eliminar tu información</a>.</p><div id="service-provider" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Proveedor de servicios</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google los proporciona y se contratan con:</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Google LLC<br style="-webkit-tap-highlight-color: transparent;">Empresa que se rige por las leyes del estado de Delaware (EE. UU.) y que opera bajo la legislación estadounidense<br style="-webkit-tap-highlight-color: transparent;"><br style="-webkit-tap-highlight-color: transparent;">1600 Amphitheatre Parkway<br style="-webkit-tap-highlight-color: transparent;">Mountain View, California, 94043<br style="-webkit-tap-highlight-color: transparent;">EE. UU.</p><div id="age-requirements" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Requisitos de edad mínima</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si no tienes la <a href="https://support.google.com/accounts/answer/1350409?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">edad mínima para poder gestionar tu propia cuenta de Google</a>, debes contar con el permiso de tu padre, madre o tutor legal para utilizar una cuenta de Google. Pide a tu padre, madre o tutor legal que lea estos términos contigo.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si eres padre, madre o tutor legal y permites a tu hijo/a que utilice los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a>, se te aplican estos términos y eres responsable de la actividad que realice en los servicios.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Algunos servicios de Google tienen requisitos de edad mínima adicionales, como se describe en sus <a href="https://policies.google.com/terms/service-specific?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">términos y políticas adicionales específicos</a>.</p>', '<div class="C3i1Pd m2dIJf" style="-webkit-tap-highlight-color: transparent; text-align: center; padding-top: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><img class="HTjVbe" alt="" src="https://www.gstatic.com/identity/boq/policies/privacy/tos_main_illustration.svg" data-atf="false" data-iml="552.7000000029802" style="-webkit-tap-highlight-color: transparent; border-width: initial; border-color: initial; border-image: initial; display: inline-block; margin: 0px; vertical-align: top; width: 440px;"></div><h1 class="bVzSHe" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); display: inline-block; font-family: Roboto, arial, sans-serif; font-size: 12px; letter-spacing: 0.8px; line-height: 20px; margin: 1.236em 0px 0.618em; text-transform: uppercase;">TÉRMINOS DEL SERVICIO DE GOOGLE</h1><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Fecha de entrada en vigor: 31 de marzo de 2020 <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://policies.google.com/terms/archive?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Versiones archivadas</a><span class="LzjtMd" style="-webkit-tap-highlight-color: transparent;"> <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://www.gstatic.com/policies/terms/pdf/20200331/ba461e2f/google_terms_of_service_es.pdf" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Descargar PDF</a></span></p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-country-version" data-name="country-version" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">Versión específica de país:</a> Perú</p><div id="whats-covered" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Qué se trata en estos términos</h2><h3 class="XwcIZc" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 24px; line-height: 32px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 24px 0px 4px;">Sabemos que es tentador saltarse estos Términos del Servicio, pero es importante determinar qué puedes esperar de nosotros al usar los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google y qué esperamos nosotros de ti.</h3><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Estos Términos del Servicio reflejan <a href="https://about.google/intl/es_PE/how-our-business-works" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">la forma de trabajar de Google como empresa</a>, las leyes por las que nos regimos y <a href="https://www.google.com/about/philosophy.html?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">determinados aspectos que siempre hemos creído que son ciertos</a>. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Google contigo cuando interactúas con nuestros servicios. Por ejemplo, estos términos incluyen las siguientes secciones:</p><ul style="-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 16px; padding: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-you-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Qué puedes esperar de nosotros</a>, donde se describe cómo proporcionamos y desarrollamos nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-we-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Lo que esperamos de ti</a>, donde se establecen ciertas reglas para utilizar nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-content" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Contenido en los servicios de Google</a>, donde se describen los derechos de propiedad intelectual relacionados con el contenido que aparece en nuestros servicios, ya sea propiedad tuya, de Google o de terceros.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-problems" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">En caso de problemas o discrepancias</a>, donde se describen otros derechos legales que tienes y las consecuencias de infringir estos términos.</li></ul><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Es importante que entiendas estos términos porque el uso de nuestros servicios implica que los aceptas.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Además de estos términos, también publicamos una <a href="https://policies.google.com/privacy?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Política de Privacidad</a>. Aunque no forme parte de estos términos, te recomendamos que la leas para entender mejor cómo puedes <a href="https://myaccount.google.com/?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">actualizar, gestionar, exportar y eliminar tu información</a>.</p><div id="service-provider" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Proveedor de servicios</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google los proporciona y se contratan con:</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Google LLC<br style="-webkit-tap-highlight-color: transparent;">Empresa que se rige por las leyes del estado de Delaware (EE. UU.) y que opera bajo la legislación estadounidense<br style="-webkit-tap-highlight-color: transparent;"><br style="-webkit-tap-highlight-color: transparent;">1600 Amphitheatre Parkway<br style="-webkit-tap-highlight-color: transparent;">Mountain View, California, 94043<br style="-webkit-tap-highlight-color: transparent;">EE. UU.</p><div id="age-requirements" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Requisitos de edad mínima</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si no tienes la <a href="https://support.google.com/accounts/answer/1350409?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">edad mínima para poder gestionar tu propia cuenta de Google</a>, debes contar con el permiso de tu padre, madre o tutor legal para utilizar una cuenta de Google. Pide a tu padre, madre o tutor legal que lea estos términos contigo.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si eres padre, madre o tutor legal y permites a tu hijo/a que utilice los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a>, se te aplican estos términos y eres responsable de la actividad que realice en los servicios.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Algunos servicios de Google tienen requisitos de edad mínima adicionales, como se describe en sus <a href="https://policies.google.com/terms/service-specific?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">términos y políticas adicionales específicos</a>.</p>', 'Ser el modelo educativo e innovador en la estética profesional', 'Convertirnos en el primer instituto técnico superior, que forme profesionales en estética dermatológica con mención en ciencias de la salud.', NULL, 'https://www.facebook.com/mlstetic', 'https://wa.me/51923520204/?text=Hola. Necesito información.', '', '', 'https://www.instagram.com/ml.stetic/?hl=es', '-76.99902637058118', '-12.078747754175907', '2021-08-10 10:57:27', '2022-02-03 11:37:45', NULL),
	(2, 'new ecomerce', NULL, 'newecomerce.idcloudsystem.com', 1, NULL, 'FRI ESAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/upload/company/163424553261689b9c035c3-logos friesan_friesan rojo.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-14 20:07:52', '2021-10-14 16:05:32', NULL),
	(3, 'CASA LEGALLIA', NULL, 'legal.idcloudsystem.com', 2, NULL, 'CASA LEGALLIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-12 16:53:40', '2021-12-12 16:53:40', NULL),
	(4, 'LEGALIA', NULL, 'legalia.idcloudsystem.com', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-11 13:07:17', '2022-03-11 13:09:15', NULL),
	(5, 'SOFTDYNAMIC', 'DESCRIPCIÒN DE LA EMPRESA', 'web-test.softdynamic.org', 4, '20600941357', 'SOFTDYNAMIC', 'informes@softdynamic.org', '(+51) 943777031', '', '', '', '', 'Av. Antunez de Mayolo COO. Santa Apolonia Mza. F Lote. 3 San Martín de Porres - Lima - Lima', '/upload/company/165159580762715a1f8aa95-favicon.png', '<font color="#000000">terminoooooooooooooooooss</font>', '<font color="#000000">politicssdsdsdsdsd</font>', 'MISION DE LA EMPRESA', 'VISIÒN DE LA EMPRESA', NULL, 'https://www.facebook.com/', 'https://web.whatsapp.com/', 'https://twitter.com/', 'https://pe.linkedin.com/', 'https://www.instagram.com/', NULL, NULL, '2021-10-14 20:07:52', '2022-05-03 11:36:47', NULL),
	(6, 'COMUNIDAD', '', 'comunidad.idcloudsystem.com', 5, '', NULL, '', '', 'smtp.gmail.com', 'ses.proeducative@gmail.com', 'soft052021', 'PRO FINANCE', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-23 13:51:08', '2022-06-28 17:34:45', NULL),
	(7, 'pro360', 'nueva comunidad', 'app.comunidad.pro', 6, '', 'Comunidad pro360', '', '', '', '', '', '', '', '/upload/company/165940492862e882809f8aa-img115.jpg', '<p>terminos</p>', '<p>privacidad</p>', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-27 15:50:20', '2022-08-08 22:41:28', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_colors: ~20 rows (aproximadamente)
INSERT INTO `companies_colors` (`id`, `color`, `alias`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '#27221d', 'for', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(2, '#27221d', 'one', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(3, '#a5873f', 'two', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(4, '#b49f5e', 'five', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(5, '#ffffff', 'three', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(6, '#27221d', 'six', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(7, '#000000', 'seven', 1, '2021-08-11 19:01:12', '2021-11-10 13:22:33', NULL),
	(32, '#e51f2f', 'for', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:00', NULL),
	(33, '#bfbfbd', 'one', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:49', NULL),
	(34, '#b49f5e', 'two', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:51', NULL),
	(35, '#1d1d1b', 'five', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:54', NULL),
	(36, '#1d1d1b', 'three', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:54', NULL),
	(37, '#dabb69', 'six', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:59', NULL),
	(38, '#ececec', 'seven', 2, '2021-08-11 19:01:12', '2021-10-14 20:46:00', NULL),
	(39, '#ada6a6', 'primario', 5, '2022-05-03 09:52:05', '2022-05-03 11:06:28', NULL),
	(40, '#1414b3', 'secundario', 5, '2022-05-03 09:52:05', '2022-05-03 15:15:22', NULL),
	(41, '#ff854a', 'principal', 7, '2022-08-01 21:55:17', '2022-08-01 21:59:30', '2022-08-01 21:59:30'),
	(42, '#ff854a', 'resaltar', 7, '2022-08-01 21:59:30', '2022-08-01 22:00:01', NULL),
	(43, '#000000', 'principal', 7, '2022-08-01 21:59:30', '2022-08-01 21:59:56', NULL),
	(44, '#7bb263', 'aux_uno', 7, '2022-08-01 22:19:40', '2022-08-01 22:20:58', NULL),
	(45, '#22467a', 'secundario', 7, '2022-08-01 22:19:40', '2022-08-01 22:20:43', NULL);

-- Volcando estructura para tabla db_margarita.companies_logos
CREATE TABLE IF NOT EXISTS `companies_logos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_logos: ~7 rows (aproximadamente)
INSERT INTO `companies_logos` (`id`, `logo`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '/upload/logos/162872641661146490a9e8e-logo.png', 1, '2021-08-11 19:00:16', '2021-08-11 19:00:16', NULL),
	(2, 'logo.png', 1, '2021-08-11 19:00:16', '2021-08-13 15:40:19', '2021-08-13 15:40:18'),
	(3, '/upload/logos/1630370279612d79e7c88c2-logo.png', 1, '2021-08-30 19:36:28', '2021-08-30 19:37:59', NULL),
	(4, '/upload/logos/1634243819616894eb7d41d-logos friesan_friesan original.png', 2, '2021-10-14 15:36:59', '2021-10-14 15:36:59', NULL),
	(5, '/upload/logos/16515951436271578747f7f-soft_logo.png', 5, '2022-04-28 17:14:53', '2022-05-03 11:25:43', NULL),
	(6, '/upload/logos/165159672762715db7c9d5b-soft_logo_blanco.png', 5, '2022-05-03 11:29:19', '2022-05-03 11:52:07', NULL),
	(7, '/upload/logos/165645393762bb7b31db57b-logo-profinance.png', 6, '2022-06-28 17:05:37', '2022-06-28 17:05:37', NULL),
	(8, '/upload/logos/165940525962e883cb034cb-img115.jpg', 7, '2022-08-01 20:54:19', '2022-08-01 20:54:19', NULL);

-- Volcando estructura para tabla db_margarita.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents: ~123 rows (aproximadamente)
INSERT INTO `contents` (`id`, `name`, `caption`, `description`, `url`, `image`, `file`, `color`, `order`, `status`, `section_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 'Empiece a aprender de nuestros expertos', 'kipso-icon-training', '', NULL, NULL, NULL, NULL, 0, 1, 3, 2, 1, '2021-08-12 16:52:36', '2021-08-30 17:34:51', NULL),
	(6, 'Mejore sus habilidades con nosotros ahora', 'kipso-icon-knowledge', '', NULL, NULL, NULL, NULL, 0, 1, 3, 2, 1, '2021-08-12 16:53:37', '2021-08-30 17:34:54', NULL),
	(7, 'Capacitados', '4890', '', NULL, NULL, NULL, NULL, 0, 1, 3, 3, 1, '2021-08-12 16:52:36', '2021-08-30 17:35:39', NULL),
	(8, 'Especialízate<br>en estética', '¿Estas listo para aprender?', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, '2021-08-17 17:40:04', '2021-08-30 18:21:24', NULL),
	(12, 'Especialízate<br>en estética', '¿Estas listo para aprender?', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, '2021-08-17 17:41:32', '2021-11-11 16:14:15', NULL),
	(14, 'Bienvenido a\r\nML STETIC donde\r\nestudiamos la belleza', 'Somos un centro de especialización y asesoría en estética profesional y dermocosmética, potenciando tu experiencia elevamos tu competitividad profesional, con un enfoque práctico y multidisciplinario.', NULL, NULL, NULL, NULL, NULL, 0, 1, 3, 1, 1, '2021-08-12 16:50:50', '2021-10-13 15:09:37', NULL),
	(15, 'La única misión de \r\nML STETIC es potenciar\r\ntu experiencia y conocimientos', 'https://www.youtube.com/embed/VJSwxINgJaw?controls=0', NULL, NULL, NULL, NULL, NULL, 0, 1, 4, 1, 1, '2021-08-30 13:10:18', '2021-10-13 15:11:25', NULL),
	(16, '¡Registrate ahora y obten una clase gratis!', 'https://www.youtube.com/embed/VJSwxINgJaw', 'Teoria y practica es la sinergia que todo esteticista debe de manejar, los principios cientificos de piel se complementan y se aplican en la practica.', NULL, NULL, NULL, NULL, 0, 1, 5, 4, 1, '2021-08-30 17:18:06', '2021-08-30 17:22:13', NULL),
	(19, 'Beneficios de aprender con ML STETIC', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 8, 1, '2021-08-30 17:59:12', '2021-09-02 22:19:02', '2021-08-30 18:01:23'),
	(20, 'Beneficios de aprender con ML STETIC', 'CCAS, ML STETIC , rompe con el esquema robotizado de la estética convencional, creyendo en la libertad de creación y diseño de tratamientos estéticos integrales basándonos en el CONOCIMIENTO DE LA CIENCIA.\r\n• Modalidad semi presencial\r\n• Modalidad remota 100% online\r\n• Metodología patentada\r\n• Enseñanza personalizada', NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 1, 1, '2021-08-30 18:00:41', '2021-08-30 18:03:55', NULL),
	(21, 'Cursos profesionales', 'kipso-icon-strategy', NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:01:52', '2021-08-30 18:03:50', NULL),
	(22, 'Aprendizaje en vivo', 'kipso-icon-training', NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:02:15', '2021-08-30 18:03:51', NULL),
	(23, 'Profesores expertos', 'kipso-icon-human-resources', NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:02:34', '2021-08-30 18:03:51', NULL),
	(24, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:24:53', '2021-10-15 13:18:54', NULL),
	(25, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:25:16', '2021-10-15 13:19:09', NULL),
	(26, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:25:39', '2021-10-15 13:19:32', NULL),
	(27, 'Tenemos los mejores profesores en todas las materias.', '', NULL, NULL, NULL, NULL, NULL, 0, 1, 8, 7, 1, '2021-08-30 18:34:43', '2022-02-03 11:52:54', NULL),
	(28, 'imagen 1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:18', '2021-09-02 16:09:18', NULL),
	(29, 'Imagen 2', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:43', '2021-09-02 16:09:43', NULL),
	(30, 'Imagen 3', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:58', '2021-09-02 16:09:58', NULL),
	(31, 'Imagen 4', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:10:23', '2021-09-02 16:10:23', NULL),
	(32, 'Preparate con \r\nFRI ESAN', '', NULL, NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 15:51:26', '2021-10-14 16:23:19', NULL),
	(33, 'Preparate con FRI ESAN', '', NULL, NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 15:58:44', '2021-10-14 16:24:56', '2021-10-14 16:24:56'),
	(34, 'Tecnología de punta', '', NULL, NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 16:25:25', '2021-10-14 16:25:25', NULL),
	(35, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-10-15 13:20:25', '2021-10-15 13:20:25', NULL),
	(36, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-10-15 13:38:43', '2021-10-15 13:38:43', NULL),
	(37, 'Conoce', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 11, 17, 1, '2021-11-10 17:24:13', '2021-11-10 17:24:13', NULL),
	(38, 'Crea', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 11, 17, 1, '2021-11-10 17:24:34', '2021-11-10 17:24:34', NULL),
	(39, 'Aplica', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 11, 17, 1, '2021-11-10 17:24:46', '2021-11-10 17:24:46', NULL),
	(40, 'Soluciona', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 11, 17, 1, '2021-11-10 17:24:59', '2021-11-10 17:24:59', NULL),
	(41, 'Compromiso', 'involucrarse en nuestra metodología brindada dando lo mejor de si.', NULL, NULL, NULL, NULL, NULL, 1, 1, 12, 18, 1, '2021-11-10 17:27:04', '2021-11-10 17:27:04', NULL),
	(42, 'Respeto', 'Reconocer en todo ser humano un gran potencial sin limitaciones', NULL, NULL, NULL, NULL, NULL, 2, 1, 12, 18, 1, '2021-11-10 17:27:31', '2021-11-10 17:27:31', NULL),
	(43, 'Integridad', 'Mantenerse firme en las bases profesionales de una estética no invasiva, respetando las competencias académicas.', NULL, NULL, NULL, NULL, NULL, 3, 1, 12, 18, 1, '2021-11-10 17:27:53', '2021-11-10 17:27:53', NULL),
	(44, 'Responsabilidad social', 'ofrecerle al mercado estético\r\nprofesionales integrales capaces de dar ciencia y\r\nbelleza.', NULL, NULL, NULL, NULL, NULL, 4, 1, 12, 18, 1, '2021-11-10 17:35:18', '2021-11-10 17:35:18', NULL),
	(45, 'CREAR PROTOCOLOS', '100', NULL, NULL, NULL, NULL, NULL, 2, 1, 13, 19, 1, '2021-11-10 17:37:39', '2021-11-11 18:37:57', NULL),
	(46, 'APLICANDO ACTIVOS QUIMICOS DIRECCIONADOS', '100', NULL, NULL, NULL, NULL, NULL, 3, 1, 13, 19, 1, '2021-11-10 17:37:56', '2021-11-11 18:38:03', NULL),
	(47, 'SOLUCIONANDO ALTERACIONES ESTETICAS', '100', NULL, NULL, NULL, NULL, NULL, 4, 1, 13, 19, 1, '2021-11-10 17:38:15', '2021-11-11 18:38:11', NULL),
	(48, 'Certificado', 'Finalizadas las especialidades con nota aprobatoria de 15 20 la profesional obtendrá una constancia de estudios más competencias académicas y horas cronológicas certificadas por ML STETIC estudiando la belleza s a c', NULL, NULL, NULL, NULL, NULL, 1, 1, 14, 21, 1, '2021-11-10 17:40:12', '2021-11-10 17:40:12', NULL),
	(49, 'Propuesta remota', 'Para las profesionales de provincia tenemos la modalidad cabina HAUSE podrán hacer sus prácticas desde casa adquiriendo un set de productos para que puedan llevar la ciencia a la practica', NULL, NULL, NULL, NULL, NULL, 2, 1, 14, 21, 1, '2021-11-10 17:40:31', '2021-11-10 17:40:31', NULL),
	(50, 'Cursos complementarios', '', NULL, NULL, NULL, NULL, NULL, 1, 1, 15, 22, 1, '2021-11-10 17:42:05', '2021-11-11 18:04:50', NULL),
	(51, 'Especialidades en estética facial', '', NULL, NULL, NULL, NULL, NULL, 2, 1, 15, 22, 1, '2021-11-10 17:42:15', '2021-11-11 18:05:16', NULL),
	(52, 'Especialidades en estética corporal', '', NULL, NULL, NULL, NULL, NULL, 3, 1, 15, 22, 1, '2021-11-10 17:42:28', '2021-11-11 18:05:31', NULL),
	(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 20, 1, '2021-11-11 17:02:28', '2021-11-11 17:02:28', NULL),
	(54, 'CONOCIMIENTO DE LA CIENCIA', '100', NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 19, 1, '2021-11-11 18:36:38', '2021-11-11 18:36:38', NULL),
	(55, 'SOFTDYNAMIC', 'Administración de Plataformas', 'Dominios, Certificados y backups', NULL, NULL, NULL, NULL, 1, 1, 16, 23, 5, '2022-04-26 15:11:32', '2022-05-03 12:40:38', NULL),
	(56, 'banner 1', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 16, 23, 5, '2022-04-26 15:11:51', '2022-04-26 15:12:32', '2022-04-26 15:12:32'),
	(57, 'banner 2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 17, 23, 5, '2022-04-26 16:12:16', '2022-04-26 16:12:16', NULL),
	(58, 'SOFTDYNAMIC', 'Hosting en la Nube', 'Infraestructura a la medida', NULL, NULL, NULL, NULL, 2, 1, 16, 23, 5, '2022-04-26 16:13:22', '2022-05-03 12:35:54', NULL),
	(59, 'Administración de Plataformas', '', 'Mejora permanente de procesos internos, optimizando la disponibilidad y uso de los recursos para el sistema operativo y bases de datos', NULL, NULL, NULL, NULL, 1, 1, 18, 24, 5, '2022-04-27 13:15:29', '2022-05-04 16:17:58', NULL),
	(60, 'Hosting en la Nube', '', 'Infraestructura a la medida en un servidor dedicado para que tu negocio cuente con una solución que se adapte a tus necesidades específicas', NULL, NULL, NULL, NULL, 2, 1, 18, 24, 5, '2022-04-27 13:16:15', '2022-05-11 10:21:04', NULL),
	(61, 'Asesoría tecnológica', NULL, 'Permiten abordar proyectos que necesiten una fuerte personalización de la solución y su adaptación a las  particularidades de su empresa', NULL, NULL, NULL, NULL, 3, 1, 18, 24, 5, '2022-04-27 13:17:18', '2022-05-03 15:45:47', NULL),
	(62, 'Plataforma Hospitales', '', '', NULL, NULL, NULL, NULL, 1, 1, 19, 25, 5, '2022-04-27 14:59:57', '2022-05-06 17:05:22', NULL),
	(63, 'Plataforma Legalia', '', '', NULL, NULL, NULL, NULL, 2, 1, 19, 25, 5, '2022-04-27 15:00:52', '2022-05-06 17:05:47', NULL),
	(64, 'Visor de libros', '', '', NULL, NULL, NULL, NULL, 3, 1, 19, 25, 5, '2022-04-27 15:01:23', '2022-05-06 17:08:34', NULL),
	(65, 'Master - Gestor de Contenido', '', '', NULL, NULL, NULL, NULL, 4, 1, 19, 25, 5, '2022-04-27 15:15:33', '2022-05-06 17:09:07', NULL),
	(66, 'Antamina', '', '', NULL, NULL, NULL, NULL, 1, 1, 20, 25, 5, '2022-04-28 10:21:48', '2022-05-03 16:48:41', NULL),
	(67, 'Plaindes', '', '', NULL, NULL, NULL, NULL, 2, 1, 20, 25, 5, '2022-04-28 10:22:28', '2022-05-03 16:49:08', NULL),
	(68, 'Cassalegalia', '', '', NULL, NULL, NULL, NULL, 3, 1, 20, 25, 5, '2022-04-28 10:24:07', '2022-05-04 13:07:51', NULL),
	(69, 'FRI ESAN', 'Lima, Perú', '\r\n"La experiencia de nuestros colaboradores, docentes y alumnos ha sido muy buena. Gracias a la plataforma Proeducative hemos podido afrontar los retos de la virtualidad que nos trajo la pandemia COVID-19."', NULL, NULL, NULL, NULL, 1, 1, 21, 25, 5, '2022-04-28 11:17:46', '2022-05-10 12:11:22', NULL),
	(70, 'FARMEX', 'Lima, Perú', '"El proceso de trabajo con Softdynamic fue muy gratificante.  Nos ayudaron en todo el proceso y en atender rápidamente las consultas. Personalmente como cliente, valoro mucho el nivel de atención del proveedor, ya que facilita la comunicación y la ejecución del trabajo; y Softdynamic me brinda una calidad de atención A1."', NULL, NULL, NULL, NULL, 2, 1, 21, 25, 5, '2022-04-28 11:18:31', '2022-05-10 12:05:35', NULL),
	(71, 'CMIDEAS', 'Lima, Perú', '\r\n\r\n“Softdynamic nos ofrece una plataforma muy completa para mostrar uno de nuestros servicios principales, como es el de virtualización de contenidos, de una forma dinámica y amigable”', NULL, NULL, NULL, NULL, 3, 1, 21, 25, 5, '2022-04-28 11:32:31', '2022-05-11 10:45:21', NULL),
	(72, 'SOFTDYNAMIC', 'Asesoría Tecnológica', 'Adaptación y Soluciones a las Particulares de su Empresa', NULL, NULL, NULL, NULL, 3, 1, 16, 23, 5, '2022-05-03 12:10:10', '2022-05-03 12:47:49', NULL),
	(73, 'SOFTDYNAMIC', 'Proyectos Tecnológicos a Medida', 'Diseño, Implementación, Desarrollos y Mantenimiento', NULL, NULL, NULL, NULL, 4, 1, 16, 23, 5, '2022-05-03 12:54:46', '2022-05-03 12:54:46', NULL),
	(74, 'SOFTDYNAMIC', 'Gestión de Correos Corporativos', 'Distingue tu empresa con Clientes y  Proveedores', NULL, NULL, NULL, NULL, 5, 1, 16, 23, 5, '2022-05-03 12:59:39', '2022-05-03 12:59:39', NULL),
	(75, 'SOFTDYNAMIC', 'Arquitectura de Soluciones', 'Escuchamos tus necesidades y Diseñamos la solución', NULL, NULL, NULL, NULL, 6, 1, 16, 23, 5, '2022-05-03 13:02:55', '2022-05-03 13:02:55', NULL),
	(76, 'SOFTDYNAMIC', 'Asesoría en Infraestructura en la Nube', 'Te ayudamos a identificar que cargas de trabajo estám listas para trasladarse a la Nube', NULL, NULL, NULL, NULL, 7, 1, 16, 23, 5, '2022-05-03 13:09:02', '2022-05-03 13:09:02', NULL),
	(77, 'Proyectos tecnológicos a medida', '', 'Somos especialistas enfocados en brindar al usuario la mejor experiencia en la toma de requerimientos y desarrollar el producto deseado con métodos innovadores', NULL, NULL, NULL, NULL, 4, 1, 18, 24, 5, '2022-05-03 15:46:42', '2022-05-11 10:26:24', NULL),
	(78, 'Gestión de correos corporativos', '', 'Un correo corporativo le da identidad a tu empresa. Distingue a tu empresa con clientes, proveedores y público.', NULL, NULL, NULL, NULL, 5, 1, 18, 24, 5, '2022-05-03 15:47:29', '2022-05-11 10:26:37', NULL),
	(79, 'Arquitectura de Soluciones', '', 'Escuchamos tus necesidades y diseñamos una solución, mapeando los requerimientos funcionales hacia tecnologías', NULL, NULL, NULL, NULL, 6, 1, 18, 24, 5, '2022-05-03 15:48:13', '2022-05-11 10:26:52', NULL),
	(80, 'Asesoría en infraestructura en la nube', '', 'Te ayudamos a identificar que cargas de trabajo están listas para trasladarse a la nube', NULL, NULL, NULL, NULL, 7, 1, 18, 24, 5, '2022-05-03 15:48:47', '2022-05-11 10:27:04', NULL),
	(81, 'Simbox PreU', '', '', NULL, NULL, NULL, NULL, 4, 1, 20, 25, 5, '2022-05-04 13:42:51', '2022-05-04 13:42:51', NULL),
	(82, 'HCC', '', '', NULL, NULL, NULL, NULL, 5, 1, 20, 25, 5, '2022-05-04 13:43:33', '2022-05-04 13:43:33', NULL),
	(83, 'Nuestros Servicios', '', 'En Softdynamic ofrecemos servicios orientados a la mejora continua de procesos valiéndonos de soluciones innovadoras y de un equipo altamente calificado para ofrecer un servicio de calidad', NULL, NULL, NULL, NULL, 1, 1, 22, 24, 5, '2022-05-04 15:17:29', '2022-05-04 16:59:46', NULL),
	(84, 'Administración de Plataformas', 'Administración de plataformas', 'Mejora permanente de procesos internos, optimizando la disponibilidad y uso de los recursos para el sistema operativo y bases de datos.\r\nEntre los más grandes beneficios, está la reducción de costos administrativos y la delegación de funciones que permiten a la compañía concentrarse en su core business..', NULL, NULL, NULL, NULL, 1, 1, 23, 24, 5, '2022-05-04 10:25:56', '2022-05-05 09:28:33', NULL),
	(85, 'Hosting en la Nube', 'Hosting en la Nube', 'Infraestructura a la medida en un servidor dedicado para que tu negocio cuente con una solución que se adapte a sus necesidades específicas.', NULL, NULL, NULL, NULL, 2, 1, 23, 24, 5, '2022-05-04 10:27:20', '2022-05-05 09:28:55', NULL),
	(86, 'Asesoría tecnológica', 'Asesoría tecnológica', 'Permiten abordar proyectos que necesiten una fuerte personalización de la solución y su adaptación a las  particularidades de su empresa.\r\nSomos un panel de expertos, altamente especializado y de experiencia en tecnología, que pueden asesorar en cualquier demanda tecnológica que se quiera plantear.\r\nSirve para optimizar todos los recursos tecnológicos de tu empresa. \r\nEl principal objetivo de este servicio es que puedas contar con apoyo profesional al momento de elegir e implementar soluciones tecnológicas', NULL, NULL, NULL, NULL, 3, 1, 23, 24, 5, '2022-05-04 10:33:43', '2022-05-05 09:27:24', NULL),
	(87, 'personal 1', 'designer', 'designer designer designer designer designer designer designer designer designer designer designer designer designer designer designer designer designer ', NULL, NULL, NULL, NULL, 3, 1, 24, 24, 5, '2022-05-04 12:16:37', '2022-05-13 18:39:56', NULL),
	(88, 'Jose Mamani', 'Anallista Programador', '', NULL, NULL, NULL, NULL, 2, 1, 24, 24, 5, '2022-05-04 12:17:38', '2022-05-13 19:01:48', '2022-05-13 19:01:48'),
	(89, 'Alexander Zegarra', 'Gerente General', '', NULL, NULL, NULL, NULL, 1, 1, 24, 24, 5, '2022-05-04 12:18:27', '2022-05-13 18:40:04', NULL),
	(90, 'Personal 4', 'Tester', '', NULL, NULL, NULL, NULL, 4, 1, 24, 24, 5, '2022-05-04 12:41:45', '2022-05-04 12:41:45', NULL),
	(91, 'Proyectos tecnológicos a medida', 'Proyectos tecnológicos a medida', 'Diseño, Implementación, Desarrollos y Mantenimiento de proyectos tecnológicos a medida.\r\nSomos especialistas enfocados en brindar al usuario la mejor experiencia en la toma de requerimientos y desarrollar el producto deseado con métodos innovadores.', NULL, NULL, NULL, NULL, 4, 1, 23, 24, 5, '2022-05-05 09:20:33', '2022-05-05 09:20:33', NULL),
	(92, 'Gestión de correos corporativos', 'Gestión de correos corporativos', 'Un correo corporativo le da identidad a tu empresa. Distingue a tu empresa con clientes, proveedores y público.', NULL, NULL, NULL, NULL, 5, 1, 23, 24, 5, '2022-05-05 09:23:25', '2022-05-05 09:23:25', NULL),
	(93, 'Arquitectura de Soluciones', 'Arquitectura de Soluciones', 'Escuchamos tus necesidades y diseñamos una solución, mapeando los requerimientos funcionales hacia tecnologías.\r\nSomos el puente entre el cliente con sus necesidades, y nuestros expertos implementarán la solución. \r\nEl arquitecto también es responsable en crear un diseño con miras al futuro y a las posibles integraciones que la solución pueda requerir. Y entre más compleja sea la solución o más integraciones tenga, más evidente se hace la necesidad de tener un diseño claro para poder implementar la solución.', NULL, NULL, NULL, NULL, 6, 1, 23, 24, 5, '2022-05-05 09:24:28', '2022-05-05 09:26:02', NULL),
	(94, 'Asesoría en infraestructura en la nube', 'Asesoría en infraestructura en la nube', 'Te ayudamos a identificar qué cargas de trabajo están listas para trasladarse a la nube\r\nEl Servicio de asesoría sobre infraestructuras en la nube se enfoca en mejores prácticas para la adopción de la nube con nuestra experiencia trabajando con múltiples empresas para optimizar sus negocios.\r\nNuestros expertos trabajarán contigo para ofrecerte recomendaciones con las que ajustar la tecnología a las necesidades de tu empresa.', NULL, NULL, NULL, NULL, 7, 1, 23, 24, 5, '2022-05-05 09:25:34', '2022-05-05 09:25:34', NULL),
	(95, 'Farmex', '', '', NULL, NULL, NULL, NULL, 6, 1, 20, 25, 5, '2022-05-06 16:07:23', '2022-05-06 16:07:23', NULL),
	(96, 'FRI ESAN', '', '', NULL, NULL, NULL, NULL, 7, 1, 20, 25, 5, '2022-05-06 16:13:52', '2022-05-06 16:13:52', NULL),
	(97, 'Nosotros', 'como es nuestro equipo', '', NULL, NULL, NULL, NULL, 1, 1, 25, 24, 5, '2022-05-09 10:03:24', '2022-05-09 10:07:16', NULL),
	(98, 'Proyectos Realizados', 'clientes felices', '', NULL, NULL, NULL, NULL, 1, 1, 26, 24, 5, '2022-05-09 10:10:02', '2022-05-09 10:10:02', NULL),
	(99, 'Plataforma de Proyectos', 'https://proyectos.com', 'Plataforma de Proyectos Plataforma de Proyectos Plataforma de Proyectos Plataforma de Proyectos Plataforma de Proyectos Plataforma de Proyectos Plataforma de Proyectos ', NULL, NULL, NULL, NULL, 1, 1, 27, 24, 5, '2022-05-09 10:12:10', '2022-05-09 10:12:10', NULL),
	(100, 'CMIDEAS', '', '', NULL, NULL, NULL, NULL, 8, 1, 20, 25, 5, '2022-05-10 12:07:07', '2022-05-10 12:07:07', NULL),
	(101, 'ATU', '', '', NULL, NULL, NULL, NULL, 9, 1, 20, 25, 5, '2022-05-11 10:31:55', '2022-05-11 10:31:55', NULL),
	(102, 'IIPPO', '', '', NULL, NULL, NULL, NULL, 10, 1, 20, 25, 5, '2022-05-11 10:33:53', '2022-05-11 10:33:53', NULL),
	(103, 'Aenor', '', '', NULL, NULL, NULL, NULL, 11, 1, 20, 25, 5, '2022-05-11 12:36:03', '2022-05-11 12:36:03', NULL),
	(104, 'Correo electrónico', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 28, 26, 6, '2022-06-24 20:18:28', '2022-06-24 20:18:28', NULL),
	(105, 'Ofrece una tienda virtual de cursos, diplomados, especializaciones, entre oros.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 29, 27, 6, '2022-06-24 22:38:45', '2022-06-24 22:38:45', NULL),
	(106, 'Podrás encontrar distintos tipos de asesoría especializada.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 29, 27, 6, '2022-06-24 22:39:27', '2022-06-24 22:39:27', NULL),
	(107, 'Podrás encontrar las principales noticias financieras globales', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 29, 27, 6, '2022-06-24 22:40:03', '2022-06-24 22:40:03', NULL),
	(108, 'Podrás calcular la valorización y el costo de capital de las empresas.. Asimismo , encontrar el servicio adecuado a tus necesidades.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 29, 27, 6, '2022-06-24 22:41:55', '2022-06-24 22:41:55', NULL),
	(109, 'Ofrece un catálogo de libros, articulos y vídeos especializados en finanzas gratuitos o de paga.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 29, 27, 6, '2022-06-24 22:42:51', '2022-06-24 22:42:51', NULL),
	(110, 'Podrás realizar simulacros. Llevar el control de los examenes resueltos. Revisar las estadisticas por área tematica. Revisar el solucionario de preguntas.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 29, 27, 6, '2022-06-24 22:44:12', '2022-06-24 22:44:12', NULL),
	(111, 'Brinda las principales noticias a nivel  nacional e internacional del sector financiero', NULL, NULL, 'https://fri.com.pe/noticias/#/', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 22:57:44', '2022-06-28 16:36:15', NULL),
	(112, 'Calcula el costo de capital y el costo promedio ponderado de capital de tu inversión. Accede también a reportes especializados.', NULL, NULL, 'https://kapitals.org/', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 23:00:53', '2022-06-28 17:01:34', NULL),
	(113, 'Ofrece cursos, especializaciones,  seminarios, diplomados para su crecimiento  y desarrollo profesional.', NULL, NULL, 'https://pro-finance.platinumarket.com.pe/', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 23:01:29', '2022-06-28 17:01:54', NULL),
	(114, 'Integra simulacros  para CFA y otras certificaciones‎. Asimismo,  lleva registro de los exámenes resueltos', NULL, NULL, 'https://cfa.simbox.edu.pe/', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 23:11:30', '2022-06-28 17:02:18', NULL),
	(115, 'Aula virtual donde podrás revisar contenidos y asistir a clases virtuales', NULL, NULL, 'https://proeducative.com/', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 23:11:41', '2022-06-28 17:02:33', NULL),
	(116, 'Biblioteca Digital que permitirá obtener  Libros, revistas, audiolibros, blogs y diversos recursos educativos gratuitos  y de pago.', NULL, NULL, 'https://electure.platinumarket.com.pe/categoria/libros', NULL, NULL, NULL, 0, 1, 30, 28, 6, '2022-06-24 23:11:53', '2022-06-28 17:02:49', NULL),
	(117, 'COMUNIDAD FINANCIERA', 'REGISTRATE AHORA', 'Brinda y permite compartir y difundir conocimientos financieros, servicios y experiencias entre sus miembros. Funciona a través de una plataforma integrada e interactiva, donde encontrarás los mejores recursos para desarrollar, conectar e interactuar de manera profesional.', '#registrate', NULL, NULL, NULL, 0, 1, 31, 29, 6, '2022-06-25 00:17:33', '2022-06-28 16:36:48', NULL),
	(118, 'Sergio Bravo', NULL, 'Valorización de Start Ups', NULL, NULL, NULL, NULL, 2, 1, 32, 30, 6, '2022-06-25 00:17:58', '2022-06-25 00:20:18', NULL),
	(119, 'Sergio Bravo', NULL, 'Análisis del efecto del riesgo país en el costo de la deuda soberana', NULL, NULL, NULL, NULL, 3, 1, 32, 30, 6, '2022-06-25 00:18:22', '2022-06-25 00:19:32', NULL),
	(120, 'Sergio Bravo', NULL, 'Capacidad de endeudamiento y financiamiento de inversiones de la empresa', NULL, NULL, NULL, NULL, 1, 1, 32, 30, 6, '2022-06-25 00:18:38', '2022-06-25 00:20:13', NULL),
	(121, 'Sergio Bravo', NULL, 'Determinación de la tasa libre de riesgo en el costo de capital y la tasa de deuda', NULL, NULL, NULL, NULL, 4, 1, 32, 30, 6, '2022-06-25 00:18:54', '2022-06-25 00:19:19', NULL),
	(122, 'Bienvenido al podcast de la comunidad financiera', 'Escúchalo ahora en: ', 'Un podcast semanal sobre diversos conceptos y temas de interés en el sector financiero.', 'https://www.spotify.com/pe/', NULL, NULL, NULL, 0, 1, 35, 34, 6, '2022-06-27 21:44:45', '2022-06-28 17:46:48', NULL),
	(123, '¿Cuál es la diferencia entre ahorro e inversión?', 'Escúchalo ahora en: ', '', 'https://www.spotify.com/pe/', NULL, NULL, NULL, 0, 1, 36, 35, 6, '2022-06-27 22:39:25', '2022-06-28 17:46:41', NULL),
	(124, 'Portada', '', '', NULL, NULL, NULL, NULL, 1, 1, 35, 34, 6, '2022-06-28 13:05:18', '2022-06-28 17:30:44', '2022-06-28 17:30:44'),
	(125, '', NULL, '', '', NULL, NULL, NULL, 0, 0, 37, 36, 7, '2022-08-08 11:55:46', '2022-08-08 11:56:33', '2022-08-08 11:56:33'),
	(126, 'Simbox PMP', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', 'https://youtu.be/hSW4PpFp2Gg', NULL, NULL, NULL, 1, 1, 37, 36, 7, '2022-08-08 12:08:19', '2022-08-08 16:52:04', NULL),
	(127, 'Simbox PMP', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', 'https://youtu.be/hSW4PpFp2Gg', NULL, NULL, NULL, 0, 1, 37, 36, 7, '2022-08-08 12:08:39', '2022-08-08 12:10:46', '2022-08-08 12:10:46'),
	(128, 'Simbox PMP', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', 'https://youtu.be/hSW4PpFp2Gg', NULL, NULL, NULL, 0, 1, 37, 36, 7, '2022-08-08 12:08:55', '2022-08-08 12:10:42', '2022-08-08 12:10:42'),
	(129, 'E Supervision', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', '', NULL, NULL, NULL, 3, 1, 37, 36, 7, '2022-08-08 12:13:29', '2022-08-08 16:53:06', NULL),
	(130, 'Pro Budget', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', '', NULL, NULL, NULL, 2, 1, 37, 36, 7, '2022-08-08 12:14:32', '2022-08-08 16:52:58', NULL),
	(131, 'wewwrewewe', NULL, 'ewewefwefweffwe', '', NULL, NULL, NULL, 0, 1, 37, 36, 7, '2022-08-08 12:30:41', '2022-08-08 12:49:40', '2022-08-08 12:49:40'),
	(132, 'asas', NULL, 'dasdasdadd', '', NULL, NULL, NULL, 0, 1, 37, 36, 7, '2022-08-08 12:44:17', '2022-08-08 12:49:37', '2022-08-08 12:49:37'),
	(133, 'Pro Deging', NULL, 'This is the first items accordion bodyIt is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. Its also worth noting that just about any HTML can go within the accordion-body, though the transition does limit overflow', '', NULL, NULL, NULL, 4, 1, 37, 36, 7, '2022-08-08 13:18:51', '2022-08-08 16:55:24', NULL),
	(134, 'Comunidad de Proyectos  Pro 360', NULL, 'Comunidad estándar integral que facilitará procesos colaborativos de \r\ngestión, diseño colaborativo, ejecución y supervisión de proyectos en sus \r\ndiferentes ciclos de inversión, adaptada a la realidad nacional. Desde la \r\ncomunidad PRO 360, obtendrás un único acceso a todas las plataformas \r\nque la conforman.', NULL, NULL, NULL, NULL, 1, 1, 38, 37, 7, '2022-08-08 21:39:54', '2022-08-08 21:39:54', NULL),
	(135, 'Pro 361', NULL, 'fnio sdjfhsdjfn  iosjsiodf \r\nsfsdfbsdif s\r\nsv sdsdfsefwerfwefwefwe', NULL, NULL, NULL, NULL, 2, 1, 38, 37, 7, '2022-08-08 21:53:18', '2022-08-08 21:53:18', NULL),
	(136, 'Planificación de proyectos:', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 39, 38, 7, '2022-08-08 22:51:35', '2022-08-08 22:52:08', NULL),
	(137, 'Aseoría y diseño web:', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 39, 38, 7, '2022-08-08 22:52:02', '2022-08-08 22:52:02', NULL),
	(138, 'Aseoría y programación web:', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 39, 38, 7, '2022-08-08 22:52:27', '2022-08-08 22:52:27', NULL);

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

-- Volcando estructura para tabla db_margarita.contents_files
CREATE TABLE IF NOT EXISTS `contents_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `bucket` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `peso` varchar(255) DEFAULT NULL,
  `embed` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) unsigned DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_files: ~14 rows (aproximadamente)
INSERT INTO `contents_files` (`id`, `name`, `url`, `bucket`, `type`, `format`, `size`, `peso`, `embed`, `content_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'example1.mp3', '/upload/files/165643922662bb41ba85be1', 'localhost', 'audio/mpeg', 'mp3', '2.36 MB', '2469860', NULL, 123, '2022-06-28 13:00:26', '2022-06-28 13:00:26', NULL),
	(2, 'simbox.jpg', '/upload/files/165997853562f143274a5a1', 'localhost', 'image/jpeg', 'jpg', '23.44 KB', '23999', NULL, 128, '2022-08-08 12:08:55', '2022-08-08 12:08:55', NULL),
	(3, 'img43.jpg', '/upload/files/165997964262f1477a55419', 'localhost', 'image/jpeg', 'jpg', '11.05 KB', '11311', NULL, 130, '2022-08-08 12:27:22', '2022-08-08 12:55:14', '2022-08-08 12:55:14'),
	(4, 'academi.jpg', '/upload/files/165997984162f148415ac15', 'localhost', 'image/jpeg', 'jpg', '6.28 KB', '6431', NULL, 131, '2022-08-08 12:30:41', '2022-08-08 12:35:02', '2022-08-08 12:35:02'),
	(5, 'academi.jpg', '/upload/files/165998010262f1494651b2f', 'localhost', 'image/jpeg', 'jpg', '6.28 KB', '6431', NULL, 131, '2022-08-08 12:35:02', '2022-08-08 12:35:02', NULL),
	(6, 'consulting.jpg', '/upload/files/165998065762f14b714e977', 'localhost', 'image/jpeg', 'jpg', '20.78 KB', '21277', NULL, 132, '2022-08-08 12:44:17', '2022-08-08 12:47:27', '2022-08-08 12:47:27'),
	(7, 'img95.jpg', '/upload/files/165998084762f14c2f39e8c', 'localhost', 'image/jpeg', 'jpg', '22.03 KB', '22560', NULL, 132, '2022-08-08 12:47:27', '2022-08-08 12:47:27', NULL),
	(8, 'img95.jpg', '/upload/files/165998131462f14e02d3ea0', 'localhost', 'image/jpeg', 'jpg', '22.03 KB', '22560', NULL, 130, '2022-08-08 12:55:14', '2022-08-08 13:21:11', '2022-08-08 13:21:11'),
	(9, 'consulting.jpg', '/upload/files/165998273162f1538b8d91f', 'localhost', 'image/jpeg', 'jpg', '20.78 KB', '21277', NULL, 133, '2022-08-08 13:18:51', '2022-08-08 13:20:50', '2022-08-08 13:20:50'),
	(10, 'esupervicion.jpg', '/upload/files/165998285062f154025ee17', 'localhost', 'image/jpeg', 'jpg', '19.54 KB', '20009', NULL, 133, '2022-08-08 13:20:50', '2022-08-08 16:54:44', '2022-08-08 16:54:44'),
	(11, 'img95.jpg', '/upload/files/165998287162f15417ac608', 'localhost', 'image/jpeg', 'jpg', '22.03 KB', '22560', NULL, 130, '2022-08-08 13:21:11', '2022-08-08 13:21:11', NULL),
	(12, 'esupervicion.jpg', '/upload/files/165998288762f15427aa087', 'localhost', 'image/jpeg', 'jpg', '19.54 KB', '20009', NULL, 129, '2022-08-08 13:21:27', '2022-08-08 13:21:27', NULL),
	(13, 'simbox.jpg', '/upload/files/165998290362f15437b9dfc', 'localhost', 'image/jpeg', 'jpg', '23.44 KB', '23999', NULL, 126, '2022-08-08 13:21:43', '2022-08-08 13:21:43', NULL),
	(14, 'prodising.jpg', '/upload/files/165999568462f18624dde6a', 'localhost', 'image/jpeg', 'jpg', '21.53 KB', '22051', NULL, 133, '2022-08-08 16:54:44', '2022-08-08 16:55:24', '2022-08-08 16:55:24'),
	(15, 'prodising.jpg', '/upload/files/165999572462f1864c21a28', 'localhost', 'image/jpeg', 'jpg', '21.53 KB', '22051', NULL, 133, '2022-08-08 16:55:24', '2022-08-08 16:55:24', NULL);

-- Volcando estructura para tabla db_margarita.contents_images
CREATE TABLE IF NOT EXISTS `contents_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `gallery` int(11) DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `content_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_images: ~167 rows (aproximadamente)
INSERT INTO `contents_images` (`id`, `image`, `gallery`, `order`, `content_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(7, '/upload/images/1636665234618d8792ca17f-slider-1-scratch.png', 0, 0, 8, 1, '2021-08-12 16:47:26', '2021-11-11 16:13:54', NULL),
	(8, '/upload/images/16371891666195862ee908e-chica stetic 2.png', 0, 0, 8, 1, '2021-08-12 16:47:26', '2021-11-17 17:46:06', NULL),
	(10, '/upload/images/1628805070611597ce06545-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-12 16:51:10', '2021-10-15 14:41:07', '2021-08-30 15:10:18'),
	(16, '/upload/images/1636665255618d87a763882-slider-1-scratch.png', 0, 0, 12, 1, '2021-08-12 16:47:26', '2021-11-11 16:14:15', NULL),
	(17, '/upload/images/1637189800619588a896439-chica stetic 3.png', 0, 0, 12, 1, '2021-08-12 16:47:26', '2021-11-17 17:56:40', NULL),
	(18, '/upload/images/163417169161677b2b59868-somos.png', 0, 0, 15, 1, '2021-08-30 13:12:09', '2021-10-15 14:41:18', NULL),
	(19, '/upload/images/1630354900612d3dd42f02c-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-30 15:21:40', '2021-10-15 14:41:20', '2021-08-30 15:23:05'),
	(20, '/upload/images/1630355026612d3e529198e-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-30 15:23:46', '2021-10-15 14:41:22', '2021-08-30 15:25:36'),
	(21, '/upload/images/1636672767618da4ff83683-estudiante cuadrado.jpeg', 0, 0, 14, 1, '2021-08-30 15:52:46', '2021-11-11 18:19:27', NULL),
	(22, '/upload/images/16341412756167045b86e70-20210817_164300.jpg', 0, 0, 20, 1, '2021-08-30 18:01:13', '2021-10-15 14:41:48', NULL),
	(23, '/upload/images/16343230806169ca887ddf2-bella curet.png', 0, 0, 24, 1, '2021-08-30 18:24:53', '2021-10-15 13:38:00', NULL),
	(24, '/upload/images/16343230916169ca9326068-carthage.png', 0, 0, 25, 1, '2021-08-30 18:25:16', '2021-10-15 13:38:11', NULL),
	(25, '/upload/images/16343231006169ca9cd8e98-ield.png', 0, 0, 26, 1, '2021-08-30 18:25:39', '2021-10-15 13:38:20', NULL),
	(26, '/upload/images/163719157961958f9b4c05a-chica stetic 3.png', 0, 0, 27, 1, '2021-08-30 18:34:43', '2021-11-17 18:26:19', NULL),
	(27, '/upload/images/163061695861313d7eb8a03-estudiante-2.jpg', 1, 4, 28, 1, '2021-09-02 16:09:18', '2022-02-03 11:53:47', NULL),
	(28, '/upload/images/163061698361313d979b5fc-estudiante-2.jpg', 0, 0, 29, 1, '2021-09-02 16:09:43', '2021-10-15 14:42:04', NULL),
	(29, '/upload/images/163061699861313da6decb6-estudiante-5.jpg', 1, 3, 30, 1, '2021-09-02 16:09:58', '2022-02-03 11:53:47', NULL),
	(30, '/upload/images/163061702361313dbfaeba1-estudiante-6.jpg', 0, 0, 31, 1, '2021-09-02 16:10:23', '2021-10-15 14:42:08', NULL),
	(31, '/upload/images/163414391661670eac6c63a-20210405_121835.jpg', 1, 1, 0, 1, '2021-10-13 11:51:56', '2021-10-15 14:42:14', '2021-10-13 16:25:09'),
	(32, '/upload/images/163414393161670ebb2ebdf-20210405_121927.jpg', 1, 2, 0, 1, '2021-10-13 11:52:11', '2021-10-15 14:42:16', '2021-10-13 16:25:19'),
	(33, '/upload/images/163414394861670eccc9ed6-20210405_123150.jpg', 1, 3, 0, 1, '2021-10-13 11:52:28', '2021-10-15 14:42:19', '2021-10-13 16:25:12'),
	(34, '/upload/images/163414397661670ee879ce9-20210512_123942.jpg', 1, 4, 0, 1, '2021-10-13 11:52:56', '2021-10-15 14:42:22', '2021-10-13 16:25:15'),
	(35, '/upload/images/163414399861670efec6f0a-20210517_120225.jpg', 1, 5, 0, 1, '2021-10-13 11:53:18', '2021-10-15 14:42:24', '2021-10-13 16:24:50'),
	(36, '/upload/images/163414401261670f0c50290-20210517_130829.jpg', 1, 6, 0, 1, '2021-10-13 11:53:32', '2021-10-15 14:42:26', '2021-10-13 16:24:54'),
	(37, '/upload/images/163414404761670f2fc3a59-20210716_182607.jpg', 0, 0, 0, 1, '2021-10-13 11:54:07', '2021-10-15 14:42:10', '2021-10-14 15:51:26'),
	(38, '/upload/images/163414406261670f3ec9db1-20210817_164311.jpg', 1, 7, 0, 1, '2021-10-13 11:54:22', '2021-10-15 14:42:29', '2021-10-13 16:25:01'),
	(39, '/upload/images/163414407661670f4c5a8e1-20210817_161411.jpg', 1, 8, 0, 1, '2021-10-13 11:54:36', '2021-10-15 14:42:32', '2021-10-13 16:25:05'),
	(40, '/upload/images/163424512461689a04c4ccc-logos friesan_friesan original.png', 0, 0, 33, 2, '2021-10-14 15:51:26', '2021-10-14 15:58:44', NULL),
	(41, '/upload/images/163424512461689a04c599d-logos friesan_friesan rojo.png', 0, 0, 33, 2, '2021-10-14 15:51:26', '2021-10-14 15:58:44', NULL),
	(42, '/upload/images/16342467256168a045c50f1-logos friesan_friesan rojo.png', 0, 0, 34, 2, '2021-10-14 16:25:25', '2021-10-14 16:25:25', NULL),
	(43, '/upload/images/163430806761698fe34d20e-20210507_155212.jpg', 1, 9, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(44, '/upload/images/163430806761698fe351ea1-20210514_161042.jpg', 1, 10, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(45, '/upload/images/163430806761698fe352cb8-20210514_173923.jpg', 1, 11, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(46, '/upload/images/163430806761698fe353425-20210517_120427.jpg', 1, 12, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(47, '/upload/images/163430806761698fe353b5a-20210519_190815.jpg', 1, 13, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(48, '/upload/images/163430806761698fe35436b-20210615_130333.jpg', 1, 14, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(49, '/upload/images/163430806761698fe354aca-20210810_165528.jpg', 1, 15, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(50, '/upload/images/163430806761698fe35543a-20210730_191648.jpg', 1, 1, 0, 1, '2021-10-15 09:27:47', '2021-10-15 10:07:36', '2021-10-15 10:07:36'),
	(51, '/upload/images/163430806761698fe3560a8-20210405_121941.jpg', 1, 17, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(52, '/upload/images/163430806761698fe3568a4-20210405_123150.jpg', 1, 18, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(53, '/upload/images/163430806761698fe357132-20210512_123942.jpg', 1, 19, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(54, '/upload/images/163430806761698fe357c12-20210512_185533.jpg', 0, 0, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(55, '/upload/images/163430806761698fe3583c9-20210512_191146.jpg', 1, 20, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(56, '/upload/images/163430806761698fe358bec-20210517_130829.jpg', 1, 21, 0, 1, '2021-10-15 09:27:47', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(57, '/upload/images/1634308557616991cd76cc6-20210810_165536.jpg', 1, 1, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(58, '/upload/images/1634308557616991cd7b08f-20210810_165537.jpg', 1, 1, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(59, '/upload/images/1634308557616991cd7bb08-20210810_165539.jpg', 1, 5, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(60, '/upload/images/1634308557616991cd7c3b9-20210810_172105.jpg', 1, 1, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(61, '/upload/images/1634308557616991cd7cb9b-20210816_122103.jpg', 1, 3, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(62, '/upload/images/1634308557616991cd7d412-20210817_161354.jpg', 1, 1, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(63, '/upload/images/1634308557616991cd7de0e-20210817_161404.jpg', 1, 1, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(64, '/upload/images/1634308557616991cd7e719-20210817_161423.jpg', 1, 2, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(65, '/upload/images/1634308557616991cd7ef9c-20210817_161741.jpg', 1, 30, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(66, '/upload/images/1634308557616991cd7f808-20210817_162112.jpg', 1, 31, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(67, '/upload/images/1634308557616991cd800e2-20210817_162513.jpg', 1, 32, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(68, '/upload/images/1634308557616991cd80908-20210817_163333.jpg', 1, 33, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(69, '/upload/images/1634308557616991cd811da-20210817_163637.jpg', 1, 34, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(70, '/upload/images/1634308557616991cd81ab9-20210817_164041.jpg', 1, 35, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(71, '/upload/images/1634308557616991cd82440-20210817_163343.jpg', 1, 2, 0, 1, '2021-10-15 09:35:57', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(72, '/upload/images/1634310356616998d411957-whatsapp image 2021-06-24 at 7.43.52 am (1).png', 1, 0, 0, 1, '2021-10-15 10:05:56', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(73, '/upload/images/1634310356616998d416798-whatsapp image 2021-06-24 at 7.43.54 am (2).png', 1, 17, 0, 1, '2021-10-15 10:05:56', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(74, '/upload/images/1634310496616999604d9c1-20210817_164300.jpg', 1, 2, 0, 1, '2021-10-15 10:08:16', '2021-10-15 13:20:25', '2021-10-15 13:20:25'),
	(75, '/upload/images/16343231126169caa8f1599-marti.png', 0, 0, 35, 1, '2021-10-15 13:20:25', '2021-10-15 13:38:33', NULL),
	(76, '/upload/images/16343231236169cab3b5ed1-svelta.png', 0, 0, 36, 1, '2021-10-15 13:38:43', '2021-10-15 13:38:43', NULL),
	(77, '/upload/images/1636666516618d8c94a2d24-20210817_161323.jpg', 0, 0, 37, 1, '2021-11-11 16:25:44', '2021-11-11 16:35:16', NULL),
	(78, '/upload/images/1636666529618d8ca183736-whatsapp image 2021-06-24 at 7.43.52 am (1).png', 0, 0, 38, 1, '2021-11-11 16:35:29', '2021-11-11 16:35:29', NULL),
	(79, '/upload/images/1636673123618da663c3e56-axila.jpg', 1, 2, 39, 1, '2021-11-11 16:35:40', '2022-02-03 11:53:47', NULL),
	(80, '/upload/images/1636748280618ecbf8bb989-whatsapp image 2021-11-11 at 18.27.50.jpeg', 0, 0, 40, 1, '2021-11-11 16:35:51', '2021-11-12 15:18:00', NULL),
	(81, '/upload/images/1636667714618d91428c0b0-20210517_122050.jpg', 0, 0, 41, 1, '2021-11-11 16:43:56', '2021-11-11 16:55:14', NULL),
	(82, '/upload/images/1636667742618d915ee6c36-20210517_120225.jpg', 0, 0, 42, 1, '2021-11-11 16:44:19', '2021-11-11 16:55:42', NULL),
	(83, '/upload/images/1636667754618d916acf6aa-20210817_164055.jpg', 1, 1, 43, 1, '2021-11-11 16:44:31', '2022-02-03 11:53:47', NULL),
	(84, '/upload/images/1636667766618d91767e705-20210405_123150.jpg', 0, 0, 44, 1, '2021-11-11 16:44:40', '2021-11-11 16:56:06', NULL),
	(85, '/upload/images/1636668630618d94d6766a1-249236867_4368357616618645_2215991493153889471_n (1).jpg', 0, 1, 53, 1, '2021-11-11 17:02:28', '2022-02-03 11:53:47', NULL),
	(86, '/upload/images/1636670447618d9bef1c0ef-166777012_3736248413162905_2353729233016650361_n.jpg', 0, 0, 49, 1, '2021-11-11 17:14:01', '2021-11-11 17:40:47', NULL),
	(87, '/upload/images/1636670149618d9ac5cfb66-estudiante cuadrado.jpeg', 0, 0, 48, 1, '2021-11-11 17:18:30', '2021-11-11 17:35:49', NULL),
	(88, '/upload/images/16371918366195909cf3e25-239236857_4146603008794108_7974988305570988986_n.jpg', 1, 5, 0, 1, '2021-11-17 18:30:37', '2022-05-03 12:10:10', '2022-05-03 12:10:10'),
	(89, '/upload/images/16371918376195909d0fd6d-banner 2.jpg', 1, 6, 0, 1, '2021-11-17 18:30:37', '2022-05-03 12:10:10', '2022-05-03 12:10:10'),
	(90, '/upload/images/16371918376195909d5fa7e-252682661_4368356176618789_6195791037580537737_n.jpg', 1, 7, 0, 1, '2021-11-17 18:30:37', '2022-05-03 12:10:10', '2022-05-03 12:10:10'),
	(91, '/upload/images/1652135380627995d4b1c4e-industry-3087393_1920 (1).jpg', 0, 0, 55, 5, '2022-04-28 18:25:13', '2022-05-09 17:29:40', NULL),
	(92, '/upload/images/1652195822627a81eeb9c8b-cloud-6515064_1920.jpg', 0, 0, 58, 5, '2022-04-28 18:25:47', '2022-05-10 10:17:02', NULL),
	(93, '/upload/images/1651597530627160da1d3f7-banner.png', 1, 1, 0, 5, '2022-05-03 12:05:30', '2022-05-03 12:10:10', '2022-05-03 12:10:10'),
	(94, '/upload/images/1652195905627a824191e49-web-4861605_1920.jpg', 0, 0, 72, 5, '2022-05-03 12:10:10', '2022-05-10 10:18:25', NULL),
	(95, '/upload/images/1652195391627a803fe3916-technology-7111760_1920.jpg', 0, 0, 73, 5, '2022-05-03 12:54:46', '2022-05-10 10:09:51', NULL),
	(96, '/upload/images/1652195837627a81fda5762-contact-us-2993000_1920.jpg', 0, 0, 74, 5, '2022-05-03 12:59:39', '2022-05-10 10:17:17', NULL),
	(97, '/upload/images/1652196042627a82cad677f-businessman-3075837_1920.jpg', 0, 0, 75, 5, '2022-05-03 13:02:55', '2022-05-10 10:20:42', NULL),
	(98, '/upload/images/1652196245627a83958cade-network-6564511_1920.jpg', 0, 0, 76, 5, '2022-05-03 13:09:02', '2022-05-10 10:24:05', NULL),
	(99, '/upload/images/1652282453627bd45560a6f-administrador_de_plataformas-removebg-preview (1).png', 0, 0, 59, 5, '2022-05-03 16:17:30', '2022-05-11 10:20:53', NULL),
	(100, '/upload/images/1652282464627bd4603ae30-hosting_en_la_nube-removebg-preview (1).png', 0, 0, 60, 5, '2022-05-03 16:17:44', '2022-05-11 10:21:04', NULL),
	(101, '/upload/images/16516879866272c2328b0d9-asesoría_tecnológica-removebg-preview.png', 0, 0, 61, 5, '2022-05-03 16:17:59', '2022-05-04 13:13:06', NULL),
	(102, '/upload/images/1652282797627bd5add1536-165161269062719c12907c3-gestión de correo corporativo (1).png', 0, 0, 78, 5, '2022-05-03 16:18:10', '2022-05-11 10:26:37', NULL),
	(103, '/upload/images/1652282784627bd5a099da2-16516881046272c2a896ac1-proyectos_a_medida-removebg-preview (1).png', 0, 0, 77, 5, '2022-05-03 16:19:43', '2022-05-11 10:26:24', NULL),
	(104, '/upload/images/1652282812627bd5bc2d230-16516881176272c2b5b8f2d-arquitectura_de_soluciones-removebg-preview (1).png', 0, 0, 79, 5, '2022-05-03 16:19:57', '2022-05-11 10:26:52', NULL),
	(105, '/upload/images/1652282824627bd5c826ab0-165161280762719c87e0207-asesoria infraestructura en la nube (1).png', 0, 0, 80, 5, '2022-05-03 16:20:07', '2022-05-11 10:27:04', NULL),
	(106, '/upload/images/16516147366271a41008133-antamina.png', 0, 0, 66, 5, '2022-05-03 16:48:41', '2022-05-11 16:28:26', '2022-05-11 16:28:26'),
	(107, '/upload/images/1652304532627c2a945b3ad-plaindes_logo.png', 0, 0, 67, 5, '2022-05-03 16:49:08', '2022-05-11 16:28:52', NULL),
	(108, '/upload/images/1652304545627c2aa1334b1-casalegalia_logo.png', 0, 0, 68, 5, '2022-05-04 13:07:51', '2022-05-11 16:29:05', NULL),
	(109, '/upload/images/1652304556627c2aacd13f0-simbox_logo.png', 0, 0, 81, 5, '2022-05-04 13:42:51', '2022-05-11 16:29:16', NULL),
	(110, '/upload/images/16516899066272c9b2795a3-hcc_logo-removebg-preview.png', 0, 0, 82, 5, '2022-05-04 13:43:33', '2022-05-04 13:45:06', NULL),
	(111, '/upload/images/16516954496272df590161b-fondo.jpg', 0, 0, 83, 5, '2022-05-04 15:17:29', '2022-05-04 15:17:29', NULL),
	(112, '/upload/images/16516984316272eaff53f05-mini_siluetajpg.jpg', 0, 0, 87, 5, '2022-05-04 16:07:11', '2022-05-04 16:07:11', NULL),
	(113, '/upload/images/1652486445627ef12d29103-jose-removebg-preview (1) (1) (2).png', 0, 0, 88, 5, '2022-05-04 16:07:23', '2022-05-13 19:00:45', NULL),
	(114, '/upload/images/1652485125627eec05658fe-alex-removebg-preview.png', 0, 0, 89, 5, '2022-05-04 16:07:46', '2022-05-13 18:38:45', NULL),
	(115, '/upload/images/1652202202627a9adad6164-logo_fri.png', 0, 0, 69, 5, '2022-05-06 12:41:14', '2022-05-10 12:03:22', NULL),
	(116, '/upload/images/165187124362758e0b76c54-logo_farmex.png', 0, 0, 95, 5, '2022-05-06 16:07:23', '2022-05-06 16:07:23', NULL),
	(117, '/upload/images/165187163262758f904015e-logo_fri.png', 0, 0, 96, 5, '2022-05-06 16:13:52', '2022-05-06 16:13:52', NULL),
	(118, '/upload/images/165210873262792dbc2c53f-fondo.jpg', 0, 0, 97, 5, '2022-05-09 10:05:32', '2022-05-09 10:05:32', NULL),
	(119, '/upload/images/165210900262792ecad2ba3-fondo.jpg', 0, 0, 98, 5, '2022-05-09 10:10:02', '2022-05-09 10:10:02', NULL),
	(120, '/upload/images/165210913062792f4a9f932-proyectos.png', 0, 0, 99, 5, '2022-05-09 10:12:10', '2022-05-09 10:12:10', NULL),
	(121, '/upload/images/1652199664627a90f0d8229-p.hospitales.jpg', 0, 0, 62, 5, '2022-05-10 11:21:04', '2022-05-10 11:25:31', '2022-05-10 11:25:31'),
	(122, '/upload/images/1652200601627a94990970e-p.hospitales.jpg', 0, 0, 62, 5, '2022-05-10 11:25:31', '2022-05-10 11:36:41', NULL),
	(123, '/upload/images/1652200466627a941228bef-p.legalia (2).jpg', 0, 0, 63, 5, '2022-05-10 11:26:58', '2022-05-10 11:34:26', NULL),
	(124, '/upload/images/1652202132627a9a94515b7-logo_farmex.png', 0, 0, 70, 5, '2022-05-10 12:02:12', '2022-05-10 12:02:12', NULL),
	(125, '/upload/images/1652202378627a9b8ad978a-cmi.png', 0, 0, 71, 5, '2022-05-10 12:06:18', '2022-05-10 12:06:18', NULL),
	(126, '/upload/images/1652202427627a9bbbe6883-cmi.png', 0, 0, 100, 5, '2022-05-10 12:07:07', '2022-05-10 12:07:07', NULL),
	(127, '/upload/images/1652283115627bd6ebd5cb0-logo atu.png', 0, 0, 101, 5, '2022-05-11 10:31:55', '2022-05-11 10:31:55', NULL),
	(128, '/upload/images/1652283233627bd7615e38e-iippo_logo.png', 0, 0, 102, 5, '2022-05-11 10:33:53', '2022-05-11 10:33:53', NULL),
	(129, '/upload/images/1652290563627bf403c463b-1615908661-logocampusaenorhorizontal.jpg', 0, 0, 103, 5, '2022-05-11 12:36:03', '2022-05-11 12:36:03', NULL),
	(130, '/upload/images/165643586062bb3494bc0ca-beneficio-1.png', 0, 0, 105, 6, '2022-06-28 12:04:20', '2022-06-28 12:04:20', NULL),
	(131, '/upload/images/165643587462bb34a286039-beneficio-2.png', 0, 0, 106, 6, '2022-06-28 12:04:34', '2022-06-28 12:04:34', NULL),
	(132, '/upload/images/165643588662bb34aebfc7d-beneficio-3.png', 0, 0, 107, 6, '2022-06-28 12:04:46', '2022-06-28 12:04:46', NULL),
	(133, '/upload/images/165643591962bb34cff3690-beneficio-4.png', 0, 0, 108, 6, '2022-06-28 12:05:20', '2022-06-28 12:05:20', NULL),
	(134, '/upload/images/165643593062bb34da3a3f2-beneficio-5.png', 0, 0, 109, 6, '2022-06-28 12:05:30', '2022-06-28 12:05:30', NULL),
	(135, '/upload/images/165643593962bb34e373820-beneficio-6.png', 0, 0, 110, 6, '2022-06-28 12:05:39', '2022-06-28 12:05:39', NULL),
	(136, '/upload/images/165643624562bb36159c78b-baner-one.jpg', 0, 0, 117, 6, '2022-06-28 12:10:45', '2022-06-28 12:10:45', NULL),
	(137, '/upload/images/165643851462bb3ef284dd7-imagen-entity-1.png', 0, 0, 111, 6, '2022-06-28 12:48:34', '2022-06-28 12:48:34', NULL),
	(138, '/upload/images/165643852462bb3efc46557-imagen-entity-2.png', 0, 0, 112, 6, '2022-06-28 12:48:44', '2022-06-28 12:48:44', NULL),
	(139, '/upload/images/165643853362bb3f051d0a4-imagen-entity-3.png', 0, 0, 113, 6, '2022-06-28 12:48:53', '2022-06-28 12:48:53', NULL),
	(140, '/upload/images/165643856262bb3f22d8bcb-imagen-entity-4.png', 0, 0, 114, 6, '2022-06-28 12:49:22', '2022-06-28 12:49:22', NULL),
	(141, '/upload/images/165643857662bb3f30ceec9-imagen-entity-5.png', 0, 0, 115, 6, '2022-06-28 12:49:36', '2022-06-28 12:49:36', NULL),
	(142, '/upload/images/165643864062bb3f70509bf-imagen-entity-6.png', 0, 0, 116, 6, '2022-06-28 12:50:40', '2022-06-28 12:50:40', NULL),
	(143, '/upload/images/165643951862bb42dedddef-microfono.png', 0, 0, 124, 6, '2022-06-28 13:05:18', '2022-06-28 13:05:18', NULL),
	(144, '/upload/images/165645552262bb816275880-microfono.png', 0, 0, 122, 6, '2022-06-28 17:32:02', '2022-06-28 17:32:02', NULL),
	(145, '/upload/images/165997774662f1401240a60-img3.jpg', 0, 0, 125, 7, '2022-08-08 11:55:46', '2022-08-08 11:55:46', NULL),
	(146, '/upload/images/165997849962f143031078e-img2323.jpg', 0, 0, 126, 7, '2022-08-08 12:08:19', '2022-08-08 12:59:16', '2022-08-08 12:59:16'),
	(147, '/upload/images/165997849962f1430311216-img2315.jpg', 0, 0, 126, 7, '2022-08-08 12:08:19', '2022-08-08 12:59:16', '2022-08-08 12:59:16'),
	(148, '/upload/images/165997851962f14317d82a5-img2323.jpg', 0, 0, 127, 7, '2022-08-08 12:08:39', '2022-08-08 12:08:39', NULL),
	(149, '/upload/images/165997851962f14317d8e3b-img2315.jpg', 0, 0, 127, 7, '2022-08-08 12:08:39', '2022-08-08 12:08:39', NULL),
	(150, '/upload/images/165997853562f1432748fb0-img2323.jpg', 0, 0, 128, 7, '2022-08-08 12:08:55', '2022-08-08 12:08:55', NULL),
	(151, '/upload/images/165997855662f1433ce7db6-img1097.jpg', 0, 0, 128, 7, '2022-08-08 12:09:16', '2022-08-08 12:09:30', '2022-08-08 12:09:30'),
	(152, '/upload/images/165997857062f1434ac7aab-img1097.jpg', 0, 0, 128, 7, '2022-08-08 12:09:30', '2022-08-08 12:09:30', NULL),
	(153, '/upload/images/165997865962f143a339637-img43.jpg', 0, 0, 126, 7, '2022-08-08 12:10:59', '2022-08-08 12:59:16', '2022-08-08 12:59:16'),
	(154, '/upload/images/165997880962f14439a3080-img43.jpg', 0, 0, 129, 7, '2022-08-08 12:13:29', '2022-08-08 12:55:03', '2022-08-08 12:55:03'),
	(155, '/upload/images/165997880962f14439a397f-img1097.jpg', 0, 0, 129, 7, '2022-08-08 12:13:29', '2022-08-08 12:55:03', '2022-08-08 12:55:03'),
	(156, '/upload/images/165997887262f14478c0018-img51.jpg', 0, 0, 130, 7, '2022-08-08 12:14:32', '2022-08-08 12:27:10', '2022-08-08 12:27:10'),
	(157, '/upload/images/165997887262f14478c0e49-img59.jpg', 0, 0, 130, 7, '2022-08-08 12:14:32', '2022-08-08 12:27:10', '2022-08-08 12:27:10'),
	(158, '/upload/images/165997984162f1484158463-img51.jpg', 0, 0, 131, 7, '2022-08-08 12:30:41', '2022-08-08 12:30:41', NULL),
	(159, '/upload/images/165998051262f14ae08e0fe-consulting.jpg', 0, 0, 131, 7, '2022-08-08 12:41:52', '2022-08-08 12:42:39', '2022-08-08 12:42:39'),
	(160, '/upload/images/165998055962f14b0fe6623-consulting.jpg', 0, 0, 131, 7, '2022-08-08 12:42:39', '2022-08-08 12:42:59', '2022-08-08 12:42:59'),
	(161, '/upload/images/165998057862f14b22f2539-consulting.jpg', 0, 0, 131, 7, '2022-08-08 12:42:59', '2022-08-08 12:43:43', '2022-08-08 12:43:43'),
	(162, '/upload/images/165998062362f14b4f1cf91-consulting.jpg', 0, 0, 131, 7, '2022-08-08 12:43:43', '2022-08-08 12:43:43', NULL),
	(163, '/upload/images/165998065762f14b714d3bf-academi.jpg', 0, 0, 132, 7, '2022-08-08 12:44:17', '2022-08-08 12:44:17', NULL),
	(164, '/upload/images/165998087462f14c4ae682b-prodising.jpg', 0, 0, 132, 7, '2022-08-08 12:47:54', '2022-08-08 12:47:54', NULL),
	(165, '/upload/images/165998147062f14e9e36255-img67.jpg', 0, 0, 129, 7, '2022-08-08 12:57:50', '2022-08-08 12:57:50', NULL),
	(166, '/upload/images/165998147062f14e9e3a9e2-img3.jpg', 0, 0, 129, 7, '2022-08-08 12:57:50', '2022-08-08 12:57:50', NULL),
	(167, '/upload/images/165998150762f14ec3e66f6-img1097.jpg', 0, 0, 130, 7, '2022-08-08 12:58:27', '2022-08-08 16:52:58', '2022-08-08 16:52:58'),
	(168, '/upload/images/165998150762f14ec3eaad8-img2315.jpg', 0, 0, 130, 7, '2022-08-08 12:58:27', '2022-08-08 16:52:58', '2022-08-08 16:52:58'),
	(169, '/upload/images/165998155662f14ef45a32d-img51.jpg', 0, 0, 126, 7, '2022-08-08 12:59:16', '2022-08-08 12:59:16', NULL),
	(170, '/upload/images/165998155662f14ef45e88a-img1097.jpg', 0, 0, 126, 7, '2022-08-08 12:59:16', '2022-08-08 12:59:16', NULL),
	(171, '/upload/images/165998227562f151c3f3190-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:11:16', '2022-08-08 13:13:03', '2022-08-08 13:13:03'),
	(172, '/upload/images/165998238362f1522f581c1-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:13:03', '2022-08-08 13:13:53', '2022-08-08 13:13:53'),
	(173, '/upload/images/165998243362f15261bc887-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:13:53', '2022-08-08 13:14:46', '2022-08-08 13:14:46'),
	(174, '/upload/images/165998248662f15296e99ef-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:14:46', '2022-08-08 13:15:09', '2022-08-08 13:15:09'),
	(175, '/upload/images/165998250962f152ad35b42-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:15:09', '2022-08-08 13:16:16', '2022-08-08 13:16:16'),
	(176, '/upload/images/165998257662f152f0ea604-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:16:16', '2022-08-08 13:16:51', '2022-08-08 13:16:51'),
	(177, '/upload/images/165998261162f15313b36d6-academi.jpg', 0, 0, 130, 7, '2022-08-08 13:16:51', '2022-08-08 16:52:58', '2022-08-08 16:52:58'),
	(178, '/upload/images/165998273162f1538b8c4d3-academi.jpg', 0, 0, 133, 7, '2022-08-08 13:18:51', '2022-08-08 16:54:44', '2022-08-08 16:54:44'),
	(179, '/upload/images/166000124262f19bda2865c-img1097.jpg', 0, 0, 130, 7, '2022-08-08 18:27:22', '2022-08-08 18:27:22', NULL),
	(180, '/upload/images/166000124262f19bda2d49d-img2315.jpg', 0, 0, 130, 7, '2022-08-08 18:27:22', '2022-08-08 18:27:22', NULL),
	(181, '/upload/images/166000124262f19bda2e07b-img1551.jpg', 0, 0, 130, 7, '2022-08-08 18:27:22', '2022-08-08 18:27:22', NULL),
	(182, '/upload/images/166000156362f19d1be3ce2-img1547.jpg', 0, 0, 133, 7, '2022-08-08 18:32:43', '2022-08-08 18:32:43', NULL),
	(183, '/upload/images/166000156362f19d1be927e-img1097.jpg', 0, 0, 133, 7, '2022-08-08 18:32:43', '2022-08-08 18:32:43', NULL),
	(184, '/upload/images/166000156362f19d1bea073-img1551.jpg', 0, 0, 133, 7, '2022-08-08 18:32:43', '2022-08-08 18:32:43', NULL),
	(185, '/upload/images/166000161762f19d5104f89-img43.jpg', 0, 0, 133, 7, '2022-08-08 18:33:37', '2022-08-08 18:33:37', NULL),
	(186, '/upload/images/166001279462f1c8fa6502b-pro360.jpg', 0, 0, 134, 7, '2022-08-08 21:39:54', '2022-08-08 21:39:54', NULL),
	(187, '/upload/images/166001359862f1cc1ebc742-img1565.jpg', 0, 0, 135, 7, '2022-08-08 21:53:18', '2022-08-08 21:53:18', NULL),
	(188, '/upload/images/166001709562f1d9c77f090-img67.jpg', 0, 0, 136, 7, '2022-08-08 22:51:35', '2022-08-08 22:51:35', NULL),
	(189, '/upload/images/166001712262f1d9e26c45d-img3.jpg', 0, 0, 137, 7, '2022-08-08 22:52:02', '2022-08-08 22:52:02', NULL),
	(190, '/upload/images/166001714762f1d9fb0e52d-img43.jpg', 0, 0, 138, 7, '2022-08-08 22:52:27', '2022-08-08 22:52:27', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_types: ~36 rows (aproximadamente)
INSERT INTO `contents_types` (`id`, `name`, `alias`, `settings`, `create`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Banner', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "textarea"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-25 10:23:39', '2021-10-13 20:09:15', NULL),
	(2, 'Caracteristica', 'caracterisitca', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "code-icono", \r\n        "type": "input"\r\n    }\r\n}', 1, 1, '2021-08-25 10:24:12', '2021-09-02 22:17:21', NULL),
	(3, 'Capacitados', 'capacitados', '{ \r\n    "name": {\r\n        "label": "Atributo", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Cantidad", \r\n        "type": "input"\r\n    }\r\n}', 1, 1, '2021-08-25 10:24:18', '2021-09-02 22:17:13', NULL),
	(4, 'Registros', 'registro', '{ \r\n    "name": {\r\n        "label": "Promoción", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Video Embebido", \r\n        "type": "input"\r\n    }, \r\n    "description": {\r\n        "label": "Descripción Video", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 1, '2021-08-30 17:21:23', '2021-09-02 22:17:32', NULL),
	(5, 'Socios', 'socios', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-30 17:57:55', '2021-09-02 22:18:42', NULL),
	(6, 'Galería', 'galeria', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-09-02 16:06:09', '2021-09-02 22:28:33', NULL),
	(7, 'Profecionales', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-25 10:23:39', '2021-09-02 22:14:15', NULL),
	(8, 'Beneficios', 'beneficio', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-08-30 17:57:55', '2021-09-02 22:18:50', NULL),
	(9, 'Banner', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "textarea"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-08-25 10:23:39', '2021-10-14 20:49:47', NULL),
	(10, 'Caracteristica', 'caracterisitca', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "code-icono", \r\n        "type": "input"\r\n    }\r\n}', 1, 2, '2021-08-25 10:24:12', '2021-10-14 20:49:49', NULL),
	(11, 'Capacitados', 'capacitados', '{ \r\n    "name": {\r\n        "label": "Atributo", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Cantidad", \r\n        "type": "input"\r\n    }\r\n}', 1, 2, '2021-08-25 10:24:18', '2021-10-14 20:49:51', NULL),
	(12, 'Registros', 'registro', '{ \r\n    "name": {\r\n        "label": "Promoción", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Video Embebido", \r\n        "type": "input"\r\n    }, \r\n    "description": {\r\n        "label": "Descripción Video", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 2, '2021-08-30 17:21:23', '2021-10-14 20:49:53', NULL),
	(13, 'Socios', 'socios', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-08-30 17:57:55', '2021-10-14 20:49:55', NULL),
	(14, 'Galería', 'galeria', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-09-02 16:06:09', '2021-10-14 20:49:57', NULL),
	(15, 'Profecionales', 'banner', '{ \r\n    "name": {\r\n        "label": "Título", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },  \r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-08-25 10:23:39', '2021-10-14 20:50:00', NULL),
	(16, 'Beneficios', 'beneficio', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-08-30 17:57:55', '2021-10-14 20:50:02', NULL),
	(17, 'Estudia', 'estudio', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-11-10 21:02:58', '2021-11-10 22:22:24', NULL),
	(18, 'Valores', 'valores', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-11-10 21:03:50', '2021-11-10 22:22:26', NULL),
	(19, 'Avance', 'avance', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Porcentage", \r\n        "type": "input"\r\n    }\r\n}', 1, 1, '2021-11-10 21:04:10', '2021-11-10 22:22:27', NULL),
	(20, 'Imagen', 'imagen', '{ \r\n   "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-11-10 21:04:23', '2021-11-10 22:22:30', NULL),
	(21, 'Item', 'item', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-11-10 21:04:51', '2021-11-10 22:22:32', NULL),
	(22, 'Cursos', 'item', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    }, \r\n    "caption": {\r\n        "label": "Url", \r\n        "type": "input"\r\n    }, \r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 1, '2021-11-10 21:05:42', '2021-11-10 22:22:33', NULL),
	(23, 'Beneficios', 'beneficio', '{ \r\n    "name": {\r\n        "label": "titulo 1", \r\n        "type": "input"\r\n    },\r\n     "caption": {\r\n        "label": "titulo 2", \r\n        "type": "textarea"\r\n    },\r\n   "description": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo2", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 5, '2021-08-30 17:57:55', '2022-04-27 09:38:51', NULL),
	(24, 'Servicios', 'servicios', '{ \r\n    "name": {\r\n        "label": "titulo 1", \r\n        "type": "input"\r\n    },\r\n   "caption": {\r\n        "label": "titulo 2", \r\n        "type": "textarea"\r\n    },\r\n   "description": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo2", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 5, '2022-04-27 11:09:41', '2022-05-04 19:50:21', NULL),
	(25, 'Casos', 'casos', '{ \r\n    "name": {\r\n        "label": "titulo 1", \r\n        "type": "input"\r\n    },\r\n    "caption": {\r\n        "label": "titulo 2", \r\n        "type": "textarea"\r\n    },\r\n    "description": {\r\n        "label": "Descripción", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo2", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 5, '2022-04-27 11:09:41', '2022-04-28 12:11:49', NULL),
	(26, 'Registro', 'registros', '{ \r\n    "name": {\r\n        "label": "titulo 1", \r\n        "type": "input"\r\n    }\r\n}', 1, 6, '2022-04-27 11:09:41', '2022-06-24 22:55:12', NULL),
	(27, 'Beneficios', 'beneficios', '{ \r\n    "name": {\r\n        "label": "description", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-24 22:55:09', NULL),
	(28, 'Recursos', 'recursos', '{ \r\n    "name": {\r\n        "label": "description", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    },\r\n    "url": {\r\n        "label": "Enlace", \r\n        "type": "input"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-28 21:35:41', NULL),
	(29, 'Banner', 'banners', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "textarea"\r\n    },\r\n    "caption": {\r\n        "label": "Enlace texto", \r\n        "type": "input"\r\n    },\r\n    "url": {\r\n        "label": "Enlace", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-28 21:35:13', NULL),
	(30, 'Articulos', 'articulos', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-25 00:14:06', NULL),
	(31, 'Noticias', 'notices', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-27 11:48:28', NULL),
	(32, 'Proximos Eventos', 'events', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-27 11:48:31', NULL),
	(34, 'Banner Podcast', 'podcast', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "caption": {\r\n        "label": "Subtitulo", \r\n        "type": "input"\r\n    },\r\n    "url": {\r\n        "label": "Enlace", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-28 22:30:00', NULL),
	(35, 'Episodio Podcast', 'episodios', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "caption": {\r\n        "label": "Subtitulo", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    },\r\n    "url": {\r\n        "label": "Enlace", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "array",\r\n        "plugin": "images"\r\n    },\r\n    "files": {\r\n        "label": "Archivo de audio", \r\n        "type": "input",\r\n        "plugin": "files",\r\n        "accept": ".mp3"\r\n    }\r\n}', 1, 6, '2022-06-24 22:35:56', '2022-06-28 22:19:47', NULL),
	(36, 'Carrusel', 'carrusel', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n     "files": {\r\n        "label": "Icono", \r\n        "type": "input",\r\n        "plugin": "files",\r\n        "accept": ".jpg"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    },\r\n    "url": {\r\n        "label": "Enlace", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Banners", \r\n        "type": "array",\r\n        "plugin": "images"\r\n    }    \r\n}', 1, 7, '2022-06-24 22:35:56', '2022-08-08 21:35:14', NULL),
	(37, 'Carrusel', 'carrusel-pro', '{ \r\n    "name": {\r\n        "label": "Titulo", \r\n        "type": "input"\r\n    },\r\n    "description": {\r\n        "label": "Descripcion", \r\n        "type": "textarea"\r\n    },\r\n    "images": {\r\n        "label": "Imagen", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }    \r\n}', 1, 7, '2022-06-24 22:35:56', '2022-08-08 21:39:31', NULL),
	(38, 'Promotores', 'promotor', '{ \r\n    "name": {\r\n        "label": "Nombre", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Colección de imágenes", \r\n        "type": "array",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 7, '2022-08-08 22:49:31', '2022-08-08 22:50:38', NULL);

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
INSERT INTO `designs_icons` (`id`, `name`, `icon`, `color`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'reloj', 'far fa-clock', '#1888c9', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(2, 'Folder', 'far fa-folder-open', '#000000', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(3, 'Usuario', 'far fa-user-circle', '#b49f5e', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(4, 'Video', 'fas fa-play', '#bfbfbd', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(5, 'Nivel', 'far fa-flag', '#d23f3f', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL),
	(6, 'Idioma', 'far fa-bell', '#33a9bb', 1, '2021-09-02 11:57:33', '2021-09-02 11:57:33', NULL);

-- Volcando estructura para tabla db_margarita.inscriptions
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.inscriptions: ~10 rows (aproximadamente)
INSERT INTO `inscriptions` (`id`, `product_id`, `email`, `name`, `phone`, `code`, `price`, `level`, `file`, `status`, `ip`, `comment`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'RD316319000786144D1AE3B3C2', 450.00, '2', '/upload/voucher/16319003406144d2b486baa-image (14).png', 'pagado', '127.0.0.1', 'Registro de mi pago', 1, '2021-09-17 12:34:38', '2021-10-06 10:50:38', NULL),
	(2, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'VRM16319004756144D33B1CA92', 450.00, '2', '/upload/voucher/16319004756144d33b1cbe5-image (14).png', 'rechazado', '127.0.0.1', 'zzz', 1, '2021-09-17 12:41:15', '2021-10-06 10:50:59', NULL),
	(3, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', '2VX1632265741614A660D49668', 450.00, '1', NULL, 'pendiente', '127.0.0.1', NULL, 1, '2021-09-21 18:09:01', '2021-09-21 18:09:01', NULL),
	(4, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'ZA3163409367461664A6A47083', 450.00, '1', '/upload/voucher/163409368761664a7799641-estudiamos.jpeg', 'enviado', '170.231.170.38', 'nuevo', 1, '2021-10-12 21:54:34', '2021-10-12 21:54:47', NULL),
	(5, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'YVJ16342631106168E046E9993', 450.00, '1', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-14 20:58:30', '2021-10-14 20:58:30', NULL),
	(6, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'ENZ16343244606169CFECD739D', 450.00, '2', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-15 14:01:00', '2021-10-15 14:01:00', NULL),
	(7, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'Z2K163476814661709512BA33C', 450.00, '1', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-20 17:15:46', '2021-10-20 17:15:46', NULL),
	(8, 7, 'master@platform.com', 'Propuesta remota', '', 'FGA163709617961941AF300CD2', 880.00, '2', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-11-16 15:56:19', '2021-11-16 15:56:19', NULL),
	(9, 13, 'infante-rj@hotmail.com', 'maria', '923520204', 'S0V163917074261B3C2B63670B', 200.00, '1', NULL, 'pagado', '179.6.197.106', NULL, 1, '2021-12-10 16:12:22', '2022-02-03 11:27:35', NULL),
	(10, 1, 'azegarra@softdynamic.org', 'Victor Alexander Zegarr Gotia', '943777031', 'BBB16494311986250529E77ECE', 880.00, '1', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2022-04-08 10:19:58', '2022-04-08 10:19:58', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.menus: ~32 rows (aproximadamente)
INSERT INTO `menus` (`id`, `name`, `image`, `order`, `slug`, `url`, `parent_id`, `company_id`, `template_view_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Nosotros', '/assets/template/stetic/images/banner-2.png', 1, 'nosotros', '', 0, 1, 1, '2021-08-10 22:33:03', '2021-09-05 01:19:53', NULL),
	(2, 'Especializaciones', '/upload/menu/1636752109618edaedefb78-252682661_4368356176618789_6195791037580537737_n.jpg', 2, 'especializaciones', '', 0, 1, 2, '2021-08-10 22:33:32', '2021-11-12 16:21:49', NULL),
	(3, 'Cursos complementarios', '/upload/menu/1636752123618edafbd4062-240644623_4146602885460787_2058686922126905670_n.jpg', 3, 'cursos-complementarios', '', 0, 1, 2, '2021-08-10 22:33:50', '2021-11-12 17:17:21', NULL),
	(4, 'Diplomados', '/upload/menu/1636752145618edb11de182-banner 2.jpg', 4, 'diplomados', '', 0, 1, 2, '2021-08-10 22:39:08', '2021-11-12 16:22:25', NULL),
	(5, 'DIAGNOSTICO VECTORIZADO', '/upload/menu/1636749658618ed15ad08b4-facial vectorizado.jpeg', 3, 'diagnostico-vectorizado', '', 2, 1, 2, '2021-08-10 22:39:26', '2021-11-12 16:01:06', '2021-11-12 16:01:06'),
	(6, 'Estética facial', '/upload/menu/1636749774618ed1ce4a4d9-facial vectorizado.jpeg', 3, 'estetica-facial', '', 2, 1, 2, '2021-08-10 22:39:48', '2021-11-12 21:00:55', NULL),
	(7, 'Contáctanos', '/upload/menu/1634095545616651b90d76d-20210810_1657143.jpg', 8, 'contactanos', '', 0, 1, 4, '2021-08-10 22:40:29', '2021-10-12 22:25:45', NULL),
	(9, 'Galería', '/upload/menu/1637192291619592639c0d5-whatsapp image 2021-10-15 at 14.03.30 (4).jpeg', 7, 'galeria', '', 0, 1, 3, '2021-08-30 18:43:15', '2021-11-17 18:38:11', NULL),
	(10, 'Inicio', NULL, 1, 'inicio', '', 0, 2, 1, '2021-10-14 15:30:58', '2021-10-14 15:30:58', NULL),
	(11, 'Diplomas', NULL, 2, 'diplomas', '', 0, 2, 2, '2021-10-14 15:31:41', '2021-10-14 15:31:41', NULL),
	(12, 'Contactanos', NULL, 4, 'contactanos', '', 0, 2, 4, '2021-10-14 15:32:43', '2021-10-14 15:32:43', NULL),
	(13, 'cursos', NULL, 3, 'cursos', '', 0, 2, 2, '2021-10-14 15:33:07', '2021-10-14 15:33:07', NULL),
	(14, 'Estética corporal', NULL, 3, 'estetica-corporal', '', 2, 1, 2, '2021-11-12 15:44:46', '2021-11-12 15:50:28', NULL),
	(15, 'Inicio', NULL, 1, 'inicio', '', 0, 3, 9, '2021-12-12 12:11:24', '2021-12-12 12:11:24', NULL),
	(16, 'Nosotros', NULL, 2, 'nosotros', '', 0, 3, 10, '2021-12-12 12:11:40', '2021-12-12 12:11:40', NULL),
	(17, 'Áreas', NULL, 3, 'areas', '', 0, 3, 11, '2021-12-12 12:12:02', '2021-12-12 12:12:02', NULL),
	(18, 'Equipo', NULL, 4, 'equipo', '', 0, 3, 12, '2021-12-12 12:12:24', '2021-12-12 12:12:34', NULL),
	(19, 'Clientes', NULL, 5, 'clientes', '', 0, 3, 15, '2021-12-12 12:12:50', '2021-12-12 12:12:50', NULL),
	(20, 'Contacto', NULL, 6, 'contacto', '', 0, 3, 17, '2021-12-12 12:13:10', '2021-12-12 12:13:10', NULL),
	(21, 'Inicio', NULL, 1, 'inicio', '', 0, 5, 19, '2022-04-20 11:59:06', '2022-04-20 11:59:06', NULL),
	(22, 'Servicios', NULL, 2, 'servicios', '', 0, 5, 20, '2022-04-20 12:38:03', '2022-04-20 15:41:35', NULL),
	(23, 'Nosotros', NULL, 3, 'nosotros', '', 0, 5, 21, '2022-04-20 12:38:35', '2022-04-20 15:41:44', NULL),
	(24, 'Portafolio', NULL, 4, 'portafolio', '', 0, 5, 22, '2022-04-20 12:39:21', '2022-04-20 15:41:52', NULL),
	(25, 'Blog', NULL, 5, 'blog', '', 0, 5, 24, '2022-04-20 12:39:37', '2022-04-20 15:41:58', NULL),
	(26, 'Home', NULL, 1, 'home', '', 0, 6, 25, '2022-06-24 19:00:17', '2022-06-24 19:00:17', NULL),
	(27, 'Capacitaciones', NULL, 2, 'capacitaciones', 'https://fri.com.pe/esan-capacitaciones', 0, 6, 2, '2022-06-24 19:40:28', '2022-06-24 19:40:28', NULL),
	(28, 'Publicaciones', NULL, 3, 'publicaciones', 'https://fri.com.pe/esan-publicaciones', 0, 6, 2, '2022-06-24 19:46:52', '2022-06-24 19:46:52', NULL),
	(29, 'Podcast', NULL, 4, 'podcast', '', 0, 6, 25, '2022-06-24 19:49:08', '2022-06-28 16:58:12', NULL),
	(30, 'Inicio', NULL, 1, 'inicio', '', 0, 7, 26, '2022-08-01 19:03:20', '2022-08-08 11:08:02', '2022-08-08 11:08:02'),
	(31, 'Conócenos', NULL, 2, 'conocenos', '', 0, 7, 26, '2022-08-01 20:23:17', '2022-08-01 20:23:17', NULL),
	(32, 'Espacio Pro360', NULL, 3, 'espacio-pro360', '', 0, 7, 27, '2022-08-01 20:23:35', '2022-08-08 10:12:35', NULL),
	(33, 'Contáctanos', NULL, 4, 'contactanos', '', 0, 7, 28, '2022-08-01 20:23:56', '2022-08-08 10:12:44', NULL),
	(34, 'Podcast', NULL, 5, 'podcast', '', 0, 7, 29, '2022-08-01 20:24:08', '2022-08-08 10:12:51', NULL);

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

-- Volcando datos para la tabla db_margarita.menus_products: ~15 rows (aproximadamente)
INSERT INTO `menus_products` (`menu_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 8, '2021-11-12 22:14:11', '2021-11-12 22:14:11', NULL),
	(3, 9, '2021-11-12 22:18:58', '2021-11-12 22:18:58', NULL),
	(3, 10, '2021-11-12 22:21:12', '2021-11-12 22:21:12', NULL),
	(3, 11, '2021-11-12 22:24:31', '2021-11-12 22:24:31', NULL),
	(4, 12, '2021-11-12 22:27:58', '2021-11-12 22:27:58', NULL),
	(4, 13, '2021-11-12 22:29:10', '2021-11-12 22:29:10', NULL),
	(4, 14, '2021-11-12 22:30:19', '2021-11-12 22:30:19', NULL),
	(6, 1, '2021-11-12 21:57:15', '2021-11-12 21:57:15', NULL),
	(6, 2, '2021-11-12 22:00:55', '2021-11-12 22:00:55', NULL),
	(6, 3, '2021-11-12 22:02:42', '2021-11-12 22:02:42', NULL),
	(6, 4, '2021-11-12 22:03:56', '2021-11-12 22:03:56', NULL),
	(6, 5, '2021-11-12 22:06:04', '2021-11-12 22:06:04', NULL),
	(14, 6, '2021-11-12 22:09:24', '2021-11-12 22:09:24', NULL),
	(14, 7, '2021-11-12 22:11:25', '2021-11-12 22:11:25', NULL),
	(24, 15, '2022-05-19 15:51:44', '2022-05-19 15:51:44', NULL);

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

-- Volcando datos para la tabla db_margarita.menus_sections: ~44 rows (aproximadamente)
INSERT INTO `menus_sections` (`menu_id`, `section_id`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 0, '2021-09-17 15:44:41', '2021-09-17 15:44:41', NULL),
	(1, 2, 0, '2021-08-11 18:55:22', '2021-08-11 18:55:22', NULL),
	(1, 3, 0, '2021-11-12 13:58:40', '2021-11-12 13:58:40', NULL),
	(1, 4, 0, '2021-11-12 13:54:08', '2021-11-12 13:54:08', NULL),
	(1, 5, 0, '2021-09-19 11:12:08', '2021-09-19 11:12:08', NULL),
	(1, 6, 0, '2021-11-12 13:58:54', '2021-11-12 13:58:54', NULL),
	(1, 7, 0, '2021-09-19 11:13:47', '2021-09-19 11:13:47', NULL),
	(1, 8, 0, '2021-09-19 11:14:35', '2021-09-19 11:14:35', NULL),
	(1, 11, 0, '2021-11-10 22:22:58', '2021-11-10 22:22:58', NULL),
	(1, 12, 0, '2021-11-10 22:26:29', '2021-11-10 22:26:29', NULL),
	(1, 13, 0, '2021-11-10 22:37:02', '2021-11-10 22:37:02', NULL),
	(1, 14, 0, '2021-11-10 22:39:42', '2021-11-10 22:39:42', NULL),
	(1, 15, 0, '2021-11-10 22:41:37', '2021-11-10 22:41:37', NULL),
	(9, 9, 0, '2021-09-19 11:14:51', '2021-09-19 11:14:51', NULL),
	(10, 10, 0, '2021-10-14 20:50:34', '2021-10-14 20:50:34', NULL),
	(21, 16, 0, '2022-04-28 23:10:46', '2022-04-28 23:10:46', NULL),
	(21, 17, 0, '2022-04-28 23:11:27', '2022-04-28 23:11:27', NULL),
	(21, 18, 0, '2022-04-28 23:22:34', '2022-04-28 23:22:34', NULL),
	(21, 19, 0, '2022-05-06 21:53:11', '2022-05-06 21:53:11', NULL),
	(21, 20, 0, '2022-04-28 23:11:48', '2022-04-28 23:11:48', NULL),
	(21, 21, 0, '2022-04-28 23:12:16', '2022-04-28 23:12:16', NULL),
	(22, 22, 0, '2022-05-04 20:01:17', '2022-05-04 20:01:17', NULL),
	(22, 23, 0, '2022-05-04 22:00:45', '2022-05-04 22:00:45', NULL),
	(22, 24, 0, '2022-05-09 15:00:40', '2022-05-09 15:00:40', NULL),
	(23, 24, 0, '2022-05-09 15:00:40', '2022-05-09 15:00:40', NULL),
	(23, 25, 0, '2022-05-09 15:02:20', '2022-05-09 15:02:20', NULL),
	(24, 26, 0, '2022-05-09 15:09:15', '2022-05-09 15:09:15', NULL),
	(24, 27, 0, '2022-05-09 15:11:17', '2022-05-09 15:11:17', NULL),
	(26, 28, 5, '2022-06-28 21:58:30', '2022-06-28 21:58:52', NULL),
	(26, 29, 4, '2022-06-24 22:37:03', '2022-06-27 11:51:36', NULL),
	(26, 30, 3, '2022-06-24 22:55:38', '2022-06-27 11:51:34', NULL),
	(26, 31, 0, '2022-06-25 00:16:16', '2022-06-25 00:16:16', NULL),
	(26, 32, 0, '2022-06-25 00:16:33', '2022-06-25 00:16:33', NULL),
	(26, 33, 1, '2022-06-27 11:49:24', '2022-06-27 11:51:28', NULL),
	(26, 34, 2, '2022-06-27 11:49:48', '2022-06-27 11:51:30', NULL),
	(29, 28, 3, '2022-06-28 21:58:30', '2022-06-28 21:58:41', NULL),
	(29, 35, 1, '2022-06-27 21:42:37', '2022-06-28 01:28:20', NULL),
	(29, 36, 2, '2022-06-27 22:19:19', '2022-06-28 01:28:21', NULL),
	(31, 37, 0, '2022-08-08 11:47:02', '2022-08-08 11:47:02', NULL),
	(31, 38, 0, '2022-08-08 21:38:08', '2022-08-08 21:38:08', NULL),
	(31, 39, 0, '2022-08-08 22:50:56', '2022-08-08 22:50:56', NULL),
	(32, 39, 0, '2022-08-08 22:50:56', '2022-08-08 22:50:56', NULL),
	(33, 39, 0, '2022-08-08 22:50:56', '2022-08-08 22:50:56', NULL),
	(34, 39, 0, '2022-08-08 22:50:56', '2022-08-08 22:50:56', NULL);

-- Volcando estructura para tabla db_margarita.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_messages_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_messages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.messages: ~10 rows (aproximadamente)
INSERT INTO `messages` (`id`, `name`, `email`, `phone`, `description`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, NULL, '943777031', NULL, 1, 1, '2021-09-21 21:08:23', '2021-09-21 21:08:23', NULL),
	(3, NULL, NULL, '943777032', NULL, 1, 1, '2021-09-21 21:32:13', '2021-09-21 21:32:13', NULL),
	(4, NULL, NULL, '94377703', NULL, 1, 1, '2021-09-21 21:32:39', '2021-09-21 21:32:39', NULL),
	(5, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', '943777031', '22 mensaje de prueba\r\nssss', 2, 1, '2021-09-21 21:39:05', '2021-09-21 21:39:05', NULL),
	(6, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', NULL, NULL, 2, 1, '2021-10-13 18:57:16', '2021-10-13 18:57:16', NULL),
	(7, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', NULL, NULL, 2, 1, '2021-10-13 19:08:39', '2021-10-13 19:08:39', NULL),
	(8, 'Angelica ', 'angieguerra2110@hotmail.com ', '901864538 ', 'Deseo información sobre los cursos. ', 2, 1, '2022-03-10 03:11:56', '2022-03-10 03:11:56', NULL),
	(9, 'Yasmin ', 'Yasmincalderon2055@gmail.com ', NULL, NULL, 2, 1, '2022-03-22 20:34:53', '2022-03-22 20:34:53', NULL),
	(10, 'Yesenia', 'yesenia.luyo@hotmail.com', NULL, NULL, 2, 1, '2022-05-09 22:21:09', '2022-05-09 22:21:09', NULL),
	(11, NULL, NULL, '956825368', NULL, 1, 1, '2022-05-09 22:21:36', '2022-05-09 22:21:36', NULL),
	(12, NULL, 'azegarra@softdynamic.org', NULL, NULL, 2, 7, '2022-08-08 22:39:02', '2022-08-08 22:39:02', NULL),
	(13, NULL, 'alexanderzegarragotia@gmail.com', NULL, NULL, 2, 7, '2022-08-08 22:41:40', '2022-08-08 22:41:40', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.products: ~15 rows (aproximadamente)
INSERT INTO `products` (`id`, `name`, `caption`, `description`, `slug`, `overview`, `image`, `video`, `url`, `price`, `status`, `category_id`, `teacher_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'DIAGNOSTICO VECTORIZADO', NULL, NULL, 'diagnostico-vectorizado', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus</span><br></p>', '/upload/images/1636754235618ee33b45621-facial vectorizado.jpeg', NULL, 'https://www.youtube.com/embed/nEFls3HMNOw', 880.00, 1, 2, 1, 1, 1, '2021-09-05 01:20:28', '2022-06-10 15:23:06', NULL),
	(2, 'AFECCIONES CUTÁNEAS', NULL, NULL, 'afecciones-cutaneas', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', '/upload/images/1636754410618ee3eaab2e6-afecciones cutaneas.jpeg', NULL, '', 880.00, 1, 3, 1, 1, 1, '2021-09-05 01:27:09', '2022-06-10 15:23:12', NULL),
	(3, 'ELECTROESTETICA FACIAL', NULL, NULL, 'electroestetica-facial', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', '/upload/images/1636754562618ee48269762-electroestetica facial.jpeg', NULL, '', 880.00, 1, 4, 1, 1, 1, '2021-09-05 01:28:07', '2022-06-10 15:23:15', NULL),
	(4, 'PEELING QUIMICO', NULL, NULL, 'peeling-quimico', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', '/upload/images/1636754636618ee4cc377cb-peeling quimico.jpeg', NULL, '', 880.00, 1, 1, 1, 1, 1, '2021-09-05 01:30:00', '2022-06-10 15:23:18', NULL),
	(5, 'PEELING DE VERANO SINERGIAS', NULL, NULL, 'peeling-de-verano-sinergias', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636754764618ee54c0a953-peeling de verano.jpeg', NULL, '', 660.00, 1, 3, 1, 1, 1, '2021-11-12 17:06:04', '2022-06-10 15:23:24', NULL),
	(6, 'INESTETICISMOS CORPORALES', NULL, NULL, 'inesteticismos-corporales', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636754964618ee614ae62d-inesticismos corporales.jpeg', NULL, '', 880.00, 1, 4, 1, 1, 1, '2021-11-12 17:09:24', '2022-06-10 15:23:28', NULL),
	(7, 'ELECTROESTETICA CORPORAL', NULL, NULL, 'electroestetica-corporal', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636755085618ee68de9072-electroestetica corporal.jpeg', NULL, '', 880.00, 1, 1, 1, 1, 1, '2021-11-12 17:11:25', '2022-06-10 15:23:33', NULL),
	(8, 'NUTRIESTETICA', NULL, NULL, 'nutriestetica', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636755251618ee733338fe-nutriestetica.jpeg', NULL, '', 540.00, 1, 2, 1, 1, 1, '2021-11-12 17:14:11', '2022-06-10 15:23:37', NULL),
	(9, 'QUÍMICA COSMÉTICA', NULL, NULL, 'quimica-cosmetica', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636755538618ee8526c890-quimica cosmética.jpeg', NULL, '', 540.00, 1, 3, 1, 1, 1, '2021-11-12 17:18:58', '2022-06-10 15:23:41', NULL),
	(10, 'TÉCNICAS DEPILATORIAS', NULL, NULL, 'tecnicas-depilatorias', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636755672618ee8d89e07d-tecnicas depilatorias.jpeg', NULL, '', 660.00, 1, 4, 1, 1, 1, '2021-11-12 17:21:12', '2022-06-10 15:23:44', NULL),
	(11, 'MADEROTERAPIA', NULL, NULL, 'maderoterapia', '<p><span style="color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636755744618ee920c2798-maderoterapia.jpeg', NULL, '', 660.00, 1, 3, 1, 1, 1, '2021-11-12 17:22:24', '2022-06-10 15:23:49', NULL),
	(12, 'ELECTROESTETICA ANTIAGE', NULL, NULL, 'electroestetica-antiage', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636756078618eea6ee6527-electroestetica.jpeg', NULL, '', 200.00, 1, 4, 1, 1, 1, '2021-11-12 17:27:58', '2022-06-10 15:23:52', NULL),
	(13, 'LASER ESTETICO', NULL, NULL, 'laser-estetico', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636756150618eeab6aa92f-laser estetico.jpeg', NULL, '', 200.00, 1, 2, 1, 1, 1, '2021-11-12 17:29:10', '2022-06-10 15:23:57', NULL),
	(14, 'ACTIVOS FARMACO ESTETICOS', NULL, NULL, 'activos-farmaco-esteticos', '<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use L</span><br></p>', '/upload/images/1636756219618eeafb0e189-activos farmaco esteticos.jpeg', NULL, '', 200.00, 1, 1, 1, 1, 1, '2021-11-12 17:30:19', '2022-06-10 15:24:02', NULL),
	(15, 'producto 1', NULL, NULL, 'producto-1', '<p>wwewe wewewewwewe wewewewwewe wewewewwewe wewewewwewe wewewewwewe wewewewwewe wewewewwewe wewewewwewe wewewe<br></p>', NULL, NULL, '', 20.00, 1, 5, 3, 1, 5, '2022-05-19 10:51:44', '2022-05-19 10:51:44', NULL);

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
INSERT INTO `profiles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Master', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL),
	(2, 'Administrador', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL),
	(3, 'Cliente', '2021-07-16 21:53:16', '2021-07-16 21:53:16', NULL);

-- Volcando estructura para tabla db_margarita.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `external` int(1) DEFAULT 1,
  `url_api` varchar(255) DEFAULT NULL,
  `body_api` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sections_company_id_foreign` (`company_id`) USING BTREE,
  CONSTRAINT `fk_sections_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.sections: ~39 rows (aproximadamente)
INSERT INTO `sections` (`id`, `name`, `description`, `caption`, `color`, `alias`, `status`, `external`, `url_api`, `body_api`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Slide principal', '', 'Slide', NULL, 'slide', 1, 1, NULL, NULL, NULL, 1, '2021-08-11 18:55:09', '2021-09-17 15:44:14', NULL),
	(2, 'Slide principal', '', 'Slide', '', NULL, 1, 1, NULL, NULL, NULL, 1, '2021-08-11 18:55:22', '2021-08-11 18:55:36', '2021-08-11 18:55:36'),
	(3, 'Bienvenido', '', '', NULL, 'bienvenido', 1, 1, NULL, NULL, NULL, 1, '2021-08-11 18:56:12', '2021-11-12 08:58:40', NULL),
	(4, 'Video corporativo', '', '', NULL, 'videocorp', 1, 1, NULL, NULL, NULL, 1, '2021-08-30 13:08:52', '2021-08-30 13:18:16', NULL),
	(5, 'Registro', '', '', NULL, 'registro', 1, 1, NULL, NULL, NULL, 1, '2021-08-30 17:13:54', '2021-08-30 17:49:20', NULL),
	(6, 'Beneficio', '', '', NULL, 'beneficio', 0, 1, NULL, NULL, NULL, 1, '2021-08-30 17:55:31', '2021-11-12 08:58:54', NULL),
	(7, 'Socios', '', '', NULL, 'socios', 1, 1, NULL, NULL, NULL, 1, '2021-08-30 18:16:00', '2021-08-30 18:24:17', NULL),
	(8, 'Profecionales', '', '', NULL, 'profecionales', 1, 1, NULL, NULL, NULL, 1, '2021-08-30 18:33:45', '2021-08-30 18:40:26', NULL),
	(9, 'Galería', '', 'Slide', NULL, 'galeria', 1, 1, NULL, NULL, NULL, 1, '2021-09-02 12:49:58', '2021-10-12 21:53:33', '2021-10-12 21:53:33'),
	(10, 'Slider principal', '', '', NULL, 'slide', 1, 1, NULL, NULL, NULL, 2, '2021-10-14 15:50:34', '2021-10-14 21:22:20', NULL),
	(11, 'Estudia la belleza', '', '', NULL, 'estudia', 1, 1, NULL, NULL, NULL, 1, '2021-11-10 17:22:58', '2021-11-10 22:25:34', NULL),
	(12, 'Nuestros Valores', '', '', NULL, 'valores', 1, 1, NULL, NULL, NULL, 1, '2021-11-10 17:26:29', '2021-11-10 22:28:15', NULL),
	(13, 'Metodología', 'Rompe con el esquema robotizado de la estética convencional, creyendo en la libertad de creación y diseño de tratamientos estéticos integrales basándonos en el CONOCIMIENTO DE LA CIENCIA, QUE LLEVARA AL PROFESIONAL A', 'CCAS, ML STETIC', NULL, 'metodologia', 1, 1, NULL, NULL, NULL, 1, '2021-11-10 17:37:02', '2021-11-10 22:38:55', NULL),
	(14, 'Certificación\r\n& Propuesta Remota', '', '', NULL, 'certificado', 1, 1, NULL, NULL, NULL, 1, '2021-11-10 17:39:42', '2021-11-10 22:40:50', NULL),
	(15, '¡Descubre!', '', '', NULL, 'cursos', 1, 1, NULL, NULL, NULL, 1, '2021-11-10 17:41:37', '2021-11-10 22:42:41', NULL),
	(16, 'banner\r\n\r\n', 'banner 1', 'banner', NULL, 'banner', 1, 1, NULL, NULL, NULL, 5, '2022-04-20 18:07:42', '2022-04-27 14:57:45', NULL),
	(17, 'banner 2', 'banner 2', 'banner 2', NULL, 'banner B', 0, 1, NULL, NULL, NULL, 5, '2022-04-20 18:08:38', '2022-04-26 17:21:16', NULL),
	(18, 'Cards', '', 'cards', NULL, 'cards', 1, 1, NULL, NULL, NULL, 5, '2022-04-27 11:07:05', '2022-04-28 18:16:28', NULL),
	(19, 'Nuestros Proyectos', '', '', NULL, 'casos', 1, 1, NULL, NULL, NULL, 5, '2022-04-27 15:09:27', '2022-05-06 16:53:11', NULL),
	(20, 'Nuestros Clientes\r\n', '', 'clientes', NULL, 'clientes', 1, 1, NULL, NULL, NULL, 5, '2022-04-27 16:54:13', '2022-04-28 10:31:23', NULL),
	(21, 'Opiniones de nuestros clientes', '', 'opiniones', NULL, 'opiniones', 1, 1, NULL, NULL, NULL, 5, '2022-04-28 11:07:05', '2022-04-28 11:22:50', NULL),
	(22, 'banner Servicio\r\n', 'Servicios', 'banner servicio', NULL, 'banner_servicio', 1, 1, NULL, NULL, NULL, 5, '2022-05-03 11:21:50', '2022-05-03 15:23:14', NULL),
	(23, 'Ofrecemos', '', 'servicio 1', NULL, 'panel_pestana_servicio', 1, 1, NULL, NULL, NULL, 5, '2022-05-04 10:24:30', '2022-05-04 17:00:45', NULL),
	(24, 'Nuestro Equipo', '', 'Somos un equipo comprometido que aporta calidad y transformación a las organizaciones', NULL, 'cards_personal_nosotros', 1, 1, NULL, NULL, NULL, 5, '2022-05-04 12:14:00', '2022-05-09 14:58:39', NULL),
	(25, 'Nosotros', '', '', NULL, 'banner_personal_nosotros', 1, 1, NULL, NULL, NULL, 5, '2022-05-09 10:02:20', '2022-05-09 15:06:24', NULL),
	(26, 'Proyectos Realizados', '', 'Proyectos Realizados', NULL, 'banner_proyectos_realizados', 1, 1, NULL, NULL, NULL, 5, '2022-05-09 10:09:15', '2022-05-09 15:10:34', NULL),
	(27, 'lista proyectos', '', 'lista proyectos', NULL, 'cards_proyectos_portafolio', 1, 1, NULL, NULL, NULL, 5, '2022-05-09 10:11:17', '2022-05-09 15:12:39', NULL),
	(28, '¡Sé parte de la comunidad!', '', '', NULL, 'registros', 1, 0, NULL, NULL, NULL, 6, '2022-06-24 19:56:49', '2022-06-24 22:46:26', NULL),
	(29, 'BENEFICIOS', '', '', NULL, 'beneficios', 1, 0, NULL, NULL, NULL, 6, '2022-06-24 22:37:03', '2022-06-24 22:46:24', NULL),
	(30, 'RECURSOS DISPONIBLES', '', '', NULL, 'recursos', 1, 0, NULL, NULL, NULL, 6, '2022-06-24 22:55:38', '2022-06-24 22:56:38', NULL),
	(31, 'Banner', '', '', NULL, 'banners', 1, 0, NULL, NULL, NULL, 6, '2022-06-25 00:16:16', '2022-06-25 00:24:28', NULL),
	(32, 'Articulos', '', '', NULL, 'articulos', 1, 0, NULL, NULL, NULL, 6, '2022-06-25 00:16:33', '2022-06-25 00:24:32', NULL),
	(33, 'NOTICIAS RECIENTES', '', '', NULL, 'noticias', 1, 1, 'https://api-muralis.fri.com.pe/api/v1/notice/listnewsbygroup', '{\r\n "groupId": "6185a7f0136726413d648362",\r\n "cant": "6"           \r\n}', NULL, 6, '2022-06-27 11:49:24', '2022-06-30 14:20:38', NULL),
	(34, 'PRÓXIMOS EVENTOS', '', '', NULL, 'eventos', 1, 1, 'https://fri.com.pe/esan-capacitaciones/empresa/products/events', NULL, NULL, 6, '2022-06-27 11:49:48', '2022-06-30 14:20:26', NULL),
	(35, 'Podcast', '', '', NULL, 'podcast', 1, 0, NULL, NULL, NULL, 6, '2022-06-27 21:42:37', '2022-06-27 22:15:57', NULL),
	(36, 'Episodios', '', '', NULL, 'episodios', 1, 0, NULL, NULL, NULL, 6, '2022-06-27 22:19:19', '2022-06-27 22:19:27', NULL),
	(37, 'Productos', '', '', NULL, 'plataformas', 1, 1, NULL, NULL, NULL, 7, '2022-08-08 11:47:02', '2022-08-08 12:16:20', NULL),
	(38, 'Pro 360', '', '', NULL, 'pro360', 1, 1, NULL, NULL, NULL, 7, '2022-08-08 21:34:43', '2022-08-08 21:40:35', NULL),
	(39, 'Promotores', '', '', NULL, 'promotores', 1, 1, NULL, NULL, NULL, 7, '2022-08-08 22:48:18', '2022-08-08 22:57:09', NULL);

-- Volcando estructura para tabla db_margarita.sections_contents_types
CREATE TABLE IF NOT EXISTS `sections_contents_types` (
  `section_id` bigint(20) unsigned NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`,`type_id`) USING BTREE,
  KEY `idx_sections_contents_types_section_id_foreign` (`section_id`) USING BTREE,
  KEY `fk_sections_contents_types_type_id_foreign` (`type_id`),
  CONSTRAINT `fk_sections_contents_types_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sections_contents_types_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `contents_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.sections_contents_types: ~39 rows (aproximadamente)
INSERT INTO `sections_contents_types` (`section_id`, `type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '2021-09-17 15:44:41', '2021-09-17 15:44:41', NULL),
	(3, 1, '2021-11-12 13:58:40', '2021-11-12 13:58:40', NULL),
	(3, 2, '2021-11-12 13:58:40', '2021-11-12 13:58:40', NULL),
	(3, 3, '2021-11-12 13:58:40', '2021-11-12 13:58:40', NULL),
	(4, 1, '2021-11-12 13:54:08', '2021-11-12 13:54:08', NULL),
	(5, 4, '2021-09-19 11:12:08', '2021-09-19 11:12:08', NULL),
	(6, 1, '2021-11-12 13:58:54', '2021-11-12 13:58:54', NULL),
	(6, 2, '2021-11-12 13:58:54', '2021-11-12 13:58:54', NULL),
	(7, 5, '2021-09-19 11:13:47', '2021-09-19 11:13:47', NULL),
	(8, 7, '2021-09-19 11:14:35', '2021-09-19 11:14:35', NULL),
	(9, 6, '2021-09-19 11:14:51', '2021-09-19 11:14:51', NULL),
	(10, 9, '2021-10-14 20:50:34', '2021-10-14 20:50:34', NULL),
	(11, 17, '2021-11-10 22:22:58', '2021-11-10 22:22:58', NULL),
	(12, 18, '2021-11-10 22:26:29', '2021-11-10 22:26:29', NULL),
	(13, 19, '2021-11-10 22:37:02', '2021-11-10 22:37:02', NULL),
	(13, 20, '2021-11-10 22:37:02', '2021-11-10 22:37:02', NULL),
	(14, 21, '2021-11-10 22:39:42', '2021-11-10 22:39:42', NULL),
	(15, 22, '2021-11-10 22:41:37', '2021-11-10 22:41:37', NULL),
	(16, 23, '2022-04-28 23:10:46', '2022-04-28 23:10:46', NULL),
	(17, 23, '2022-04-28 23:11:27', '2022-04-28 23:11:27', NULL),
	(18, 24, '2022-04-28 23:22:34', '2022-04-28 23:22:34', NULL),
	(19, 25, '2022-05-06 21:53:11', '2022-05-06 21:53:11', NULL),
	(20, 25, '2022-04-28 23:11:48', '2022-04-28 23:11:48', NULL),
	(21, 25, '2022-04-28 23:12:16', '2022-04-28 23:12:16', NULL),
	(22, 24, '2022-05-04 20:01:17', '2022-05-04 20:01:17', NULL),
	(23, 24, '2022-05-04 22:00:45', '2022-05-04 22:00:45', NULL),
	(24, 24, '2022-05-09 15:00:40', '2022-05-09 15:00:40', NULL),
	(25, 24, '2022-05-09 15:02:20', '2022-05-09 15:02:20', NULL),
	(26, 24, '2022-05-09 15:09:15', '2022-05-09 15:09:15', NULL),
	(27, 24, '2022-05-09 15:11:17', '2022-05-09 15:11:17', NULL),
	(28, 26, '2022-06-28 21:58:30', '2022-06-28 21:58:30', NULL),
	(29, 27, '2022-06-24 22:37:03', '2022-06-24 22:37:03', NULL),
	(30, 28, '2022-06-24 22:55:38', '2022-06-24 22:55:38', NULL),
	(31, 29, '2022-06-25 00:16:16', '2022-06-25 00:16:16', NULL),
	(32, 30, '2022-06-25 00:16:33', '2022-06-25 00:16:33', NULL),
	(33, 31, '2022-06-27 11:49:24', '2022-06-27 11:49:24', NULL),
	(34, 32, '2022-06-27 11:49:48', '2022-06-27 11:49:48', NULL),
	(35, 34, '2022-06-27 21:42:37', '2022-06-27 21:42:37', NULL),
	(36, 35, '2022-06-27 22:19:19', '2022-06-27 22:19:19', NULL),
	(37, 36, '2022-08-08 11:47:02', '2022-08-08 11:47:02', NULL),
	(38, 37, '2022-08-08 21:38:08', '2022-08-08 21:38:08', NULL),
	(39, 38, '2022-08-08 22:50:56', '2022-08-08 22:50:56', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.subtopics: ~0 rows (aproximadamente)
INSERT INTO `subtopics` (`id`, `name`, `description`, `url`, `order`, `design_icon_id`, `topic_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Tema 1', 'tema 1', NULL, 1, 2, 1, '2021-09-20 18:01:29', '2021-09-20 18:01:29', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.teachers: ~3 rows (aproximadamente)
INSERT INTO `teachers` (`id`, `name`, `lastname`, `email`, `image`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'María', 'Moya', NULL, '/upload/teacher/16306025706131054a598a1-estudiante-1.jpg', 1, '2021-09-02 12:09:30', '2021-09-02 12:09:30', NULL),
	(2, 'Raul', 'Infante', NULL, '/upload/teacher/16306025886131055c2de50-estudiante-7.jpg', 1, '2021-09-02 12:09:48', '2022-02-03 11:56:22', NULL),
	(3, 'docente 1', 'docente 1', NULL, NULL, 5, '2022-05-19 10:50:27', '2022-05-19 10:50:27', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates: ~6 rows (aproximadamente)
INSERT INTO `templates` (`id`, `nombre`, `codigo`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Tema belleza', 'stetic', 'plantilla con tienda de cursos', '2021-08-10 15:46:15', '2021-08-10 15:46:40', NULL),
	(2, 'Tema abogados', 'legal', 'Platilla de web de estudio legal', '2021-12-12 16:48:38', '2021-12-12 16:48:38', NULL),
	(3, 'General Empresa', 'general', 'Plantilla para empresas', '2022-03-11 13:08:22', '2022-03-11 13:08:22', NULL),
	(4, 'Servicios', 'apzo', 'plantilla de servicios', '2021-08-10 15:46:15', '2021-11-15 10:55:20', NULL),
	(5, 'Comunidad', 'comunidad', NULL, '2022-06-23 13:56:17', '2022-06-23 13:56:17', NULL),
	(6, 'pro360', 'comunidadpro', NULL, '2022-07-27 15:51:10', '2022-07-27 15:51:10', NULL);

-- Volcando estructura para tabla db_margarita.templates_views
CREATE TABLE IF NOT EXISTS `templates_views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `view_twig` varchar(150) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_templates_views_templates` (`template_id`),
  CONSTRAINT `FK_templates_views_templates` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates_views: ~25 rows (aproximadamente)
INSERT INTO `templates_views` (`id`, `nombre`, `view_twig`, `slug`, `index`, `template_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Principal', 'inicio.twig', NULL, 1, 1, '2021-08-12 10:19:31', '2021-08-12 17:38:17', NULL),
	(2, 'Ecomerce', 'cursos.twig', NULL, 2, 1, '2021-08-12 10:23:25', '2021-09-04 23:33:36', NULL),
	(3, 'Galeria', 'galeria.twig', NULL, 3, 1, '2021-08-12 10:23:42', '2021-09-04 23:33:39', NULL),
	(4, 'Contacto', 'contacto.twig', NULL, 4, 1, '2021-08-12 10:24:01', '2021-09-04 23:33:41', NULL),
	(7, 'Terminos y condiciones', 'terminos-condiciones.twig', 'terminos-y-condiciones', 5, 1, '2021-10-13 23:57:02', '2021-10-13 23:57:02', NULL),
	(8, 'Politicas y privacidad', 'politicas-privacidad.twig', 'politicas-de-privacidad', 6, 1, '2021-10-13 23:57:02', '2021-10-13 23:57:02', NULL),
	(9, 'Principal', 'inicio.twig', NULL, 1, 2, '2021-12-12 16:50:17', '2021-12-12 16:50:17', NULL),
	(10, 'Nosotros', 'nosotros.twig', NULL, 2, 2, '2021-12-12 16:54:39', '2021-12-12 16:54:39', NULL),
	(11, 'Areas', 'areas.twig', NULL, 3, 2, '2021-12-12 16:54:56', '2021-12-12 16:54:56', NULL),
	(12, 'Equipo', 'equipo.twig', NULL, 4, 2, '2021-12-12 16:55:13', '2021-12-12 16:55:13', NULL),
	(15, 'Clientes', 'clientes.twig', NULL, 5, 2, '2021-12-12 16:55:33', '2021-12-12 16:55:33', NULL),
	(17, 'Contacto', 'contacto.twig', NULL, 6, 2, '2021-12-12 16:55:52', '2021-12-12 16:55:52', NULL),
	(18, 'Principal', 'inicio.twig', NULL, 1, 3, '2022-03-11 13:08:58', '2022-03-11 13:08:58', NULL),
	(19, 'Principal', 'home.twig', '', 1, 4, '2021-08-12 10:19:31', '2022-05-04 20:28:08', NULL),
	(20, 'Servicios', 'service.twig', 'servicios', 1, 4, '2021-08-12 10:19:31', '2022-05-04 20:28:13', NULL),
	(21, 'Nostros', 'us.twig', 'nosotros', 1, 4, '2021-08-12 10:19:31', '2022-05-04 20:28:30', NULL),
	(22, 'Portafolio', 'portfolio.twig', 'portafolio', 3, 4, '2021-08-12 10:19:31', '2022-05-04 20:29:01', NULL),
	(23, 'Contacto', 'contact.twig', 'contacto', 4, 4, '2021-08-12 10:19:31', '2022-05-04 20:29:05', NULL),
	(24, 'Blog', 'blog.twig', 'blog', 1, 4, '2021-08-12 10:19:31', '2022-05-04 20:29:07', NULL),
	(25, 'Principal', 'home.twig', NULL, 1, 5, '2022-06-23 13:56:59', '2022-06-23 13:56:59', NULL),
	(26, 'Principal', 'inicio.twig', NULL, 1, 6, '2022-07-29 12:45:55', '2022-07-29 12:45:55', NULL),
	(27, 'Espacio Pro360', 'espacio.twig', 'espacio-pro360', 7, 6, '2022-07-29 12:45:55', '2022-08-09 16:46:06', NULL),
	(28, 'Contactanos', 'contactanos.twig', 'contactanos', 1, 6, '2022-07-29 12:45:55', '2022-07-29 12:45:55', NULL),
	(29, 'Podcast', 'podcast.twig', 'podcast', 1, 6, '2022-07-29 12:45:55', '2022-07-29 12:45:55', NULL),
	(30, 'Politicas y privacidad', 'politicas-privacidad.twig', 'politicas-de-privacidad', 6, 6, '2021-10-13 23:57:02', '2022-08-08 22:43:09', NULL),
	(31, 'Terminos y condiciones', 'terminos-condiciones.twig', 'terminos-y-condiciones', 5, 6, '2021-10-13 23:57:02', '2022-08-08 22:43:12', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.topics: ~0 rows (aproximadamente)
INSERT INTO `topics` (`id`, `name`, `description`, `order`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'plan 1', '', 1, 1, '2021-09-20 18:01:05', '2021-11-12 16:58:17', '2021-11-12 16:58:17');

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
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Master', 'Usuario', 'master@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 1, '2021-07-16 21:54:59', '2021-07-16 21:54:59', NULL),
	(2, 'Admin', 'Usuario', 'admin@platform.com', 'aEFDdXhjWEJTTXgyU0llZ3hWb0lVdz09Ojpnu8DjiuPXGfgleRJvICaN', NULL, 'M', 2, '2021-07-16 21:54:59', '2021-08-02 21:03:02', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
