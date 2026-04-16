-- CreateTable
CREATE TABLE `relatorio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` TEXT NULL,
    `categoria` ENUM('relatorio_completo', 'performance_financeira', 'desempenho_operacional', 'performance_servicos', 'gestao_solicitacoes', 'gestao_documentos', 'gestao_veiculos', 'base_clientes', 'analise_eficiencia', 'funil_conversao', 'gargalos_operacionais') NOT NULL DEFAULT 'relatorio_completo',
    `url_documento_hash` VARCHAR(255) NOT NULL,
    `data_geracao` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
