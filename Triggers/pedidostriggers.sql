-- Criação do banco de dados caso não exista
CREATE DATABASE IF NOT EXISTS pedidostriggers;

-- Seleção do banco de dados recém-criado
USE pedidostriggers;

-- Criação das tabelas se não existirem
-- Tabela para armazenar informações de clientes
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(20)
);

-- Tabela para armazenar informações de produtos
CREATE TABLE IF NOT EXISTS produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    quantidade INT,
    valor DECIMAL(10, 2)
);

-- Tabela para armazenar informações de pedidos
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    status ENUM('pendente', 'entregue', 'cancelado') DEFAULT 'pendente', -- Definição do ENUM para o status do pedido
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Registro da data atual ao criar um pedido
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

DELIMITER;

-- Trigger para atualizar o estoque após a inserção de um pedido com status 'pendente'
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_pedido_update_pendente
AFTER UPDATE ON pedido FOR EACH ROW
BEGIN
    IF NEW.status = 'pendente' OR NEW.status = 'entregue' THEN
        UPDATE produto
        SET quantidade = CASE
            WHEN NEW.status = 'pendente' THEN quantidade - NEW.quantidade
            ELSE quantidade
        END
        WHERE id_produto = NEW.id_produto;
    END IF;
END;
//

-- Trigger para restituir o estoque se um pedido for cancelado
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_pedido_update_cancelado
AFTER UPDATE ON pedido FOR EACH ROW
BEGIN
    IF NEW.status = 'cancelado' THEN
        UPDATE produto
        SET quantidade = quantidade + OLD.quantidade
        WHERE id_produto = OLD.id_produto;
    END IF;
END;
//

-- Trigger para atualizar o estoque após a inserção de um novo pedido
DELIMITER //
CREATE TRIGGER after_pedido_insert
AFTER INSERT ON pedido FOR EACH ROW
BEGIN
    UPDATE produto
    SET quantidade = quantidade - NEW.quantidade
    WHERE id_produto = NEW.id_produto;
END;
//

DELIMITER;

-- Inserções de exemplo
INSERT INTO cliente (nome, email, telefone) VALUES ('João', 'joao@email.com', '123456789'), ('Maria', 'maria@email.com', '987654321');

INSERT INTO produto (nome, quantidade, valor) VALUES ('Camiseta', 50, 19.99), ('Calça Jeans', 80, 39.99);

INSERT INTO pedido (id_cliente, id_produto, quantidade, status) VALUES (1, 1, 5, 'pendente'), (2, 2, 3, 'pendente');
