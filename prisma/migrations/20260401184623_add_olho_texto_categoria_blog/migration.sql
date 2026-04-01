-- AlterTable
ALTER TABLE `blog` ADD COLUMN `categoria` ENUM('Documentacao', 'Debitos', 'Multas', 'Legislacao', 'Condutor') NULL,
    ADD COLUMN `olho_do_texto` VARCHAR(191) NULL;
