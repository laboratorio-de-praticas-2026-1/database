/*
  Warnings:

  - You are about to alter the column `categoria_blog` on the `interacao_usuario` table. The data in that column could be lost. The data in that column will be cast from `VarChar(50)` to `Enum(EnumId(10))`.

*/
-- AlterTable
ALTER TABLE `interacao_usuario` MODIFY `categoria_blog` ENUM('Documentacao', 'Debitos', 'Multas', 'Legislacao', 'Condutor') NOT NULL;
