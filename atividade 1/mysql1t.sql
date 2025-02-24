-- Exercício 1: Criação de Bancos de Dados
CREATE DATABASE ecommerce_db;
CREATE DATABASE rh_db;

-- Exercício 2: Criação de Tabelas no Banco ecommerce_db
USE ecommerce_db;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    data_cadastro DATE
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    data_cadastro DATE
);

-- Exercício 3: Criação de Tabelas no Banco rh_db
USE rh_db;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_contratacao DATE
);

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    localizacao VARCHAR(100)
);

-- Exercício 4: Inserção de Dados
USE ecommerce_db;

INSERT INTO produtos (nome, preco, quantidade_estoque, data_cadastro) VALUES
('Smartphone XYZ', 1500.00, 100, '2023-10-01'),
('Notebook ABC', 3200.00, 50, '2023-10-02'),
('Fone de Ouvido Bluetooth', 200.00, 200, '2023-10-03'),
('Tablet Ultra', 2500.00, 30, '2023-10-04'),
('Monitor 27"', 1800.00, 40, '2023-10-05'),
('Teclado Mecânico', 400.00, 60, '2023-10-06'),
('Mouse Gamer', 250.00, 80, '2023-10-07'),
('Cadeira Ergonômica', 1200.00, 25, '2023-10-08'),
('Impressora Multifuncional', 900.00, 15, '2023-10-09'),
('SSD 1TB', 600.00, 50, '2023-10-10');

INSERT INTO clientes (nome, email, telefone, data_cadastro) VALUES
('João Silva', 'joao@email.com', '(11) 99999-1111', '2023-10-01'),
('Bruno Lima', 'bruno@email.com', '(81) 91111-9999', '2023-10-09');

USE rh_db;

INSERT INTO funcionarios (nome, cargo, salario, data_contratacao) VALUES
('Carlos Souza', 'Gerente', 8000.00, '2023-01-15');

INSERT INTO departamentos (nome, localizacao) VALUES
('Logística', 'Recife');

-- Exercício 5: Atualizações
UPDATE produtos SET preco = preco * 1.10;
UPDATE produtos SET quantidade_estoque = 0 WHERE quantidade_estoque < 50;
UPDATE clientes SET telefone = '(11) 95555-1111' WHERE nome = 'João Silva';
UPDATE funcionarios SET salario = salario * 1.15 WHERE cargo = 'TI';
UPDATE departamentos SET nome = 'Distribuição' WHERE nome = 'Logística';

-- Exercício 6: Remoção de Dados
DELETE FROM produtos WHERE quantidade_estoque = 0;
DELETE FROM clientes WHERE email = 'bruno@email.com';
DELETE FROM funcionarios WHERE data_contratacao < '2023-06-01';
DELETE FROM departamentos WHERE nome = 'Design';

-- Exercício 7: Consultas Simples
SELECT * FROM produtos ORDER BY nome;
SELECT * FROM produtos WHERE preco > 1000.00;
SELECT * FROM clientes WHERE YEAR(data_cadastro) = 2023 ORDER BY data_cadastro;
SELECT nome, salario FROM funcionarios WHERE salario > 5000.00;
SELECT * FROM departamentos ORDER BY localizacao;

-- Exercício 8: Consultas Avançadas
SELECT COUNT(*) FROM produtos;
SELECT SUM(preco * quantidade_estoque) FROM produtos;
SELECT AVG(preco) FROM produtos;
SELECT MONTH(data_cadastro) AS mes, COUNT(*) FROM clientes GROUP BY mes;
SELECT AVG(salario) FROM funcionarios;

-- Exercício 9: Ordenação e Filtros
SELECT * FROM produtos ORDER BY preco DESC LIMIT 5;
SELECT * FROM clientes WHERE nome LIKE 'A%';
SELECT * FROM funcionarios WHERE salario BETWEEN 4000 AND 7000;
SELECT * FROM produtos WHERE nome LIKE '%Gamer%';
SELECT * FROM departamentos ORDER BY id DESC LIMIT 3;

-- Exercício 10: Modificação Estrutural
ALTER TABLE produtos ADD COLUMN desconto DECIMAL(5,2);
ALTER TABLE clientes CHANGE telefone contato VARCHAR(15);
ALTER TABLE produtos DROP COLUMN descricao;
TRUNCATE TABLE clientes;
DROP TABLE departamentos;
