# Dados Iniciais (Seed)

O arquivo `prisma/seed.ts` popula o banco de dados com dados de exemplo para desenvolvimento e testes. Execute-o com:

```bash
npx prisma db seed
```

!!! info "Idempotência"
O seed usa `upsert` em todos os registros, portanto pode ser executado múltiplas vezes sem duplicar dados.

---

## Empresa

Cadastrada uma única empresa com os dados do escritório:

| Campo           | Valor               |
| --------------- | ------------------- |
| Nome Fantasia   | Despachante Bortone |
| CNPJ            | 12.345.678/0001-99  |
| Telefone        | (11) 3333-4444      |
| E-mail          | contato@bortone.com |
| Endereço        | Av. Paulista, 1000  |
| Cidade / Estado | São Paulo / SP      |
| Site            | www.bortone.com     |

---

## Usuários

10 usuários cadastrados (2 administradores e 8 clientes):

| ID  | Nome           | E-mail               | Nível           |
| --- | -------------- | -------------------- | --------------- |
| 1   | Ana Martins    | ana@bortone.com      | `administrador` |
| 2   | Bruno Costa    | bruno@bortone.com    | `cliente`       |
| 3   | Carla Souza    | carla@bortone.com    | `cliente`       |
| 4   | Daniel Lima    | daniel@bortone.com   | `cliente`       |
| 5   | Eduardo Rocha  | eduardo@bortone.com  | `cliente`       |
| 6   | Fernanda Alves | fernanda@bortone.com | `cliente`       |
| 7   | Gabriel Pinto  | gabriel@bortone.com  | `cliente`       |
| 8   | Helena Dias    | helena@bortone.com   | `cliente`       |
| 9   | Igor Mendes    | igor@bortone.com     | `cliente`       |
| 10  | Juliana Melo   | juliana@bortone.com  | `administrador` |

!!! warning "Senhas no Seed"
As senhas dos usuários no seed estão em **texto puro** (`senha_segura_123`). Em um ambiente real, as senhas devem ser hashadas antes da inserção. O seed é apenas para fins de desenvolvimento.

---

## Serviços

10 serviços cadastrados no catálogo:

| ID  | Nome                         | Valor Base | Prazo (dias) |
| --- | ---------------------------- | ---------- | ------------ |
| 1   | Licenciamento Anual          | R$ 180,00  | 2            |
| 2   | Transferência de Propriedade | R$ 350,00  | 5            |
| 3   | Primeiro Emplacamento        | R$ 420,00  | 7            |
| 4   | Renovação CNH                | R$ 200,00  | 10           |
| 5   | Baixa de Gravame             | R$ 190,00  | 3            |
| 6   | Recurso de Multa             | R$ 250,00  | 15           |
| 7   | 2ª Via CRLV                  | R$ 120,00  | 2            |
| 8   | Mudança de Categoria CNH     | R$ 600,00  | 30           |
| 9   | Comunicação de Venda         | R$ 150,00  | 1            |
| 10  | Parcelamento de Débitos      | R$ 90,00   | 1            |

---

## Banners

3 banners ativos cadastrados:

| ID  | Descrição                        |
| --- | -------------------------------- |
| 1   | Renove sua CNH sem sair de casa  |
| 2   | Licenciamento 2026 já disponível |
| 3   | Transferência rápida e segura    |

---

## FAQs

5 perguntas frequentes cadastradas:

| ID  | Pergunta                                             |
| --- | ---------------------------------------------------- |
| 1   | Quais documentos são necessários para transferência? |
| 2   | Posso parcelar o IPVA?                               |
| 3   | Quanto tempo demora o licenciamento?                 |
| 4   | É possível recorrer de multa online?                 |
| 5   | Preciso agendar para atendimento presencial?         |

---

## Blog

3 posts cadastrados:

| ID  | Título                                   | Data de Publicação |
| --- | ---------------------------------------- | ------------------ |
| 1   | Calendário IPVA 2026                     | 10/01/2026         |
| 2   | Como recorrer de uma multa de trânsito   | 15/01/2026         |
| 3   | Documentos para transferência de veículo | 20/01/2026         |

---

## Publicidades

3 anúncios de parceiros cadastrados:

| ID  | Título                     |
| --- | -------------------------- |
| 1   | Seguro Auto Completo       |
| 2   | Vistoria Cautelar Premium  |
| 3   | Clínica Médica Credenciada |

---

## Veículos

5 veículos cadastrados (vinculados a clientes):

| ID  | Proprietário         | Placa   | Marca     | Modelo   | Ano Fab. | Ano Mod. |
| --- | -------------------- | ------- | --------- | -------- | -------- | -------- |
| 1   | Bruno Costa (ID 2)   | ABC1A23 | Honda     | Civic    | 2020     | 2020     |
| 2   | Carla Souza (ID 3)   | DEF2B34 | Toyota    | Corolla  | 2019     | 2020     |
| 3   | Daniel Lima (ID 4)   | GHI3C45 | Chevrolet | Onix     | 2022     | 2023     |
| 4   | Eduardo Rocha (ID 5) | JKL4D56 | Hyundai   | HB20     | 2021     | 2022     |
| 5   | Bruno Costa (ID 2)   | YZA9I12 | Jeep      | Renegade | 2021     | 2022     |

---

## Solicitações

Solicitações de serviço com variados status para cobrir todos os cenários:

| ID  | Cliente       | Veículo     | Serviço                      | Status                 |
| --- | ------------- | ----------- | ---------------------------- | ---------------------- |
| 1   | Bruno Costa   | Civic (1)   | Licenciamento Anual          | `em_andamento`         |
| 2   | Carla Souza   | Corolla (2) | Transferência de Propriedade | `recebido`             |
| 3   | Daniel Lima   | Onix (3)    | Primeiro Emplacamento        | `aguardando_documento` |
| 4   | Eduardo Rocha | HB20 (4)    | Renovação CNH                | `concluido`            |
| ... | ...           | ...         | ...                          | ...                    |

!!! tip "Objetivo do Seed de Solicitações"
As solicitações são criadas com diferentes status para permitir que o frontend e a equipe de desenvolvimento testem todas as telas do fluxo sem precisar simular transições manualmente.
