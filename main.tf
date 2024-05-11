provider "aws" {
  region = "sa-east-1"
}

resource "aws_dynamodb_table" "tipo_produto" {
  name         = "tb_tipo_produto"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  
  attribute {
    name = "ID"
    type = "N"
  }
  attribute {
    name = "Descricao"
    type = "S"
  }

  global_secondary_index {
    name            = "DescricaoIndex"
    hash_key        = "Descricao"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "status_pedido" {
  name         = "tb_status_pedido"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  
  attribute {
    name = "ID"
    type = "N"
  }
  attribute {
    name = "Descricao"
    type = "S"
  }

  global_secondary_index {
    name            = "DescricaoIndex"
    hash_key        = "Descricao"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "cliente" {
  name         = "tb_cliente"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  
  attribute {
    name = "ID"
    type = "N"
  }
  attribute {
    name = "CPF"
    type = "S"
  }
  attribute {
    name = "Nome"
    type = "S"
  }
  attribute {
    name = "Email"
    type = "S"
  }

  global_secondary_index {
    name            = "CPFIndex"
    hash_key        = "CPF"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "NomeIndex"
    hash_key        = "Nome"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "EmailIndex"
    hash_key        = "Email"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "produto" {
  name         = "tb_produto"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  
  attribute {
    name = "ID"
    type = "N"
  }
  attribute {
    name = "Tipo"
    type = "N"
  }
  attribute {
    name = "Descricao"
    type = "S"
  }
  attribute {
    name = "Preco"
    type = "N"
  }

  global_secondary_index {
    name            = "TipoIndex"
    hash_key        = "Tipo"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "DescricaoIndex"
    hash_key        = "Descricao"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "PrecoIndex"
    hash_key        = "Preco"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "pedido" {
  name         = "tb_pedido"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  
  attribute {
    name = "ID"
    type = "N"
  }
  attribute {
    name = "Cliente_ID"
    type = "N"
  }
  attribute {
    name = "Status"
    type = "N"
  }

  global_secondary_index {
    name            = "ClienteIDIndex"
    hash_key        = "Cliente_ID"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "StatusIndex"
    hash_key        = "Status"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "itens_pedido" {
  name         = "tb_itens_pedido"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Pedido_ID"
  range_key    = "Produto"
  
  attribute {
    name = "Pedido_ID"
    type = "N"
  }
  attribute {
    name = "Produto"
    type = "N"
  }
  attribute {
    name = "Quantidade"
    type = "N"
  }

  global_secondary_index {
    name            = "QuantidadeIndex"
    hash_key        = "Quantidade"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "fila_pedidos" {
  name         = "tb_fila_pedidos"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Pedido_ID"
  
  attribute {
    name = "Pedido_ID"
    type = "N"
  }
  attribute {
    name = "Cliente_ID"
    type = "N"
  }
  attribute {
    name = "Status"
    type = "N"
  }
  attribute {
    name = "criado"
    type = "S"
  }

  global_secondary_index {
    name            = "ClienteIDIndex"
    hash_key        = "Cliente_ID"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "StatusIndex"
    hash_key        = "Status"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "CriadoIndex"
    hash_key        = "criado"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "cartao" {
  name         = "tb_cartao"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  
  attribute {
    name = "id"
    type = "N"
  }
  attribute {
    name = "numero_cartao"
    type = "S"
  }
  attribute {
    name = "detentor_cartao"
    type = "S"
  }
  attribute {
    name = "data_expiracao"
    type = "S"
  }
  attribute {
    name = "cvv"
    type = "S"
  }
  attribute {
    name = "cliente_id"
    type = "N"
  }

  global_secondary_index {
    name            = "NumeroCartaoIndex"
    hash_key        = "numero_cartao"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "DetentorCartaoIndex"
    hash_key        = "detentor_cartao"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "DataExpiracaoIndex"
    hash_key        = "data_expiracao"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "CVVIndex"
    hash_key        = "cvv"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "ClienteIDIndex"
    hash_key        = "cliente_id"
    projection_type = "ALL"
  }
}

resource "aws_dynamodb_table" "pagamento" {
  name         = "tb_pagamento"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  
  attribute {
    name = "id"
    type = "N"
  }
  attribute {
    name = "valor"
    type = "N"
  }
  attribute {
    name = "status"
    type = "S"
  }
  attribute {
    name = "card_id"
    type = "N"
  }
  attribute {
    name = "pedidoId"
    type = "N"
  }

  global_secondary_index {
    name            = "ValorIndex"
    hash_key        = "valor"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "StatusIndex"
    hash_key        = "status"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "CardIDIndex"
    hash_key        = "card_id"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "PedidoIDIndex"
    hash_key        = "pedidoId"
    projection_type = "ALL"
  }
}
