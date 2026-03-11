# Despachante Bortone — Banco de Dados

Bem-vindo à documentação do banco de dados do sistema **Despachante Bortone**. Este portal concentra todas as informações técnicas sobre a modelagem, configuração e uso do banco de dados do projeto.

> **Projeto Acadêmico** — Desenvolvido pela turma da FATEC Registro para o Laboratório de Práticas 2026-1.
>
> Repositório: [laboratorio-de-praticas-2026-1/database](https://github.com/laboratorio-de-praticas-2026-1/database)

---

## 🚀 Início Rápido

### Para Desenvolvedores

- 🗄️ [**Modelagem do Banco de Dados**](modelagem.md) - ⭐ **Tabelas, ENUMs, relacionamentos e diagrama**
- ⚙️ [**Configuração do Ambiente**](configuracao.md) - Docker, variáveis de ambiente, Prisma e seed
- 📋 [**Histórico de Migrações**](migracoes.md) - Todas as alterações aplicadas no schema

### Para novos membros do time

- 🌱 [**Dados Iniciais (Seed)**](seed.md) - Dados de exemplo para popular o banco em desenvolvimento

---

## 📚 Documentação por Área

### 🗄️ Banco de Dados

O banco de dados suporta uma aplicação web de um **escritório de despachante**, onde clientes solicitam serviços de documentação veicular (licenciamento, transferência de propriedade, renovação de CNH etc.).

- **[Modelagem do Banco de Dados](modelagem.md)** - ⭐ **Estrutura completa: tabelas, ENUMs e relacionamentos**
- **[Configuração do Ambiente](configuracao.md)** - Setup do Docker, Prisma e variáveis de ambiente
- **[Dados Iniciais (Seed)](seed.md)** - Registros de exemplo para desenvolvimento e testes
- **[Histórico de Migrações](migracoes.md)** - Evolução do schema com o SQL de cada migração

### 🔧 Tecnologias Utilizadas

| Tecnologia                  | Versão | Função                             |
| --------------------------- | ------ | ---------------------------------- |
| **MySQL**                   | 8.0    | SGBD principal (container Docker)  |
| **Prisma**                  | 7.x    | ORM e gerenciamento de migrações   |
| **@prisma/adapter-mariadb** | 7.x    | Adapter de conexão MariaDB/MySQL   |
| **TypeScript**              | 5.x    | Linguagem do schema e seed         |
| **Docker Compose**          | —      | Orquestração do container do banco |

---

## 🛠️ Configuração do Ambiente

### Executar a Documentação Localmente

1. **Instalar dependências do MkDocs:**

   ```bash
   pip install mkdocs mkdocs-material
   ```

2. **Navegar para a pasta de documentação:**

   ```bash
   cd documentacao/
   ```

3. **Executar o servidor local:**

   ```bash
   mkdocs serve
   ```

4. **Acessar no navegador:**
   ```bash
   http://127.0.0.1:8000
   ```

### Estrutura da Documentação

```
documentacao/
├── docs/
│   ├── assets/          # Imagens e recursos estáticos
│   ├── stylesheets/     # Estilos customizados (CSS)
│   ├── index.md         # Esta página
│   ├── configuracao.md  # Setup do ambiente
│   ├── modelagem.md     # Modelagem do banco de dados
│   ├── seed.md          # Dados iniciais
│   └── migracoes.md     # Histórico de migrações
└── mkdocs.yml           # Configuração da navegação
```

---

## 🤝 Contribuindo

Encontrou algo desatualizado ou quer contribuir com a documentação?

1. Abra uma **issue** descrevendo o problema ou melhoria
2. Crie um **Pull Request** com suas alterações na branch adequada
3. Após o merge, rode `mkdocs gh-deploy` para atualizar o site

---

## 📋 Status da Documentação

| Seção                       | Status      | Última Atualização |
| --------------------------- | ----------- | ------------------ |
| Modelagem do Banco de Dados | ✅ Completo | Mar 2026           |
| Configuração do Ambiente    | ✅ Completo | Mar 2026           |
| Dados Iniciais (Seed)       | ✅ Completo | Mar 2026           |
| Histórico de Migrações      | ✅ Completo | Mar 2026           |

---

_Para dúvidas específicas, consulte a documentação correspondente ou abra uma issue no repositório._
