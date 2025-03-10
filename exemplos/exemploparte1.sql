-- 1. Criação do Banco de Dados
CREATE DATABASE loja_doces;  -- Cria o banco de dados chamado "loja_doces"
USE loja_doces;  -- Usa o banco de dados "loja_doces" para as operações seguintes

-- 2. Criação das Tabelas
CREATE TABLE doces (  -- Cria a tabela "doces"
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Cria uma coluna "id" como chave primária, com incremento automático
    nome VARCHAR(100) NOT NULL,  -- Cria a coluna "nome" para armazenar o nome do doce, não pode ser nulo
    sabor VARCHAR(50),  -- Cria a coluna "sabor" para armazenar o sabor do doce
    preco DECIMAL(6, 2),  -- Cria a coluna "preco" para armazenar o preço do doce, com até 6 dígitos e 2 casas decimais
    quantidade_estoque INT  -- Cria a coluna "quantidade_estoque" para armazenar a quantidade de doces no estoque
);

CREATE TABLE clientes (  -- Cria a tabela "clientes"
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Cria uma coluna "id" como chave primária, com incremento automático
    nome VARCHAR(100) NOT NULL,  -- Cria a coluna "nome" para armazenar o nome do cliente, não pode ser nulo
    telefone VARCHAR(15),  -- Cria a coluna "telefone" para armazenar o número de telefone do cliente
    data_cadastro DATE  -- Cria a coluna "data_cadastro" para armazenar a data de cadastro do cliente
);

CREATE TABLE vendas (  -- Cria a tabela "vendas"
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Cria a coluna "id" como chave primária, com incremento automático
    cliente_id INT,  -- Cria a coluna "cliente_id" para armazenar o ID do cliente que fez a compra
    doce_id INT,  -- Cria a coluna "doce_id" para armazenar o ID do doce comprado
    data_venda DATE,  -- Cria a coluna "data_venda" para armazenar a data da venda
    quantidade INT,  -- Cria a coluna "quantidade" para armazenar a quantidade comprada do doce
    valor_total DECIMAL(6, 2),  -- Cria a coluna "valor_total" para armazenar o valor total da venda
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),  -- Cria uma chave estrangeira vinculando "cliente_id" à tabela "clientes"
    FOREIGN KEY (doce_id) REFERENCES doces(id)  -- Cria uma chave estrangeira vinculando "doce_id" à tabela "doces"
);

CREATE TABLE teste (  -- Cria uma tabela "teste" com apenas uma coluna
    id INT PRIMARY KEY AUTO_INCREMENT  -- Cria a coluna "id" como chave primária, com incremento automático
);

-- 3. Inserção de Dados (apenas 2 registros por tabela)
INSERT INTO doces (nome, sabor, preco, quantidade_estoque) VALUES  -- Insere 2 doces na tabela "doces"
('Brigadeiro', 'Chocolate', 2.50, 50),
('Beijinho', 'Coco', 2.00, 30);

INSERT INTO clientes (nome, telefone, data_cadastro) VALUES  -- Insere 2 clientes na tabela "clientes"
('Maria Silva', '(11) 99999-1111', '2023-10-01'),
('João Oliveira', '(11) 98888-2222', '2023-10-02');

INSERT INTO vendas (cliente_id, doce_id, data_venda, quantidade, valor_total) VALUES  -- Insere 2 vendas na tabela "vendas"
(1, 1, '2023-10-05', 10, 25.00),
(2, 2, '2023-10-06', 5, 10.00);

-- 4. Atualização de Dados (UPDATE)
-- Aumentar o preço do Brigadeiro em 10%
UPDATE doces SET preco = preco * 1.10 WHERE nome = 'Brigadeiro';  -- Atualiza o preço do Brigadeiro, aplicando um aumento de 10%

-- Atualizar o telefone de Maria Silva
UPDATE clientes SET telefone = '(11) 95555-1234' WHERE nome = 'Maria Silva';  -- Atualiza o telefone de Maria Silva

-- 5. Remoção de Dados (DELETE)
-- Remover as vendas associadas ao doce "Beijinho"
DELETE FROM vendas WHERE doce_id = (SELECT id FROM doces WHERE nome = 'Beijinho');  -- Exclui todas as vendas relacionadas ao doce "Beijinho"

-- Excluir o doce "Beijinho" do estoque
DELETE FROM doces WHERE nome = 'Beijinho';  -- Exclui o doce "Beijinho" da tabela "doces"

-- Excluir todas as vendas do cliente João Oliveira
DELETE FROM vendas WHERE cliente_id = (SELECT id FROM clientes WHERE nome = 'João Oliveira');  -- Exclui todas as vendas do cliente João Oliveira

-- Excluir o cliente João Oliveira
DELETE FROM clientes WHERE nome = 'João Oliveira';  -- Exclui o cliente João Oliveira da tabela "clientes"

-- 6. Consultas Simples (SELECT)
-- Listar todos os doces cadastrados
SELECT * FROM doces;  -- Exibe todos os registros da tabela "doces"

-- Mostrar os clientes cadastrados em outubro de 2023
SELECT * FROM clientes WHERE MONTH(data_cadastro) = 10 AND YEAR(data_cadastro) = 2023;  -- Exibe os clientes cadastrados no mês de outubro de 2023

-- 7. Consultas Avançadas (COUNT, SUM, AVG)
-- Contar quantos doces estão cadastrados
SELECT COUNT(*) AS total_doces FROM doces;  -- Conta o número total de doces na tabela "doces"

-- Calcular o valor total das vendas
SELECT SUM(valor_total) AS total_vendas FROM vendas;  -- Soma o valor total das vendas registradas

-- Calcular o preço médio dos doces
SELECT AVG(preco) AS preco_medio FROM doces;  -- Calcula a média dos preços dos doces

-- 8. Ordenação e Filtros (ORDER BY, LIMIT, LIKE)
-- Listar os doces ordenados pelo preço (do mais barato para o mais caro)
SELECT * FROM doces ORDER BY preco ASC;  -- Exibe os doces ordenados pelo preço de forma crescente

-- Mostrar o doce mais caro
SELECT * FROM doces ORDER BY preco DESC LIMIT 1;  -- Exibe o doce mais caro da tabela, limitando a 1 resultado

-- Listar clientes cujo nome começa com "M"
SELECT * FROM clientes WHERE nome LIKE 'M%';  -- Exibe os clientes cujo nome começa com "M"

-- 9. Modificação Estrutural (ALTER TABLE, DROP)
-- Adicionar uma nova coluna "descricao" na tabela doces
ALTER TABLE doces ADD COLUMN descricao TEXT;  -- Adiciona uma nova coluna "descricao" do tipo TEXT à tabela "doces"

-- Renomear a coluna "telefone" para "contato"
ALTER TABLE clientes CHANGE telefone contato VARCHAR(15);  -- Renomeia a coluna "telefone" para "contato" na tabela "clientes"

-- Remover a coluna "descricao" da tabela doces
ALTER TABLE doces DROP COLUMN descricao;  -- Remove a coluna "descricao" da tabela "doces"

-- Excluir completamente a tabela clientes
DROP TABLE teste;  -- Exclui a tabela "teste" do banco de dados
