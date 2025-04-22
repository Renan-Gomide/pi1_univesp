CREATE DATABASE IF NOT EXISTS pi;
USE pi;

-- Criação da tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,    
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
  id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cnpj VARCHAR(20) NOT NULL UNIQUE,  -- Garante que o CNPJ seja único
  telefone VARCHAR(50),
  email VARCHAR(255),
  endereco VARCHAR(255),
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de estoque
CREATE TABLE IF NOT EXISTS estoque (
  id_estoque INT AUTO_INCREMENT PRIMARY KEY,
  id_produto INT NOT NULL,
  id_fornecedor INT NOT NULL,
  quantidade INT NOT NULL CHECK (quantidade >= 0),  -- Garante que a quantidade seja igual ou maior que zero
  data_vencimento DATE NOT NULL,
  data_entrada DATETIME DEFAULT CURRENT_TIMESTAMP,
  preco_compra DECIMAL(10,2) CHECK (preco_compra >= 0),
  preco_venda DECIMAL(10,2) CHECK (preco_venda >= 0),    
  CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
    ON DELETE CASCADE ON UPDATE CASCADE
);
