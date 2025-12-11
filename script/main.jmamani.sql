
ALTER TABLE companies ADD COLUMN `vision` TEXT NULL DEFAULT NULL AFTER `privacy_policies`;
ALTER TABLE companies ADD COLUMN `mision` TEXT NULL DEFAULT NULL AFTER `privacy_policies`;

/*******/
ALTER TABLE contents ADD COLUMN `order` INT(11) NULL DEFAULT '0' AFTER `color`;
