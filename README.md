# Terraform AWS DynamoDB Setup

Este repositório contém scripts Terraform para criar e gerenciar tabelas DynamoDB na AWS.

![image](https://github.com/soulsah/techchallenge_infra/assets/17282030/042e1fe3-0146-47cf-b270-ec3b70947d09)


## Estrutura do Projeto

- **Provider AWS**
  - Região: `sa-east-1`

## Tabelas DynamoDB

1. **Tabela: `tb_tipo_produto`**
   - Chave de Partição: `ID` (Número)
   - Índices Secundários:
     - `DescricaoIndex`: Chave `Descricao`

2. **Tabela: `tb_status_pedido`**
   - Chave de Partição: `ID` (Número)
   - Índices Secundários:
     - `DescricaoIndex`: Chave `Descricao`

3. **Tabela: `tb_cliente`**
   - Chave de Partição: `ID` (Número)
   - Índices Secundários:
     - `CPFIndex`: Chave `CPF`
     - `NomeIndex`: Chave `Nome`
     - `EmailIndex`: Chave `Email`

4. **Tabela: `tb_produto`**
   - Chave de Partição: `ID` (Número)
   - Índices Secundários:
     - `TipoIndex`: Chave `Tipo`
     - `DescricaoIndex`: Chave `Descricao`
     - `PrecoIndex`: Chave `Preco`

5. **Tabela: `tb_pedido`**
   - Chave de Partição: `ID` (Número)
   - Índices Secundários:
     - `ClienteIDIndex`: Chave `Cliente_ID`
     - `StatusIndex`: Chave `Status`

6. **Tabela: `tb_itens_pedido`**
   - Chave de Partição: `Pedido_ID` (Número)
   - Chave de Ordenação: `Produto` (Número)
   - Índices Secundários:
     - `QuantidadeIndex`: Chave `Quantidade`

7. **Tabela: `tb_fila_pedidos`**
   - Chave de Partição: `Pedido_ID` (Número)
   - Índices Secundários:
     - `ClienteIDIndex`: Chave `Cliente_ID`
     - `StatusIndex`: Chave `Status`
     - `CriadoIndex`: Chave `criado`

8. **Tabela: `tb_cartao`**
   - Chave de Partição: `id` (Número)
   - Índices Secundários:
     - `NumeroCartaoIndex`: Chave `numero_cartao`
     - `DetentorCartaoIndex`: Chave `detentor_cartao`
     - `DataExpiracaoIndex`: Chave `data_expiracao`
     - `CVVIndex`: Chave `cvv`
     - `ClienteIDIndex`: Chave `cliente_id`

9. **Tabela: `tb_pagamento`**
   - Chave de Partição: `id` (Número)
   - Índices Secundários:
     - `ValorIndex`: Chave `valor`
     - `StatusIndex`: Chave `status`
     - `CardIDIndex`: Chave `card_id`
     - `PedidoIDIndex`: Chave `pedidoId`

## Como Usar

1. **Clone o Repositório:**
   ```bash
   git clone https://github.com/soulsah/techchallenge_infra.git
  
2. **Inicialize o Terraform:**
  ```bash
  terraform init
  ```
3. **Aplique as configurações:**
  ```bash
  terraform apply
