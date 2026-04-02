/*
  Warnings:

  - Made the column `categoria` on table `blog` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `blog` MODIFY `categoria` ENUM('Documentacao', 'Debitos', 'Multas', 'Legislacao', 'Condutor') NOT NULL DEFAULT 'Documentacao';
