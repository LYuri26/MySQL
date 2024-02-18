-- Criar o banco de dados se não existir e selecioná-lo
CREATE DATABASE IF NOT EXISTS exemplo_db;
USE exemplo_db;

-- Criar tabela de usuários se não existir
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(100),
    data_criacao DATE
);

-- Inserir dados na tabela de usuários
INSERT INTO usuarios (nome, email, data_criacao)
VALUES
    ('João', 'joao@example.com', '2024-02-18'),
    ('Maria', 'maria@example.com', '2024-02-17'),
    ('Pedro', 'pedro@example.com', '2024-02-16');

-- Selecionar todos os usuários
SELECT * FROM usuarios;

-- Atualizar o email do usuário com id igual a 1
UPDATE usuarios
SET email = 'joao_novo@example.com'
WHERE id = 1;

-- Excluir o usuário com id igual a 2
DELETE FROM usuarios
WHERE id = 2;

-- Selecionar usuários criados após '2024-02-16'
SELECT * FROM usuarios
WHERE data_criacao > '2024-02-16';

-- Inserir um novo usuário
INSERT INTO usuarios (nome, email, data_criacao)
VALUES ('Ana', 'ana@example.com', '2024-02-15');

-- Selecionar todos os usuários cujo nome começa com 'J'
SELECT * FROM usuarios
WHERE nome LIKE 'J%';

-- Criar tabela de produtos se não existir
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

-- Inserir dados na tabela de produtos
INSERT INTO produtos (nome, preco, estoque)
VALUES
    ('Produto A', 29.99, 100),
    ('Produto B', 49.99, 50),
    ('Produto C', 19.99, 200);

-- Criar tabela de clientes se não existir
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Inserir dados na tabela de clientes
INSERT INTO clientes (nome, email, telefone)
VALUES
    ('Cliente A', 'clienteA@example.com', '123456789'),
    ('Cliente B', 'clienteB@example.com', '987654321');

-- Criar tabela de pedidos se não existir
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserir dados na tabela de pedidos
INSERT INTO pedidos (cliente_id, data_pedido, valor_total)
VALUES
    (1, '2024-02-18', 159.96),
    (2, '2024-02-17', 79.98),
    (1, '2024-02-16', 219.95);

-- Criar tabela de itens de pedido se não existir
CREATE TABLE IF NOT EXISTS itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserir dados na tabela de itens de pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3);

-- Criar uma view para relatório de pedidos se não existir
CREATE VIEW IF NOT EXISTS relatorio_pedidos AS
SELECT p.id, p.data_pedido, p.valor_total, c.nome AS cliente
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;

-- Selecionar todos os registros da view de relatório de pedidos
SELECT * FROM relatorio_pedidos;

-- Criar uma view para listar produtos em estoque se não existir
CREATE VIEW IF NOT EXISTS produtos_em_estoque AS
SELECT nome, preco, estoque
FROM produtos
WHERE estoque > 0;

-- Selecionar todos os registros da view de produtos em estoque
SELECT * FROM produtos_em_estoque;
