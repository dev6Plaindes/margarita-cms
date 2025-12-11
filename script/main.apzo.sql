-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
	(1, 'Piel cosmética', '#b89a9a', 1, '2021-09-02 12:07:52', '2021-11-10 22:33:20', NULL),
	(2, 'Farmacia', '#e6e6e6', 1, '2021-09-02 12:08:09', '2021-09-02 12:08:09', NULL),
	(3, 'Limpieza', '#73023d', 1, '2021-09-02 12:08:22', '2021-09-02 12:08:22', NULL),
	(4, '', '#45e0d6', 1, '2021-09-02 12:08:38', '2021-11-10 23:35:06', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.characteristics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` (`id`, `name`, `description`, `design_icon_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'duracion', '26 horas', 1, 1, '2021-09-17 12:34:25', '2021-09-17 12:34:25', NULL);
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;

-- Volcando estructura para tabla db_margarita.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_codigo` varchar(250) NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `description`, `url_codigo`, `template_id`, `settings`, `ruc`, `meta_title`, `email_contact`, `phone_contact`, `mailer_host`, `mailer_username`, `mailer_password`, `mailer_name`, `address`, `favicon`, `terms_and_conditions`, `privacy_policies`, `mision`, `vision`, `facebook_link`, `whatsapp_link`, `twitter_link`, `linkedin_link`, `instagram_link`, `latitude_maps`, `longitude_maps`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ML STETIC', 'Somos un centro de especialización y asesoría en\r\nestética profesional y dermocosmetica.', '2cms-ecomerce.test:8080', 1, '{"aside":{"dashboard":{"hide":"0"},"configuracion":{"hide":"0"},"empresa":{"hide":"0"},"interfaz":{"hide":"0"},"pagos":{"hide":"0"},"landing":{"hide":"0"},"secciones":{"hide":"0"},"menu":{"hide":"0"},"galeria":{"hide":"1"},"ecommerce":{"hide":"0"},"productos":{"hide":"0"},"categoria":{"hide":"0"},"docentes":{"hide":"0"},"mensajes":{"hide":"0"},"perfil":{"hide":"0"}}}', '', 'ML STETIC', 'info@mlstetic.com', '+51 01 3220391', '', '', '', '', 'Jr. Palma De Mallorca 192 San Luis, Lima', '/upload/company/163408148361661acb88767-android-icon-144x144.png', '<div class="C3i1Pd m2dIJf" style="-webkit-tap-highlight-color: transparent; text-align: center; padding-top: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><img class="HTjVbe" alt="" src="https://www.gstatic.com/identity/boq/policies/privacy/tos_main_illustration.svg" data-atf="false" data-iml="552.7000000029802" style="-webkit-tap-highlight-color: transparent; border-width: initial; border-color: initial; border-image: initial; display: inline-block; margin: 0px; vertical-align: top; width: 440px;"></div><h1 class="bVzSHe" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); display: inline-block; font-family: Roboto, arial, sans-serif; font-size: 12px; letter-spacing: 0.8px; line-height: 20px; margin: 1.236em 0px 0.618em; text-transform: uppercase;">TÉRMINOS DEL SERVICIO DE GOOGLE</h1><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Fecha de entrada en vigor: 31 de marzo de 2020 <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://policies.google.com/terms/archive?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Versiones archivadas</a><span class="LzjtMd" style="-webkit-tap-highlight-color: transparent;"> <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://www.gstatic.com/policies/terms/pdf/20200331/ba461e2f/google_terms_of_service_es.pdf" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Descargar PDF</a></span></p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-country-version" data-name="country-version" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">Versión específica de país:</a> Perú</p><div id="whats-covered" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Qué se trata en estos términos</h2><h3 class="XwcIZc" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 24px; line-height: 32px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 24px 0px 4px;">Sabemos que es tentador saltarse estos Términos del Servicio, pero es importante determinar qué puedes esperar de nosotros al usar los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google y qué esperamos nosotros de ti.</h3><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Estos Términos del Servicio reflejan <a href="https://about.google/intl/es_PE/how-our-business-works" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">la forma de trabajar de Google como empresa</a>, las leyes por las que nos regimos y <a href="https://www.google.com/about/philosophy.html?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">determinados aspectos que siempre hemos creído que son ciertos</a>. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Google contigo cuando interactúas con nuestros servicios. Por ejemplo, estos términos incluyen las siguientes secciones:</p><ul style="-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 16px; padding: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-you-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Qué puedes esperar de nosotros</a>, donde se describe cómo proporcionamos y desarrollamos nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-we-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Lo que esperamos de ti</a>, donde se establecen ciertas reglas para utilizar nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-content" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Contenido en los servicios de Google</a>, donde se describen los derechos de propiedad intelectual relacionados con el contenido que aparece en nuestros servicios, ya sea propiedad tuya, de Google o de terceros.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-problems" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">En caso de problemas o discrepancias</a>, donde se describen otros derechos legales que tienes y las consecuencias de infringir estos términos.</li></ul><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Es importante que entiendas estos términos porque el uso de nuestros servicios implica que los aceptas.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Además de estos términos, también publicamos una <a href="https://policies.google.com/privacy?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Política de Privacidad</a>. Aunque no forme parte de estos términos, te recomendamos que la leas para entender mejor cómo puedes <a href="https://myaccount.google.com/?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">actualizar, gestionar, exportar y eliminar tu información</a>.</p><div id="service-provider" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Proveedor de servicios</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google los proporciona y se contratan con:</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Google LLC<br style="-webkit-tap-highlight-color: transparent;">Empresa que se rige por las leyes del estado de Delaware (EE. UU.) y que opera bajo la legislación estadounidense<br style="-webkit-tap-highlight-color: transparent;"><br style="-webkit-tap-highlight-color: transparent;">1600 Amphitheatre Parkway<br style="-webkit-tap-highlight-color: transparent;">Mountain View, California, 94043<br style="-webkit-tap-highlight-color: transparent;">EE. UU.</p><div id="age-requirements" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Requisitos de edad mínima</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si no tienes la <a href="https://support.google.com/accounts/answer/1350409?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">edad mínima para poder gestionar tu propia cuenta de Google</a>, debes contar con el permiso de tu padre, madre o tutor legal para utilizar una cuenta de Google. Pide a tu padre, madre o tutor legal que lea estos términos contigo.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si eres padre, madre o tutor legal y permites a tu hijo/a que utilice los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a>, se te aplican estos términos y eres responsable de la actividad que realice en los servicios.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Algunos servicios de Google tienen requisitos de edad mínima adicionales, como se describe en sus <a href="https://policies.google.com/terms/service-specific?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">términos y políticas adicionales específicos</a>.</p>', '<div class="C3i1Pd m2dIJf" style="-webkit-tap-highlight-color: transparent; text-align: center; padding-top: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><img class="HTjVbe" alt="" src="https://www.gstatic.com/identity/boq/policies/privacy/tos_main_illustration.svg" data-atf="false" data-iml="552.7000000029802" style="-webkit-tap-highlight-color: transparent; border-width: initial; border-color: initial; border-image: initial; display: inline-block; margin: 0px; vertical-align: top; width: 440px;"></div><h1 class="bVzSHe" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); display: inline-block; font-family: Roboto, arial, sans-serif; font-size: 12px; letter-spacing: 0.8px; line-height: 20px; margin: 1.236em 0px 0.618em; text-transform: uppercase;">TÉRMINOS DEL SERVICIO DE GOOGLE</h1><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Fecha de entrada en vigor: 31 de marzo de 2020 <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://policies.google.com/terms/archive?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Versiones archivadas</a><span class="LzjtMd" style="-webkit-tap-highlight-color: transparent;"> <span class="X75z6e" style="-webkit-tap-highlight-color: transparent; color: rgb(189, 193, 198);">|</span> <a href="https://www.gstatic.com/policies/terms/pdf/20200331/ba461e2f/google_terms_of_service_es.pdf" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Descargar PDF</a></span></p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-country-version" data-name="country-version" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">Versión específica de país:</a> Perú</p><div id="whats-covered" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Qué se trata en estos términos</h2><h3 class="XwcIZc" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 24px; line-height: 32px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 24px 0px 4px;">Sabemos que es tentador saltarse estos Términos del Servicio, pero es importante determinar qué puedes esperar de nosotros al usar los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google y qué esperamos nosotros de ti.</h3><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Estos Términos del Servicio reflejan <a href="https://about.google/intl/es_PE/how-our-business-works" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">la forma de trabajar de Google como empresa</a>, las leyes por las que nos regimos y <a href="https://www.google.com/about/philosophy.html?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">determinados aspectos que siempre hemos creído que son ciertos</a>. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Google contigo cuando interactúas con nuestros servicios. Por ejemplo, estos términos incluyen las siguientes secciones:</p><ul style="-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 16px; padding: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-you-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Qué puedes esperar de nosotros</a>, donde se describe cómo proporcionamos y desarrollamos nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-what-we-expect" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Lo que esperamos de ti</a>, donde se establecen ciertas reglas para utilizar nuestros servicios.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-content" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Contenido en los servicios de Google</a>, donde se describen los derechos de propiedad intelectual relacionados con el contenido que aparece en nuestros servicios, ya sea propiedad tuya, de Google o de terceros.</li><li style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-left: 16px; padding-top: 20px;"><a href="https://policies.google.com/terms?hl=es#toc-problems" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">En caso de problemas o discrepancias</a>, donde se describen otros derechos legales que tienes y las consecuencias de infringir estos términos.</li></ul><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Es importante que entiendas estos términos porque el uso de nuestros servicios implica que los aceptas.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Además de estos términos, también publicamos una <a href="https://policies.google.com/privacy?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">Política de Privacidad</a>. Aunque no forme parte de estos términos, te recomendamos que la leas para entender mejor cómo puedes <a href="https://myaccount.google.com/?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">actualizar, gestionar, exportar y eliminar tu información</a>.</p><div id="service-provider" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Proveedor de servicios</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a> de Google los proporciona y se contratan con:</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Google LLC<br style="-webkit-tap-highlight-color: transparent;">Empresa que se rige por las leyes del estado de Delaware (EE. UU.) y que opera bajo la legislación estadounidense<br style="-webkit-tap-highlight-color: transparent;"><br style="-webkit-tap-highlight-color: transparent;">1600 Amphitheatre Parkway<br style="-webkit-tap-highlight-color: transparent;">Mountain View, California, 94043<br style="-webkit-tap-highlight-color: transparent;">EE. UU.</p><div id="age-requirements" class="ahbJ5" style="-webkit-tap-highlight-color: transparent; position: relative; visibility: hidden; top: -134px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;"></div><h2 class="Sw0jjd" style="-webkit-tap-highlight-color: transparent; color: rgb(60, 64, 67); font-family: "Google Sans", sans-serif; font-size: 22px; line-height: 28px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 64px 0px 0px;">Requisitos de edad mínima</h2><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si no tienes la <a href="https://support.google.com/accounts/answer/1350409?hl=es" class="N6CPUe" target="_blank" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214); background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'24\' height=\'24\' viewBox=\'0 0 24 24\' fill=\'rgb(51, 103, 214)\'%3E%3Cpath d=\'M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z\'/%3E%3C/svg%3E"); background-position: right center; background-size: 12px; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; padding-right: 14px;">edad mínima para poder gestionar tu propia cuenta de Google</a>, debes contar con el permiso de tu padre, madre o tutor legal para utilizar una cuenta de Google. Pide a tu padre, madre o tutor legal que lea estos términos contigo.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Si eres padre, madre o tutor legal y permites a tu hijo/a que utilice los <a class="UADm2d" href="https://policies.google.com/terms?hl=es#footnote-services" data-name="services" jsaction="click:IPbaae(preventDefault=true)" style="-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.87); border-bottom: 1.5px solid rgb(123, 170, 247);">servicios</a>, se te aplican estos términos y eres responsable de la actividad que realice en los servicios.</p><p style="-webkit-tap-highlight-color: transparent; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px;">Algunos servicios de Google tienen requisitos de edad mínima adicionales, como se describe en sus <a href="https://policies.google.com/terms/service-specific?hl=es" style="-webkit-tap-highlight-color: transparent; color: rgb(51, 103, 214);">términos y políticas adicionales específicos</a>.</p>', '<p>bbb</p>', '<p>aaa</p>', 'https://www.facebook.com/mlstetic', 'https://wa.me/51987255092/?text=Hola Solicito información', '', '', 'https://www.instagram.com/ml.stetic/?hl=es', '-76.99902637058118', '-12.078747754175907', '2021-08-10 10:57:27', '2021-11-15 10:56:05', NULL),
	(2, 'new ecomerce', NULL, 'newecomerce.idcloudsystem.com', 1, NULL, NULL, 'FRI ESAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/upload/company/163424553261689b9c035c3-logos friesan_friesan rojo.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-14 20:07:52', '2021-10-14 16:05:32', NULL),
	(3, 'APZO', NULL, 'cms-ecomerce.test:8080', 2, NULL, NULL, 'FRI ESAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/upload/company/163424553261689b9c035c3-logos friesan_friesan rojo.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-14 20:07:52', '2021-11-15 10:56:11', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_colors: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `companies_colors` DISABLE KEYS */;
INSERT INTO `companies_colors` (`id`, `color`, `alias`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '#c5c3c8', 'for', 1, '2021-08-11 19:01:12', '2021-10-15 13:56:55', NULL),
	(2, '#dabb69', 'one', 1, '2021-08-11 19:01:12', '2021-10-15 13:58:10', NULL),
	(3, '#b49f5e', 'two', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:28', NULL),
	(4, '#000000', 'five', 1, '2021-08-11 19:01:12', '2021-10-15 13:58:10', NULL),
	(5, '#bfbfbd', 'three', 1, '2021-08-11 19:01:12', '2021-10-15 13:58:10', NULL),
	(6, '#dabb69', 'six', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:42', NULL),
	(7, '#ececec', 'seven', 1, '2021-08-11 19:01:12', '2021-08-13 15:45:45', NULL),
	(32, '#e51f2f', 'for', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:00', NULL),
	(33, '#bfbfbd', 'one', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:49', NULL),
	(34, '#b49f5e', 'two', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:51', NULL),
	(35, '#1d1d1b', 'five', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:54', NULL),
	(36, '#1d1d1b', 'three', 2, '2021-08-11 19:01:12', '2021-10-14 15:47:54', NULL),
	(37, '#dabb69', 'six', 2, '2021-08-11 19:01:12', '2021-10-14 20:45:59', NULL),
	(38, '#ececec', 'seven', 2, '2021-08-11 19:01:12', '2021-10-14 20:46:00', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.companies_logos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `companies_logos` DISABLE KEYS */;
INSERT INTO `companies_logos` (`id`, `logo`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '/upload/logos/162872641661146490a9e8e-logo.png', 1, '2021-08-11 19:00:16', '2021-08-11 19:00:16', NULL),
	(2, 'logo.png', 1, '2021-08-11 19:00:16', '2021-08-13 15:40:19', '2021-08-13 15:40:18'),
	(3, '/upload/logos/1630370279612d79e7c88c2-logo.png', 1, '2021-08-30 19:36:28', '2021-08-30 19:37:59', NULL),
	(4, '/upload/logos/1634243819616894eb7d41d-logos friesan_friesan original.png', 2, '2021-10-14 15:36:59', '2021-10-14 15:36:59', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` (`id`, `name`, `caption`, `description`, `image`, `file`, `color`, `order`, `status`, `section_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(5, 'Empiece a aprender de nuestros expertos', 'kipso-icon-training', NULL, NULL, NULL, NULL, 8, 1, 3, 2, 1, '2021-08-12 16:52:36', '2021-11-10 10:29:08', NULL),
	(6, 'Mejore sus habilidades con nosotros ahora', 'kipso-icon-knowledge', NULL, NULL, NULL, NULL, 9, 1, 3, 2, 1, '2021-08-12 16:53:37', '2021-11-10 10:29:21', NULL),
	(7, 'Capacitados', '4890', '', NULL, NULL, NULL, 0, 1, 3, 3, 1, '2021-08-12 16:52:36', '2021-08-30 17:35:39', NULL),
	(8, 'Especialízate<br>en estética', '¿Estas listo para aprender?', NULL, NULL, NULL, NULL, 2, 1, 1, 1, 1, '2021-08-17 17:40:04', '2021-11-10 10:29:53', NULL),
	(12, 'Especialízate<br>en estética', '¿Estas listo para aprender?', '', NULL, NULL, NULL, 0, 1, 1, 1, 1, '2021-08-17 17:41:32', '2021-08-30 17:37:40', NULL),
	(14, 'Bienvenido a\r\nML STETIC donde\r\nestudiamos la belleza', 'Somos un centro de especialización y asesoría en estética profesional y dermocosmética, potenciando tu experiencia elevamos tu competitividad profesional, con un enfoque práctico y multidisciplinario.', NULL, NULL, NULL, NULL, 0, 1, 3, 1, 1, '2021-08-12 16:50:50', '2021-10-13 15:09:37', NULL),
	(15, 'La única misión de \r\nML STETIC es potenciar\r\ntu experiencia y conocimientos', 'https://www.youtube.com/embed/VJSwxINgJaw?controls=0', NULL, NULL, NULL, NULL, 0, 1, 4, 1, 1, '2021-08-30 13:10:18', '2021-10-13 15:11:25', NULL),
	(16, '¡Registrate ahora y obten una clase gratis!', 'https://www.youtube.com/embed/VJSwxINgJaw', 'Teoria y practica es la sinergia que todo esteticista debe de manejar, los principios cientificos de piel se complementan y se aplican en la practica.', NULL, NULL, NULL, 0, 1, 5, 4, 1, '2021-08-30 17:18:06', '2021-08-30 17:22:13', NULL),
	(19, 'Beneficios de aprender con ML STETIC', NULL, NULL, NULL, NULL, NULL, 0, 1, 6, 8, 1, '2021-08-30 17:59:12', '2021-09-02 22:19:02', '2021-08-30 18:01:23'),
	(20, 'Beneficios de aprender con ML STETIC', 'CCAS, ML STETIC , rompe con el esquema robotizado de la estética convencional, creyendo en la libertad de creación y diseño de tratamientos estéticos integrales basándonos en el CONOCIMIENTO DE LA CIENCIA.\r\n• Modalidad semi presencial\r\n• Modalidad remota 100% online\r\n• Metodología patentada\r\n• Enseñanza personalizada', NULL, NULL, NULL, NULL, 0, 1, 6, 1, 1, '2021-08-30 18:00:41', '2021-08-30 18:03:55', NULL),
	(21, 'Cursos profesionales', 'kipso-icon-strategy', NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:01:52', '2021-08-30 18:03:50', NULL),
	(22, 'Aprendizaje en vivo', 'kipso-icon-training', NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:02:15', '2021-08-30 18:03:51', NULL),
	(23, 'Profesores expertos', 'kipso-icon-human-resources', NULL, NULL, NULL, NULL, 0, 1, 6, 2, 1, '2021-08-30 18:02:34', '2021-08-30 18:03:51', NULL),
	(24, '', NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:24:53', '2021-10-15 13:18:54', NULL),
	(25, '', NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:25:16', '2021-10-15 13:19:09', NULL),
	(26, '', NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-08-30 18:25:39', '2021-10-15 13:19:32', NULL),
	(27, 'Tenemos los mejores profesores en todas las materias.', 'Lorem ipsum gravida nibh vel velit auctor aliquetnean sollicitudin, lorem quis bibendum auci elit\r\nconsequat is simply free text available in the psutis sem nibh id eis sed odio sit amet.', NULL, NULL, NULL, NULL, 0, 1, 8, 7, 1, '2021-08-30 18:34:43', '2021-09-02 22:16:10', NULL),
	(28, 'imagen 1', NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:18', '2021-09-02 16:09:18', NULL),
	(29, 'Imagen 2', NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:43', '2021-09-02 16:09:43', NULL),
	(30, 'Imagen 3', NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:09:58', '2021-09-02 16:09:58', NULL),
	(31, 'Imagen 4', NULL, NULL, NULL, NULL, NULL, 0, 1, 9, 6, 1, '2021-09-02 16:10:23', '2021-09-02 16:10:23', NULL),
	(32, 'Preparate con \r\nFRI ESAN', '', NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 15:51:26', '2021-10-14 16:23:19', NULL),
	(33, 'Preparate con FRI ESAN', '', NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 15:58:44', '2021-10-14 16:24:56', '2021-10-14 16:24:56'),
	(34, 'Tecnología de punta', '', NULL, NULL, NULL, NULL, 0, 1, 10, 9, 2, '2021-10-14 16:25:25', '2021-10-14 16:25:25', NULL),
	(35, '', NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-10-15 13:20:25', '2021-10-15 13:20:25', NULL),
	(36, '', NULL, NULL, NULL, NULL, NULL, 0, 1, 7, 5, 1, '2021-10-15 13:38:43', '2021-10-15 13:38:43', NULL);
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
  `gallery` int(11) DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `content_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_images: ~88 rows (aproximadamente)
/*!40000 ALTER TABLE `contents_images` DISABLE KEYS */;
INSERT INTO `contents_images` (`id`, `image`, `gallery`, `order`, `content_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(7, '/upload/images/1628804846611596eed0064-chica-piel.png', 0, 0, 8, 1, '2021-08-12 16:47:26', '2021-10-15 14:41:04', NULL),
	(8, '/upload/images/163416012461674dfc3b574-equipo-2.png', 0, 0, 8, 1, '2021-08-12 16:47:26', '2021-10-15 14:41:06', NULL),
	(10, '/upload/images/1628805070611597ce06545-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-12 16:51:10', '2021-10-15 14:41:07', '2021-08-30 15:10:18'),
	(16, '/upload/images/1628804846611596eed735a-slider-1-scratch.png', 0, 0, 12, 1, '2021-08-12 16:47:26', '2021-10-15 14:41:09', NULL),
	(17, '/upload/images/1628804846611596eed0064-chica-piel.png', 0, 0, 12, 1, '2021-08-12 16:47:26', '2021-10-15 14:41:11', NULL),
	(18, '/upload/images/163417169161677b2b59868-somos.png', 0, 0, 15, 1, '2021-08-30 13:12:09', '2021-10-15 14:41:18', NULL),
	(19, '/upload/images/1630354900612d3dd42f02c-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-30 15:21:40', '2021-10-15 14:41:20', '2021-08-30 15:23:05'),
	(20, '/upload/images/1630355026612d3e529198e-estudiante-1.jpg', 0, 0, 14, 1, '2021-08-30 15:23:46', '2021-10-15 14:41:22', '2021-08-30 15:25:36'),
	(21, '/upload/images/163408275961661fc7dd94f-estudiamos.jpeg', 0, 0, 14, 1, '2021-08-30 15:52:46', '2021-10-15 14:41:46', NULL),
	(22, '/upload/images/16341412756167045b86e70-20210817_164300.jpg', 0, 0, 20, 1, '2021-08-30 18:01:13', '2021-10-15 14:41:48', NULL),
	(23, '/upload/images/16343230806169ca887ddf2-bella curet.png', 0, 0, 24, 1, '2021-08-30 18:24:53', '2021-10-15 13:38:00', NULL),
	(24, '/upload/images/16343230916169ca9326068-carthage.png', 0, 0, 25, 1, '2021-08-30 18:25:16', '2021-10-15 13:38:11', NULL),
	(25, '/upload/images/16343231006169ca9cd8e98-ield.png', 0, 0, 26, 1, '2021-08-30 18:25:39', '2021-10-15 13:38:20', NULL),
	(26, '/upload/images/163417187261677be0e151b-equipo-2.png', 0, 0, 27, 1, '2021-08-30 18:34:43', '2021-10-15 14:41:57', NULL),
	(27, '/upload/images/163061695861313d7eb8a03-estudiante-2.jpg', 0, 0, 28, 1, '2021-09-02 16:09:18', '2021-10-15 14:41:54', NULL),
	(28, '/upload/images/163061698361313d979b5fc-estudiante-2.jpg', 0, 0, 29, 1, '2021-09-02 16:09:43', '2021-10-15 14:42:04', NULL),
	(29, '/upload/images/163061699861313da6decb6-estudiante-5.jpg', 0, 0, 30, 1, '2021-09-02 16:09:58', '2021-10-15 14:42:06', NULL),
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
	(77, '/upload/images/16353583346179967e3927b-prueba-2.jpg', 1, 0, 0, 1, '2021-10-27 13:12:14', '2021-10-27 14:55:51', '2021-10-27 14:55:51'),
	(78, '/upload/images/16353585106179972e56896-163061695861313d7eb8a03-estudiante-2.jpg', 1, 0, 0, 1, '2021-10-27 13:15:10', '2021-10-27 14:55:53', '2021-10-27 14:55:53'),
	(79, '/upload/images/16353585106179972e651c1-img_20211009_191007522.jpg', 1, 0, 0, 1, '2021-10-27 13:15:10', '2021-10-27 14:58:08', '2021-10-27 14:58:08'),
	(80, '/upload/images/163535856861799768309c3-prueba-image.jpg', 1, 0, 0, 1, '2021-10-27 13:16:08', '2021-10-27 14:58:10', '2021-10-27 14:58:10'),
	(81, '/upload/images/1635358568617997683f607-img_20211009_191007522.jpg', 1, 5, 0, 1, '2021-10-27 13:16:08', '2021-10-27 16:52:30', '2021-10-27 16:52:30'),
	(82, '/upload/images/16353588126179985cc98f5-prueba-image.jpg', 1, 5, 0, 1, '2021-10-27 13:20:12', '2021-10-29 10:55:17', NULL),
	(83, '/upload/images/16353588126179985cd8804-prueba-2.jpg', 1, 0, 0, 1, '2021-10-27 13:20:12', '2021-10-27 14:57:01', '2021-10-27 14:57:01'),
	(84, '/upload/images/16353588126179985ce5819-cover.jpg', 0, 0, 0, 1, '2021-10-27 13:20:12', '2021-10-27 14:55:46', '2021-10-27 14:55:46'),
	(85, '/upload/images/16353588506179988294cdb-prueba-2.jpg', 1, 0, 0, 1, '2021-10-27 13:20:50', '2021-10-27 14:56:58', '2021-10-27 14:56:58'),
	(86, '/upload/images/163535885061799882a322e-cover.jpg', 1, 0, 0, 1, '2021-10-27 13:20:50', '2021-10-27 14:56:55', '2021-10-27 14:56:55'),
	(87, '/upload/images/163535885061799882b09a9-prueba-image.jpg', 0, 0, 0, 1, '2021-10-27 13:20:50', '2021-10-27 14:55:29', '2021-10-27 14:55:28'),
	(88, '/upload/images/1635358905617998b91eb4c-163061699861313da6decb6-estudiante-5.jpg', 0, 0, 0, 1, '2021-10-27 13:21:45', '2021-10-27 14:55:42', '2021-10-27 14:55:42'),
	(89, '/upload/images/1635358905617998b92cfd0-163061702361313dbfaeba1-estudiante-6.jpg', 0, 0, 0, 1, '2021-10-27 13:21:45', '2021-10-27 14:55:38', '2021-10-27 14:55:38'),
	(90, '/upload/images/1635358905617998b93cbfe-163061695861313d7eb8a03-estudiante-2.jpg', 0, 0, 0, 1, '2021-10-27 13:21:45', '2021-10-27 14:55:18', '2021-10-27 14:55:18'),
	(91, '/upload/images/163535982061799c4ce54a1-whatsapp image 2021-10-25 at 9.54.16 am.jpeg', 0, 0, 0, 1, '2021-10-27 13:37:00', '2021-10-27 14:55:16', '2021-10-27 14:55:16'),
	(92, '/upload/images/163535982061799c4cf2cc2-whatsapp image 2021-10-25 at 9.53.43 am.jpeg', 0, 0, 0, 1, '2021-10-27 13:37:01', '2021-10-27 14:55:20', '2021-10-27 14:55:20'),
	(93, '/upload/images/163535989561799c97dc075-whatsapp image 2021-10-25 at 9.54.16 am.jpeg', 1, 0, 0, 1, '2021-10-27 13:38:15', '2021-10-27 14:56:52', '2021-10-27 14:56:52'),
	(94, '/upload/images/163535989561799c97e9891-whatsapp image 2021-10-25 at 10.56.52 am.jpeg', 1, 0, 0, 1, '2021-10-27 13:38:15', '2021-10-27 14:56:48', '2021-10-27 14:56:48'),
	(95, '/upload/images/163535989661799c98027f7-whatsapp image 2021-10-25 at 9.53.43 am.jpeg', 1, 0, 0, 1, '2021-10-27 13:38:16', '2021-10-27 14:56:00', '2021-10-27 14:56:00'),
	(96, '/upload/images/16353677396179bb3b19f63-63faf913-72aa-4ea6-b67d-7dd04bf9cc26.jpg', 1, 2, 0, 1, '2021-10-27 15:48:59', '2021-10-27 16:50:12', NULL),
	(97, '/upload/images/16353677396179bb3b2b182-163061695861313d7eb8a03-estudiante-2.jpg', 1, 2, 0, 1, '2021-10-27 15:48:59', '2021-10-27 16:43:07', '2021-10-27 16:43:07'),
	(98, '/upload/images/16353677396179bb3b3b7d5-163061702361313dbfaeba1-estudiante-6.jpg', 1, 1, 0, 1, '2021-10-27 15:48:59', '2021-10-27 16:48:22', NULL),
	(99, '/upload/images/16353677396179bb3b4b0a2-163061699861313da6decb6-estudiante-5.jpg', 1, 2, 0, 1, '2021-10-27 15:48:59', '2021-10-27 16:50:12', '2021-10-27 16:50:12'),
	(100, '/upload/images/16353714896179c9e14fefa-cover.jpg', 1, 3, 0, 1, '2021-10-27 16:51:29', '2021-10-29 10:55:17', NULL),
	(101, '/upload/images/16353715196179c9ff5ac3d-prueba-2.jpg', 1, 4, 0, 1, '2021-10-27 16:51:59', '2021-10-29 10:55:17', NULL),
	(102, '/upload/images/16353715196179c9ff67e5a-prueba-image.jpg', 1, 7, 0, 1, '2021-10-27 16:51:59', '2021-10-27 16:52:21', '2021-10-27 16:52:21'),
	(103, '/upload/images/16353715196179c9ff75210-img_20211009_191007522.jpg', 1, 6, 0, 1, '2021-10-27 16:51:59', '2021-10-27 16:52:30', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.contents_types: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `contents_types` DISABLE KEYS */;
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
	(16, 'Beneficios', 'beneficio', '{ \r\n    "name": {\r\n        "label": "URL", \r\n        "type": "input"\r\n    },\r\n    "images": {\r\n        "label": "Logo", \r\n        "type": "input",\r\n        "plugin": "images"\r\n    }\r\n}', 1, 2, '2021-08-30 17:57:55', '2021-10-14 20:50:02', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.inscriptions: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `inscriptions` DISABLE KEYS */;
INSERT INTO `inscriptions` (`id`, `product_id`, `email`, `name`, `phone`, `code`, `price`, `level`, `file`, `status`, `ip`, `comment`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'RD316319000786144D1AE3B3C2', 450.00, '2', '/upload/voucher/16319003406144d2b486baa-image (14).png', 'pagado', '127.0.0.1', 'Registro de mi pago', 1, '2021-09-17 12:34:38', '2021-10-06 10:50:38', NULL),
	(2, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'VRM16319004756144D33B1CA92', 450.00, '2', '/upload/voucher/16319004756144d33b1cbe5-image (14).png', 'rechazado', '127.0.0.1', 'zzz', 1, '2021-09-17 12:41:15', '2021-10-06 10:50:59', NULL),
	(3, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', '2VX1632265741614A660D49668', 450.00, '1', NULL, 'pendiente', '127.0.0.1', NULL, 1, '2021-09-21 18:09:01', '2021-09-21 18:09:01', NULL),
	(4, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'ZA3163409367461664A6A47083', 450.00, '1', '/upload/voucher/163409368761664a7799641-estudiamos.jpeg', 'enviado', '170.231.170.38', 'nuevo', 1, '2021-10-12 21:54:34', '2021-10-12 21:54:47', NULL),
	(5, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'YVJ16342631106168E046E9993', 450.00, '1', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-14 20:58:30', '2021-10-14 20:58:30', NULL),
	(6, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'ENZ16343244606169CFECD739D', 450.00, '2', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-15 14:01:00', '2021-10-15 14:01:00', NULL),
	(7, 1, 'alexanderzegarragotia@gmail.com', 'Victor Alexander Zegarra Gotia', '943777031', 'Z2K163476814661709512BA33C', 450.00, '1', NULL, 'pendiente', '170.231.170.38', NULL, 1, '2021-10-20 17:15:46', '2021-10-20 17:15:46', NULL);
/*!40000 ALTER TABLE `inscriptions` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.menus: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `image`, `order`, `slug`, `url`, `parent_id`, `company_id`, `template_view_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Nosotros', '/assets/template/stetic/images/banner-2.png', 1, 'nosotros', '', 0, 1, 1, '2021-08-10 22:33:03', '2021-09-05 01:19:53', NULL),
	(2, 'Especialidades', '/upload/menu/163409439861664d3e9df6c-menu.jpg', 4, 'especialidades', '', 0, 1, 2, '2021-08-10 22:33:32', '2021-11-12 16:24:21', NULL),
	(3, 'Cursos', '/upload/menu/163409439861664d3e9df6c-menu.jpg', 2, 'cursos', '', 0, 1, 2, '2021-08-10 22:33:50', '2021-11-12 17:52:45', NULL),
	(4, 'Diplomados', '/upload/menu/163409439861664d3e9df6c-menu.jpg', 1, 'diplomados', '', 0, 1, 2, '2021-08-10 22:39:08', '2021-11-12 17:52:38', NULL),
	(5, 'ESTETICA FACIAL', '/upload/menu/163409439861664d3e9df6c-menu.jpg', 2, 'estetica-facial', '', 2, 1, 2, '2021-08-10 22:39:26', '2021-11-12 17:46:55', NULL),
	(6, 'ESTETICA CORPORAL', '/upload/menu/163409439861664d3e9df6c-menu.jpg', 1, 'estetica-corporal', '', 2, 1, 2, '2021-08-10 22:39:48', '2021-11-12 17:46:50', NULL),
	(7, 'Contáctanos', '/upload/menu/1634095545616651b90d76d-20210810_1657143.jpg', 8, 'contactanos', '', 9, 1, 4, '2021-08-10 22:40:29', '2021-11-12 17:43:32', NULL),
	(9, 'Galería', '/assets/template/stetic/images/banner-2.png', 7, 'galeria', NULL, 0, 1, 3, '2021-08-30 18:43:15', '2021-09-05 01:19:58', NULL),
	(10, 'Inicio', NULL, 1, 'inicio', '', 0, 2, 1, '2021-10-14 15:30:58', '2021-10-14 15:30:58', NULL),
	(11, 'Diplomas', NULL, 2, 'diplomas', '', 0, 2, 2, '2021-10-14 15:31:41', '2021-10-14 15:31:41', NULL),
	(12, 'Contactanos', NULL, 4, 'contactanos', '', 0, 2, 4, '2021-10-14 15:32:43', '2021-10-14 15:32:43', NULL),
	(13, 'cursos', NULL, 3, 'cursos', '', 0, 2, 2, '2021-10-14 15:33:07', '2021-10-14 15:33:07', NULL);
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

-- Volcando datos para la tabla db_margarita.menus_products: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_products` DISABLE KEYS */;
INSERT INTO `menus_products` (`menu_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 7, '2021-11-12 18:18:26', '2021-11-12 18:18:26', NULL),
	(4, 7, '2021-11-12 18:18:26', '2021-11-12 18:18:26', NULL),
	(5, 1, '2021-11-12 18:17:48', '2021-11-12 18:17:48', NULL),
	(5, 2, '2021-09-05 01:27:09', '2021-09-05 01:27:09', NULL),
	(5, 6, '2021-11-10 23:38:01', '2021-11-10 23:38:01', NULL),
	(6, 3, '2021-09-05 01:28:07', '2021-09-05 01:28:07', NULL),
	(6, 4, '2021-09-05 01:30:00', '2021-09-05 01:30:00', NULL),
	(6, 5, '2021-11-10 23:36:59', '2021-11-10 23:36:59', NULL);
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

-- Volcando datos para la tabla db_margarita.menus_sections: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_sections` DISABLE KEYS */;
INSERT INTO `menus_sections` (`menu_id`, `section_id`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 0, '2021-09-17 15:44:41', '2021-09-17 15:44:41', NULL),
	(1, 2, 0, '2021-08-11 18:55:22', '2021-08-11 18:55:22', NULL),
	(1, 3, 0, '2021-09-19 11:10:18', '2021-09-19 11:10:18', NULL),
	(1, 4, 0, '2021-09-19 11:11:19', '2021-09-19 11:11:19', NULL),
	(1, 5, 0, '2021-09-19 11:12:08', '2021-09-19 11:12:08', NULL),
	(1, 6, 0, '2021-09-19 11:12:59', '2021-09-19 11:12:59', NULL),
	(1, 7, 0, '2021-09-19 11:13:47', '2021-09-19 11:13:47', NULL),
	(1, 8, 0, '2021-09-19 11:14:35', '2021-09-19 11:14:35', NULL),
	(9, 9, 0, '2021-09-19 11:14:51', '2021-09-19 11:14:51', NULL),
	(10, 10, 0, '2021-10-14 20:50:34', '2021-10-14 20:50:34', NULL);
/*!40000 ALTER TABLE `menus_sections` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.messages: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `name`, `email`, `phone`, `description`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, NULL, '943777031', NULL, 1, 1, '2021-09-21 21:08:23', '2021-09-21 21:08:23', NULL),
	(3, NULL, NULL, '943777032', NULL, 1, 1, '2021-09-21 21:32:13', '2021-09-21 21:32:13', NULL),
	(4, NULL, NULL, '94377703', NULL, 1, 1, '2021-09-21 21:32:39', '2021-09-21 21:32:39', NULL),
	(5, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', '943777031', '22 mensaje de prueba\r\nssss', 2, 1, '2021-09-21 21:39:05', '2021-09-21 21:39:05', NULL),
	(6, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', NULL, NULL, 2, 1, '2021-10-13 18:57:16', '2021-10-13 18:57:16', NULL),
	(7, 'Victor Alexander Zegarra Gotia', 'alexanderzegarragotia@gmail.com', NULL, NULL, 2, 1, '2021-10-13 19:08:39', '2021-10-13 19:08:39', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.products: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `caption`, `description`, `slug`, `overview`, `image`, `video`, `url`, `price`, `status`, `category_id`, `teacher_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'producto123', NULL, NULL, 'producto123', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"=""> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus333</span><br></p>', '/16318999486144d12c6b2c2-captura.png', NULL, 'https://www.youtube.com/embed/nEFls3HMNOw', 450.00, 1, 4, 1, 1, 1, '2021-09-05 01:20:28', '2021-11-12 18:17:48', NULL),
	(2, 'producto 2', NULL, NULL, 'producto-2', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 500.00, 1, 3, 2, 1, 1, '2021-09-05 01:27:09', '2021-09-05 01:27:09', NULL),
	(3, 'producto 3', NULL, NULL, 'producto-3', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 360.00, 1, 4, 1, 1, 1, '2021-09-05 01:28:07', '2021-09-05 01:28:07', NULL),
	(4, 'producto 4', NULL, NULL, 'producto-4', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">psum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como te</span><br></p>', NULL, NULL, '', 620.00, 1, 1, 2, 1, 1, '2021-09-05 01:30:00', '2021-09-05 01:30:00', NULL),
	(5, 'prueba', NULL, NULL, 'prueba', '', NULL, NULL, '', 12.00, 1, 4, 2, 1, 1, '2021-11-10 23:36:59', '2021-11-10 23:36:59', NULL),
	(6, 'test', NULL, NULL, 'test', '', NULL, NULL, '', 25.00, 1, 0, 2, 1, 1, '2021-11-10 23:38:01', '2021-11-10 23:38:01', NULL),
	(7, 'pppp', NULL, NULL, 'pppp', '<p>123</p>', NULL, NULL, '', 123.00, 1, 1, 2, 1, 1, '2021-11-12 18:18:26', '2021-11-12 18:18:26', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.sections: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` (`id`, `name`, `description`, `caption`, `color`, `alias`, `status`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Slide principal', '', 'Slide', NULL, 'slide', 1, NULL, 1, '2021-08-11 18:55:09', '2021-09-17 15:44:14', NULL),
	(2, 'Slide principal', '', 'Slide', '', NULL, 1, NULL, 1, '2021-08-11 18:55:22', '2021-08-11 18:55:36', '2021-08-11 18:55:36'),
	(3, 'Bienvenido', '', '', NULL, 'bienvenido', 1, NULL, 1, '2021-08-11 18:56:12', '2021-09-19 11:09:47', NULL),
	(4, 'Video corporativo', '', '', NULL, 'videocorp', 1, NULL, 1, '2021-08-30 13:08:52', '2021-08-30 13:18:16', NULL),
	(5, 'Registro', '', '', NULL, 'registro', 1, NULL, 1, '2021-08-30 17:13:54', '2021-08-30 17:49:20', NULL),
	(6, 'Beneficio', '', '', NULL, 'beneficio', 1, NULL, 1, '2021-08-30 17:55:31', '2021-08-30 18:09:29', NULL),
	(7, 'Socios', '', '', NULL, 'socios', 1, NULL, 1, '2021-08-30 18:16:00', '2021-08-30 18:24:17', NULL),
	(8, 'Profecionales', '', '', NULL, 'profecionales', 1, NULL, 1, '2021-08-30 18:33:45', '2021-08-30 18:40:26', NULL),
	(9, 'Galería', '', 'Slide', NULL, 'galeria', 1, NULL, 1, '2021-09-02 12:49:58', '2021-10-12 21:53:33', '2021-10-12 21:53:33'),
	(10, 'Slider principal', '', '', NULL, 'slide', 1, NULL, 2, '2021-10-14 15:50:34', '2021-10-14 21:22:20', NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

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

-- Volcando datos para la tabla db_margarita.sections_contents_types: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `sections_contents_types` DISABLE KEYS */;
INSERT INTO `sections_contents_types` (`section_id`, `type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '2021-09-17 15:44:41', '2021-09-17 15:44:41', NULL),
	(3, 1, '2021-09-19 11:10:18', '2021-09-19 11:10:18', NULL),
	(3, 2, '2021-09-19 11:10:18', '2021-09-19 11:10:18', NULL),
	(3, 3, '2021-09-19 11:10:18', '2021-09-19 11:10:18', NULL),
	(4, 1, '2021-09-19 11:11:19', '2021-09-19 11:11:19', NULL),
	(5, 4, '2021-09-19 11:12:08', '2021-09-19 11:12:08', NULL),
	(6, 1, '2021-09-19 11:12:59', '2021-09-19 11:12:59', NULL),
	(6, 2, '2021-09-19 11:12:59', '2021-09-19 11:12:59', NULL),
	(7, 5, '2021-09-19 11:13:47', '2021-09-19 11:13:47', NULL),
	(8, 7, '2021-09-19 11:14:35', '2021-09-19 11:14:35', NULL),
	(9, 6, '2021-09-19 11:14:51', '2021-09-19 11:14:51', NULL),
	(10, 9, '2021-10-14 20:50:34', '2021-10-14 20:50:34', NULL);
/*!40000 ALTER TABLE `sections_contents_types` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `subtopics` DISABLE KEYS */;
INSERT INTO `subtopics` (`id`, `name`, `description`, `url`, `order`, `design_icon_id`, `topic_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Tema 1', 'tema 1', NULL, 1, 2, 1, '2021-09-20 18:01:29', '2021-09-20 18:01:29', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.teachers: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`id`, `name`, `lastname`, `email`, `image`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'María', 'Moya', NULL, '/upload/teacher/16306025706131054a598a1-estudiante-1.jpg', 1, '2021-09-02 12:09:30', '2021-09-02 12:09:30', NULL),
	(2, 'Raul', 'Moya', NULL, '/upload/teacher/16306025886131055c2de50-estudiante-7.jpg', 1, '2021-09-02 12:09:48', '2021-09-02 12:09:48', NULL),
	(3, NULL, NULL, NULL, NULL, 1, '2021-10-29 12:15:24', '2021-10-29 12:15:24', NULL),
	(4, NULL, NULL, NULL, NULL, 1, '2021-10-29 12:16:00', '2021-10-29 12:16:00', NULL),
	(5, NULL, NULL, NULL, NULL, 1, '2021-10-29 12:18:33', '2021-10-29 12:18:33', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` (`id`, `nombre`, `codigo`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Tema belleza', 'stetic', 'plantilla con tienda de cursos', '2021-08-10 15:46:15', '2021-11-15 10:55:04', NULL),
	(2, 'Servicios', 'apzo', 'plantilla de servicios', '2021-08-10 15:46:15', '2021-11-15 10:55:20', NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.templates_views: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `templates_views` DISABLE KEYS */;
INSERT INTO `templates_views` (`id`, `nombre`, `view_twig`, `slug`, `index`, `template_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Principal', 'inicio.twig', NULL, 1, 1, '2021-08-12 10:19:31', '2021-08-12 17:38:17', NULL),
	(2, 'Ecomerce', 'cursos.twig', NULL, 2, 1, '2021-08-12 10:23:25', '2021-09-04 23:33:36', NULL),
	(3, 'Galeria', 'galeria.twig', NULL, 3, 1, '2021-08-12 10:23:42', '2021-09-04 23:33:39', NULL),
	(4, 'Contacto', 'contacto.twig', NULL, 4, 1, '2021-08-12 10:24:01', '2021-09-04 23:33:41', NULL),
	(7, 'Terminos y condiciones', 'terminos-condiciones.twig', 'terminos-y-condiciones', 5, 1, '2021-10-13 23:57:02', '2021-10-13 23:57:02', NULL),
	(8, 'Politicas y privacidad', 'politicas-privacidad.twig', 'politicas-de-privacidad', 6, 1, '2021-10-13 23:57:02', '2021-10-13 23:57:02', NULL),
	(9, 'Principal', 'home.twig', NULL, 1, 2, '2021-08-12 10:19:31', '2021-11-15 10:55:28', NULL),
	(10, 'Servicios', 'service.twig', 'servicios', 2, 2, '2021-08-12 10:19:31', '2021-11-15 11:29:42', NULL),
	(11, 'Nostros', 'us.twig', 'nosotros', 3, 2, '2021-08-12 10:19:31', '2021-11-15 11:29:59', NULL),
	(12, 'Portafolio', 'portfolio.twig', 'portafolio', 4, 2, '2021-08-12 10:19:31', '2021-11-15 11:29:59', NULL),
	(13, 'Contacto', 'contact.twig', 'contacto', 5, 2, '2021-08-12 10:19:31', '2021-11-15 11:29:59', NULL),
	(14, 'Blog', 'blog.twig', 'blog', 6, 2, '2021-08-12 10:19:31', '2021-11-15 11:29:59', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_margarita.topics: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` (`id`, `name`, `description`, `order`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'plan 1', '', 1, 1, '2021-09-20 18:01:05', '2021-09-20 18:01:05', NULL);
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
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
