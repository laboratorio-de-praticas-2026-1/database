/*
  Warnings:

  - Added the required column `solicitacao_id` to the `debito` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `debito` ADD COLUMN `solicitacao_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `debito` ADD CONSTRAINT `debito_solicitacao_id_fkey` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
