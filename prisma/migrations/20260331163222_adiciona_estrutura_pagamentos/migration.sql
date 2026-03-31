-- CreateTable
CREATE TABLE `debito` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` ENUM('servico', 'veiculo') NOT NULL,
    `descricao` TEXT NULL,
    `valor` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('pago', 'pendente') NOT NULL DEFAULT 'pendente',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `debito_servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_debito` INTEGER NOT NULL,
    `id_servico` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `debito_veiculo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_debito` INTEGER NOT NULL,
    `id_veiculo` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pagamento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_debito` INTEGER NOT NULL,
    `valor_total` DECIMAL(10, 2) NOT NULL,
    `qtd_parcelas` INTEGER NOT NULL,
    `tipo_pagamento` ENUM('avista', 'parcelado') NOT NULL,
    `metodo_pagamento` VARCHAR(100) NOT NULL,
    `taxa` DECIMAL(10, 2) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `pagamento_id_debito_key`(`id_debito`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `parcela` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pagamento` INTEGER NOT NULL,
    `valor` DECIMAL(10, 2) NOT NULL,
    `numero_parcela` INTEGER NOT NULL,
    `status` ENUM('pago', 'atrasado', 'ativo') NOT NULL DEFAULT 'ativo',
    `vencimento` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `debito_servico` ADD CONSTRAINT `debito_servico_id_debito_fkey` FOREIGN KEY (`id_debito`) REFERENCES `debito`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `debito_servico` ADD CONSTRAINT `debito_servico_id_servico_fkey` FOREIGN KEY (`id_servico`) REFERENCES `servico`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `debito_veiculo` ADD CONSTRAINT `debito_veiculo_id_debito_fkey` FOREIGN KEY (`id_debito`) REFERENCES `debito`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `debito_veiculo` ADD CONSTRAINT `debito_veiculo_id_veiculo_fkey` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_id_debito_fkey` FOREIGN KEY (`id_debito`) REFERENCES `debito`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `parcela` ADD CONSTRAINT `parcela_id_pagamento_fkey` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
