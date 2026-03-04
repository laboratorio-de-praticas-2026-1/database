# Guia de Modificação do Banco de Dados com Migrations

## Informações sobre o Banco

### 1. Versão do banco:
- O banco de dados local (feito via docker compose) roda na engine `mysql:8.0`
- O banco de dados de desenvolvimento (hospedado no AwaysData) roda na engine `mariadb:10.11`

### 2. Gerenciamento do banco:
- O gerenciamento do banco é feito usando `migrations` (que funciona como um versionamento). As migrations são criadas usando o `PrismaORM`

## Fluxo de Processo

### 1. Setup Inicial

```bash
# Clone o projeto
git clone https://github.com/laboratorio-de-praticas-2026-1/database.git
cd <project-directory>

# Inicie os serviços
docker-compose -f compose.yml up -d

# Configure variáveis de ambiente
cp .env.example .env
# ou configure manualmente com conexão local
```

### 2. Modificar Schema

Edite `schema.prisma` conforme necessário:

```prisma
model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String
  // nova coluna:
  cpf   String  @unique
}
```

### 3. Gerar Migration

```bash
npx prisma migrate dev --create-only
```

**Analise** os arquivos `.sql` gerados em `prisma/migrations/` antes de executar.

### 4. Executar Migration Local

```bash
npx prisma migrate dev
```

Teste e valide que nenhuma funcionalidade foi quebrada.

### 5. Submeter para Revisão

- Abra um PR para `develop`
- Após merge, a pipeline automática executa:
  ```bash
  npx prisma migrate deploy
  ```
  no ambiente de desenvolvimento

### 6. Deploy para Produção

Após merge em `main`, a mesma migration é automaticamente executada no ambiente de produção.
