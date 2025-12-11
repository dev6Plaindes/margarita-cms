-- Script para agregar los campos price, boolean y type_name a la tabla contents
-- Ejecutar este script para actualizar la estructura de la base de datos
USE `db_margarita`;
-- Agregar columna type_name (VARCHAR para texto)
ALTER TABLE `contents`
ADD COLUMN `type_name` VARCHAR(255) DEFAULT NULL
AFTER `boolean`;
-- Verificar que las columnas se agregaron correctamente
DESCRIBE `contents`;