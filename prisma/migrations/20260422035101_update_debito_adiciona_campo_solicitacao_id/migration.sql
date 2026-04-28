-- AlterTable
ALTER TABLE `debito` ADD COLUMN `solicitacao_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `debito` ADD CONSTRAINT `debito_solicitacao_id_fkey` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
