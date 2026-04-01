```mermaid
erDiagram
    Banner {
        int id PK
        string url_imagem
        string descricao
        bool ativo
    }
    Blog {
        int id PK
        string titulo
        string conteudo
        date data_publicacao
        string url_imagem
        bool ativo
    }
    Empresa {
        int id PK
        string nome_fantasia
        TipoEmpresa tipo
        string cnpj
        string telefone
        string email
        string endereco
        string cidade
        string estado
        string latitude
        string longitude
        string site
    }
    Faq {
        int id PK
        string pergunta
        string resposta
        bool status
        CategoriaFaq categoria
    }
    Publicidade {
        int id PK
        string titulo
        string conteudo
        string url_imagem
        bool ativo
    }
    Usuario {
        int id PK
        string nome
        string email UK
        string senha
        NivelUsuario nivel
        string cpf_cnpj
        string celular
        datetime data_cadastro
    }
    Veiculo {
        int id PK
        int usuario_id FK
        string placa
        string renavam
        string marca
        string modelo
        int ano_fabricacao
        int ano_modelo
    }
    Solicitacao {
        int id PK
        int usuario_id FK
        int veiculo_id FK
        int servico_id FK
        StatusSolicitacao status
        string observacao_cliente
        string observacao_admin
        datetime data_solicitacao
        datetime data_conclusao
    }
    Servico {
        int id PK
        string nome
        string descricao
        decimal valor_base
        int prazo_estimado_dias
        bool ativo
    }
    DocumentoSolicitacao {
        int id PK
        int solicitacao_id FK
        string nome_hash
        string tipo_documento
        StatusValidacaoDocumento status_validacao
        datetime data_upload
    }
    emails_enviados {
        int id PK
        string nome_usuario
        string email_usuario
        string assunto
        string texto_digitado
        datetime data_envio
    }
    Debito {
        int id PK
        TipoDebito tipo
        string descricao
        decimal valor
        StatusDebito status
        datetime created_at
    }
    DebitoServico {
        int id PK
        int id_debito FK, UK
        int id_servico FK
    }
    DebitoVeiculo {
        int id PK
        int id_debito FK, UK
        int id_veiculo FK
    }
    Pagamento {
        int id PK
        int id_debito FK, UK
        decimal valor_total
        int qtd_parcelas
        TipoPagamento tipo_pagamento
        string metodo_pagamento
        decimal taxa
        datetime created_at
    }
    Parcela {
        int id PK
        int id_pagamento FK
        decimal valor
        int numero_parcela
        StatusParcela status
        date vencimento
    }

    NivelUsuario {
        string cliente
        string administrador
    }
    StatusSolicitacao {
        string recebido
        string aguardando_pagamento
        string aguardando_documento
        string em_andamento
        string concluido
        string cancelado
    }
    StatusValidacaoDocumento {
        string pendente
        string aprovado
        string rejeitado
    }
    TipoEmpresa {
        string clinica
        string vistoria
        string detran
    }
    CategoriaFaq {
        string documentacao
        string regularizacao
        string manutencao
        string outros
        string frequentes
    }
    TipoDebito {
        string servico
        string veiculo
    }
    StatusDebito {
        string pago
        string pendente
    }
    TipoPagamento {
        string avista
        string parcelado
    }
    StatusParcela {
        string pago
        string atrasado
        string ativo
    }

    Usuario ||--o{ Veiculo : "possui"
    Usuario ||--o{ Solicitacao : "abre"
    Veiculo ||--o{ Solicitacao : "referenciado em"
    Servico ||--o{ Solicitacao : "solicitado em"
    Solicitacao ||--o{ DocumentoSolicitacao : "tem"
    Debito ||--o| DebitoServico : "associado a"
    Debito ||--o| DebitoVeiculo : "associado a"
    Servico ||--o{ DebitoServico : "vinculado em"
    Veiculo ||--o{ DebitoVeiculo : "vinculado em"
    Debito ||--o| Pagamento : "pago via"
    Pagamento ||--o{ Parcela : "dividido em"

    Usuario }o--|| NivelUsuario : "nivel"
    Solicitacao }o--|| StatusSolicitacao : "status"
    DocumentoSolicitacao }o--|| StatusValidacaoDocumento : "statusValidacao"
    Empresa }o--|| TipoEmpresa : "tipo"
    Faq }o--|| CategoriaFaq : "categoria"
    Debito }o--|| TipoDebito : "tipo"
    Debito }o--|| StatusDebito : "status"
    Pagamento }o--|| TipoPagamento : "tipoPagamento"
    Parcela }o--|| StatusParcela : "status"
```
