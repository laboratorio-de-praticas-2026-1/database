# Configuração do Ambiente

Este guia descreve como configurar e iniciar o ambiente de desenvolvimento local do banco de dados.

---

## Pré-requisitos

- [Docker](https://www.docker.com/) e Docker Compose instalados
- [Node.js](https://nodejs.org/) (v18 ou superior)
- [npm](https://www.npmjs.com/) ou outro gerenciador de pacotes
- Python 3 (apenas para visualizar esta documentação com MkDocs)

---

## 1. Clonar o Repositório

```bash
git clone https://github.com/laboratorio-de-praticas-2026-1/database.git
cd database
```

---

## 2. Configurar Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto com a URL de conexão do banco:

```env
DATABASE_URL="mysql://app_user:app_password@localhost:3306/app_db"
```

!!! warning "Atenção"
O arquivo `.env` **não deve ser commitado** no repositório. Ele já está listado no `.gitignore`.

### Variáveis de Ambiente do Docker

O arquivo `compose.yml` utiliza as seguintes credenciais padrão para o container MySQL:

| Variável              | Valor          |
| --------------------- | -------------- |
| `MYSQL_ROOT_PASSWORD` | `rootpassword` |
| `MYSQL_DATABASE`      | `app_db`       |
| `MYSQL_USER`          | `app_user`     |
| `MYSQL_PASSWORD`      | `app_password` |
| Porta exposta         | `3306`         |

---

## 3. Subir o Container do Banco de Dados

```bash
docker compose up -d
```

Isso irá subir o container `mysql-dev` com MySQL 8.0. O volume `mysql_data` é persistente — os dados são mantidos entre reinicializações.

Para verificar se o container está rodando:

```bash
docker compose ps
```

Para parar o container:

```bash
docker compose down
```

Para parar e **remover os dados** (apagar o volume):

```bash
docker compose down -v
```

---

## 4. Instalar Dependências

```bash
npm install
```

---

## 5. Aplicar as Migrações

Com o container rodando, aplique as migrações para criar as tabelas no banco:

```bash
npx prisma migrate deploy
```

!!! note "Ambientes de desenvolvimento"
Em desenvolvimento, você pode usar `npx prisma migrate dev` para criar novas migrações interativamente.

---

## 6. Popular o Banco com Dados Iniciais (Seed)

```bash
npx prisma db seed
```

Esse comando executa o arquivo `prisma/seed.ts` e insere dados de exemplo em todas as tabelas. Veja mais detalhes em [Dados Iniciais (Seed)](seed.md).

---

## 7. Explorar o Banco com Prisma Studio

O Prisma Studio oferece uma interface visual para navegar e editar os dados:

```bash
npx prisma studio
```

Acesse em: **http://localhost:5555**

---

## Resumo dos Comandos

| Comando                     | Descrição                            |
| --------------------------- | ------------------------------------ |
| `docker compose up -d`      | Sobe o container MySQL em background |
| `docker compose down`       | Para o container                     |
| `docker compose down -v`    | Para o container e apaga os dados    |
| `npm install`               | Instala as dependências do projeto   |
| `npx prisma migrate deploy` | Aplica as migrações no banco         |
| `npx prisma migrate dev`    | Cria nova migração (desenvolvimento) |
| `npx prisma db seed`        | Popula o banco com dados iniciais    |
| `npx prisma studio`         | Abre o painel visual do Prisma       |
| `npx prisma generate`       | Gera o Prisma Client                 |

---

## Estrutura do `compose.yml`

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql-dev
    restart: unless-stopped
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: app_db
      MYSQL_USER: app_user
      MYSQL_PASSWORD: app_password
    volumes:
      - mysql_data:/var/lib/mysql
    command: --default-authentication-plugin=mysql_native_password

volumes:
  mysql_data:
```

---

## Estrutura do `prisma.config.ts`

O Prisma é configurado para usar o **adapter MariaDB**, compatível com MySQL 8.0:

```ts
generator client {
  provider = "prisma-client"
  output   = "../generated/prisma"
}

datasource db {
  provider = "mysql"
}
```

!!! info "Adapter MariaDB"
O projeto usa `@prisma/adapter-mariadb` para a conexão. Ao instanciar o `PrismaClient`, o adapter substitui o prefixo `mysql://` por `mariadb://` internamente.
