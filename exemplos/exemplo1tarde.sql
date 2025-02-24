-- 1. Criação do Banco de Dados
CREATE DATABASE loja_online;
USE loja_online;

-- 2. Criação das Tabelas
-- Tabela de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    total FLOAT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de ItensPedido
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario FLOAT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- 3. Inserção de Dados
-- Inserindo 15 Clientes
INSERT INTO clientes (nome, email, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '2023-10-01'),
('Maria Oliveira', 'maria.oliveira@email.com', '2023-10-02'),
('Carlos Souza', 'carlos.souza@email.com', '2023-10-03'),
('Ana Costa', 'ana.costa@email.com', '2023-10-04'),
('Pedro Rocha', 'pedro.rocha@email.com', '2023-10-05'),
('Luiza Mendes', 'luiza.mendes@email.com', '2023-10-06'),
('Fernando Lima', 'fernando.lima@email.com', '2023-10-07'),
('Juliana Alves', 'juliana.alves@email.com', '2023-10-08'),
('Ricardo Santos', 'ricardo.santos@email.com', '2023-10-09'),
('Camila Pereira', 'camila.pereira@email.com', '2023-10-10'),
('Bruno Carvalho', 'bruno.carvalho@email.com', '2023-10-11'),
('Patrícia Gomes', 'patricia.gomes@email.com', '2023-10-12'),
('Lucas Martins', 'lucas.martins@email.com', '2023-10-13'),
('Amanda Ribeiro', 'amanda.ribeiro@email.com', '2023-10-14'),
('Roberto Ferreira', 'roberto.ferreira@email.com', '2023-10-15');

-- Inserindo 15 Produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook Dell', 3500.00, 10),
('Smartphone Samsung', 1500.00, 20),
('Tablet Apple', 2500.00, 15),
('Monitor LG', 1200.00, 30),
('Teclado Mecânico', 300.00, 50),
('Mouse Gamer', 200.00, 40),
('Impressora HP', 800.00, 25),
('Câmera Canon', 1800.00, 15),
('Headset Gamer', 400.00, 35),
('SSD 500GB', 350.00, 60),
('HD Externo 1TB', 400.00, 45),
('Roteador Wi-Fi', 250.00, 55),
('Webcam Full HD', 300.00, 20),
('Caixa de Som Bluetooth', 150.00, 40),
('Carregador Portátil', 100.00, 70);

-- Inserindo 15 Pedidos
INSERT INTO pedidos (cliente_id, data_pedido, total) VALUES
(1, '2023-10-05', 5000.00),
(2, '2023-10-06', 4000.00),
(3, '2023-10-07', 3000.00),
(4, '2023-10-08', 2000.00),
(5, '2023-10-09', 1500.00),
(6, '2023-10-10', 2500.00),
(7, '2023-10-11', 3500.00),
(8, '2023-10-12', 4500.00),
(9, '2023-10-13', 5500.00),
(10, '2023-10-14', 6000.00),
(11, '2023-10-15', 7000.00),
(12, '2023-10-16', 8000.00),
(13, '2023-10-17', 9000.00),
(14, '2023-10-18', 10000.00),
(15, '2023-10-19', 11000.00);

-- Inserindo 15 Itens de Pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00), -- Notebook Dell no Pedido 1
(1, 2, 1, 1500.00), -- Smartphone Samsung no Pedido 1
(2, 3, 2, 2500.00), -- Tablet Apple no Pedido 2
(3, 4, 1, 1200.00), -- Monitor LG no Pedido 3
(4, 5, 3, 300.00),  -- Teclado Mecânico no Pedido 4
(5, 6, 2, 200.00),  -- Mouse Gamer no Pedido 5
(6, 7, 1, 800.00),  -- Impressora HP no Pedido 6
(7, 8, 1, 1800.00), -- Câmera Canon no Pedido 7
(8, 9, 2, 400.00),  -- Headset Gamer no Pedido 8
(9, 10, 1, 350.00), -- SSD 500GB no Pedido 9
(10, 11, 1, 400.00), -- HD Externo 1TB no Pedido 10
(11, 12, 1, 250.00), -- Roteador Wi-Fi no Pedido 11
(12, 13, 1, 300.00), -- Webcam Full HD no Pedido 12
(13, 14, 2, 150.00), -- Caixa de Som Bluetooth no Pedido 13
(14, 15, 3, 100.00); -- Carregador Portátil no Pedido 14

-- 4. Consultas de Dados
-- 1. Listar todos os clientes
SELECT * FROM clientes;

-- 2. Listar todos os produtos
SELECT * FROM produtos;

-- 3. Listar todos os pedidos com detalhes do cliente
SELECT p.id AS pedido_id, c.nome AS cliente_nome, p.data_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;

-- 4. Listar itens de um pedido específico (ex: Pedido 1)
SELECT ip.id AS item_id, pr.nome AS produto_nome, ip.quantidade, ip.preco_unitario
FROM itens_pedido ip
JOIN produtos pr ON ip.produto_id = pr.id
WHERE ip.pedido_id = 1;

-- 5. Listar produtos com estoque menor que 20
SELECT nome, estoque
FROM produtos
WHERE estoque < 20;

-- 6. Listar total de vendas por cliente
SELECT c.nome AS cliente_nome, SUM(p.total) AS total_vendas
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.nome;

-- 7. Listar produtos mais vendidos (quantidade total vendida)
SELECT pr.nome AS produto_nome, SUM(ip.quantidade) AS total_vendido
FROM itens_pedido ip
JOIN produtos pr ON ip.produto_id = pr.id
GROUP BY pr.nome
ORDER BY total_vendido DESC;

-- 8. Listar pedidos feitos em outubro de 2023
SELECT * FROM pedidos
WHERE data_pedido BETWEEN '2023-10-01' AND '2023-10-31';

-- 9. Listar clientes que fizeram pedidos acima de R$ 5000
SELECT c.nome, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
WHERE p.total > 5000;

-- 10. Listar produtos que nunca foram vendidos
SELECT pr.nome
FROM produtos pr
LEFT JOIN itens_pedido ip ON pr.id = ip.produto_id
WHERE ip.produto_id IS NULL;

-- 11. Listar clientes que não fizeram nenhum pedido
SELECT c.nome
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL;

-- 12. Listar o valor total de cada pedido
SELECT p.id AS pedido_id, SUM(ip.quantidade * ip.preco_unitario) AS total_pedido
FROM itens_pedido ip
JOIN pedidos p ON ip.pedido_id = p.id
GROUP BY p.id;

-- 13. Listar produtos com preço acima de R$ 1000
SELECT nome, preco
FROM produtos
WHERE preco > 1000;

-- 14. Listar clientes ordenados por data de cadastro
SELECT nome, data_cadastro
FROM clientes
ORDER BY data_cadastro;

-- 15. Listar pedidos com mais de 1 item
SELECT p.id AS pedido_id, COUNT(ip.id) AS total_itens
FROM pedidos p
JOIN itens_pedido ip ON p.id = ip.pedido_id
GROUP BY p.id
HAVING COUNT(ip.id) > 1;

-- 16. Exclusão do Banco de Dados (Opcional)
-- DROP DATABASE loja_online;