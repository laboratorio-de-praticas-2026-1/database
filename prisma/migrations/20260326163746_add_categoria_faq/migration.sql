-- AlterTable
ALTER TABLE `faq` ADD COLUMN `categoria` ENUM('documentacao', 'regularizacao', 'manutencao', 'outros', 'frequentes') NULL;
