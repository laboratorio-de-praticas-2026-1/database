# 🚀 Como Visualizar a Documentação

## Opção 1 — Localmente com MkDocs (Recomendado)

### Passo 1: Instalar o MkDocs e o tema Material

```bash
pip install mkdocs mkdocs-material
```

### Passo 2: Navegar até a pasta de documentação

```bash
cd documentacao/
```

### Passo 3: Iniciar o servidor local

```bash
mkdocs serve
```

### Passo 4: Acessar no navegador

```
http://127.0.0.1:8000
```

---

## Opção 2 — Deploy com GitHub Pages

Para publicar a documentação online via GitHub Pages:

```bash
cd documentacao/
mkdocs gh-deploy
```

A documentação ficará disponível em:

```
https://laboratorio-de-praticas-2026-1.github.io/database/
```

---

## Opção 3 — Build estático

Para gerar os arquivos HTML estáticos (ex.: para hospedar no Netlify/Vercel):

```bash
cd documentacao/
mkdocs build
```

Os arquivos serão gerados na pasta `documentacao/site/`.

| Plataforma | Build command  | Publish directory   |
| ---------- | -------------- | ------------------- |
| Netlify    | `mkdocs build` | `documentacao/site` |
| Vercel     | `mkdocs build` | `documentacao/site` |
