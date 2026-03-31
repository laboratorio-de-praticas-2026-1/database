/*
  Warnings:

  - A unique constraint covering the columns `[id_debito]` on the table `debito_servico` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_debito]` on the table `debito_veiculo` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_pagamento,numero_parcela]` on the table `parcela` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `pagamento` MODIFY `taxa` DECIMAL(10, 2) NOT NULL DEFAULT 0;

-- CreateIndex
CREATE UNIQUE INDEX `debito_servico_id_debito_key` ON `debito_servico`(`id_debito`);

-- CreateIndex
CREATE UNIQUE INDEX `debito_veiculo_id_debito_key` ON `debito_veiculo`(`id_debito`);

-- CreateIndex
CREATE UNIQUE INDEX `parcela_id_pagamento_numero_parcela_key` ON `parcela`(`id_pagamento`, `numero_parcela`);
