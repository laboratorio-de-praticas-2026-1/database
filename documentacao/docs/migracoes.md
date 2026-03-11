# Histórico de Migrações

O Prisma gerencia as migrações do banco de dados na pasta `prisma/migrations/`. Cada migração possui um diretório com timestamp e nome descritivo, contendo o arquivo `migration.sql` com as alterações aplicadas.

Para aplicar todas as migrações em ordem:

```bash
npx prisma migrate deploy
```

---

## Migrações Aplicadas

### `20260304054421_init`

**Migração inicial de setup do Prisma.** Criou tabelas de exemplo geradas pelo template padrão. Essas tabelas foram descartadas em migrações posteriores.

??? note "SQL"

````sql
    -- CreateTable
    CREATE TABLE `User`(
       `id`INTEGER NOT NULL AUTO_INCREMENT,
       `email`VARCHAR(191) NOT NULL,
       `name`VARCHAR(191) NULL,
        UNIQUE INDEX`User_email_key`(`email`),
        PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable
    CREATE TABLE `Post` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `title` VARCHAR(191) NOT NULL,
        `content` TEXT NULL,
        `published` BOOLEAN NOT NULL DEFAULT false,
        `authorId` INTEGER NOT NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- AddForeignKey
    ALTER TABLE `Post` ADD CONSTRAINT `Post_authorId_fkey`
        FOREIGN KEY (`authorId`) REFERENCES `User`(`id`)
        ON DELETE RESTRICT ON UPDATE CASCADE;
    ```

---

### `20260304054545_user_mudanca_atributo`

**Ajuste de tipo** no campo `name` da tabela `User` (gerada pelo template).

??? note "SQL"
    ```sql
    -- AlterTable
    ALTER TABLE `User` MODIFY `name` VARCHAR(255) NULL;
    ```

---

### `20260304060003_setup_inicial`

**Setup inicial do projeto real.** Remove as tabelas de template (`User`, `Post`) e cria toda a estrutura de banco de dados do sistema Despachante Bortone, incluindo tabelas, ENUMs, índices e chaves estrangeiras.

Tabelas criadas: `banner`, `blog`, `empresa`, `faq`, `publicidade`, `servico`, `usuario`, `veiculo`, `solicitacao`, `documento_solicitacao`.

??? note "SQL"
```sql
    -- DropForeignKey
    ALTER TABLE `Post`DROP FOREIGN KEY`Post_authorId_fkey`;

    -- DropTable
    DROP TABLE `Post`;

    -- DropTable
    DROP TABLE `User`;

    -- CreateTable: banner
    CREATE TABLE `banner` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `url_imagem` VARCHAR(191) NULL,
        `descricao` VARCHAR(191) NULL,
        `ativo` BOOLEAN NOT NULL DEFAULT true,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: blog
    CREATE TABLE `blog` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `titulo` VARCHAR(150) NULL,
        `conteudo` TEXT NULL,
        `data_publicacao` DATE NULL,
        `url_imagem` VARCHAR(191) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: empresa
    CREATE TABLE `empresa` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nome_fantasia` VARCHAR(100) NULL,
        `cnpj` VARCHAR(20) NULL,
        `telefone` VARCHAR(20) NULL,
        `email` VARCHAR(100) NULL,
        `endereco` VARCHAR(255) NULL,
        `cidade` VARCHAR(100) NULL,
        `estado` VARCHAR(2) NULL,
        `site` VARCHAR(100) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: faq
    CREATE TABLE `faq` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `pergunta` TEXT NULL,
        `resposta` TEXT NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: publicidade
    CREATE TABLE `publicidade` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `titulo` VARCHAR(150) NULL,
        `conteudo` TEXT NULL,
        `url_imagem` VARCHAR(191) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: servico
    CREATE TABLE `servico` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nome` VARCHAR(100) NOT NULL,
        `descricao` TEXT NULL,
        `valor_base` DECIMAL(10, 2) NULL,
        `prazo_estimado_dias` INTEGER NULL,
        `ativo` BOOLEAN NOT NULL DEFAULT true,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: usuario
    CREATE TABLE `usuario` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nome` VARCHAR(100) NOT NULL,
        `email` VARCHAR(100) NOT NULL,
        `senha` VARCHAR(255) NOT NULL,
        `nivel` ENUM('cliente', 'administrador') NOT NULL DEFAULT 'cliente',
        `cpf_cnpj` VARCHAR(20) NULL,
        `celular` VARCHAR(20) NULL,
        `data_cadastro` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        UNIQUE INDEX `usuario_email_key`(`email`),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: veiculo
    CREATE TABLE `veiculo` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `usuario_id` INTEGER NOT NULL,
        `placa` VARCHAR(10) NOT NULL,
        `renavam` VARCHAR(20) NULL,
        `marca` VARCHAR(50) NULL,
        `modelo` VARCHAR(50) NULL,
        `ano_fabricacao` INTEGER NULL,
        `ano_modelo` INTEGER NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: solicitacao
    CREATE TABLE `solicitacao` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `usuario_id` INTEGER NOT NULL,
        `veiculo_id` INTEGER NOT NULL,
        `servico_id` INTEGER NOT NULL,
        `status` ENUM('recebido','aguardando_pagamento','aguardando_documento',
                      'em_andamento','concluido','cancelado') NOT NULL DEFAULT 'recebido',
        `observacao_cliente` TEXT NULL,
        `observacao_admin` TEXT NULL,
        `data_solicitacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        `data_conclusao` DATETIME(3) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- CreateTable: documento_solicitacao
    CREATE TABLE `documento_solicitacao` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `solicitacao_id` INTEGER NOT NULL,
        `nome_hash` VARCHAR(191) NULL,
        `tipo_documento` VARCHAR(100) NULL,
        `status_validacao` ENUM('pendente','aprovado','rejeitado') NOT NULL DEFAULT 'pendente',
        `data_upload` DATETIME(3) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    -- AddForeignKey
    ALTER TABLE `veiculo` ADD CONSTRAINT `veiculo_usuario_id_fkey`
        FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE;

    -- AddForeignKey
    ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_usuario_id_fkey`
        FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE;

    -- AddForeignKey
    ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_veiculo_id_fkey`
        FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE;

    -- AddForeignKey
    ALTER TABLE `solicitacao` ADD CONSTRAINT `solicitacao_servico_id_fkey`
        FOREIGN KEY (`servico_id`) REFERENCES `servico`(`id`)
        ON DELETE RESTRICT ON UPDATE CASCADE;

    -- AddForeignKey
    ALTER TABLE `documento_solicitacao` ADD CONSTRAINT `documento_solicitacao_solicitacao_id_fkey`
        FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE;
    ```

---

### `20260304060929_excluindo_tabela_empresa`

**Remoção temporária** da tabela `empresa` para recriação limpa na migração seguinte.

??? note "SQL"
    ```sql
    -- DropTable
    DROP TABLE `empresa`;
    ```

---

### `20260304061254_criar_tabela`

**Recriação** da tabela `empresa` com a estrutura final correta.

??? note "SQL"
    ```sql
    -- CreateTable
    CREATE TABLE `empresa` (
        `id` INTEGER NOT NULL AUTO_INCREMENT,
        `nome_fantasia` VARCHAR(100) NULL,
        `cnpj` VARCHAR(20) NULL,
        `telefone` VARCHAR(20) NULL,
        `email` VARCHAR(100) NULL,
        `endereco` VARCHAR(255) NULL,
        `cidade` VARCHAR(100) NULL,
        `estado` VARCHAR(2) NULL,
        `site` VARCHAR(100) NULL,
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

---

## Como Criar uma Nova Migração

Após alterar o `prisma/schema.prisma`, execute:

```bash
npx prisma migrate dev --name nome_descritivo_da_mudanca
````

Isso irá:

1. Comparar o schema atual com o banco de dados local.
2. Gerar o arquivo SQL da migração em `prisma/migrations/`.
3. Aplicar a migração no banco local.
4. Regenerar o Prisma Client.

!!! warning "Nunca edite arquivos de migração manualmente"
Editar arquivos `.sql` de migrações já aplicadas pode causar inconsistências entre o estado do banco e o histórico do Prisma. Se precisar corrigir uma migração, crie uma nova.
