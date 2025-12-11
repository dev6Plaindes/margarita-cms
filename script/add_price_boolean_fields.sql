-- Script para agregar campos price y boolean a la tabla contents
-- Fecha: 2025-10-20
-- Descripción: Agrega los campos price (decimal) y boolean (tinyint) a la tabla contents
ALTER TABLE `contents`
ADD COLUMN `price` DECIMAL(10, 2) DEFAULT 0.00
AFTER `description`,
    ADD COLUMN `boolean` TINYINT(1) DEFAULT 0
AFTER `price`;
-- Verificar que las columnas se agregaron correctamente
DESCRIBE `contents`;