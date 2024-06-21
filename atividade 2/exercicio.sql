-- Exercicio 1: Criação de Banco de Dados e Seleção
-- Este exercício cria um banco de dados chamado 'loja_virtual' e o seleciona para uso.
CREATE DATABASE loja_virtual;

USE loja_virtual;

-- Exercicio 2: Criação de Tabela
-- Este exercício cria uma tabela chamada 'clientes' com as colunas especificadas.
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    data_de_cadastro DATE
);

-- Exercicio 3: Inserção de Dados
-- Este exercício insere três registros na tabela 'clientes'.
INSERT INTO
    clientes (nome, email, data_de_cadastro)
VALUES
    (
        'João Silva',
        'joao.silva@email.com',
        '2023-01-15'
    ),
    (
        'Maria Oliveira',
        'maria.oliveira@email.com',
        '2023-02-20'
    ),
    (
        'Carlos Souza',
        'carlos.souza@email.com',
        '2023-03-10'
    );

-- Exercicio 4: Recuperação de Dados
-- Este exercício recupera todos os registros da tabela 'clientes' para verificar os dados inseridos.
SELECT
    *
FROM
    clientes;

-- Exercicio 5: Atualização de Dados
-- Este exercício atualiza o email de um cliente específico na tabela 'clientes'.
UPDATE
    clientes
SET
    email = 'joao.novo.email@email.com'
WHERE
    nome = 'João Silva';

-- Exercicio 6: Exclusão de Dados
-- Este exercício exclui um registro da tabela 'clientes' com base no id do cliente.
DELETE FROM
    clientes
WHERE
    id = 3;

-- Exercicio 7: Filtragem de Dados
-- Este exercício recupera registros da tabela 'clientes' onde a data_de_cadastro é posterior a '2023-01-01'.
SELECT
    *
FROM
    clientes
WHERE
    data_de_cadastro > '2023-01-01';

-- Exercicio 8: Ordenação de Dados
-- Este exercício lista todos os registros da tabela 'clientes', ordenados pelo campo 'nome' em ordem alfabética.
SELECT
    *
FROM
    clientes
ORDER BY
    nome ASC;

-- Exercicio 9: Criação de Tabela com Chave Estrangeira
-- Este exercício cria uma tabela chamada 'pedidos' com uma chave estrangeira referenciando a tabela 'clientes'.
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Exercicio 10: Utilização de JOIN
-- Este exercício recupera todos os pedidos juntamente com os nomes dos clientes, utilizando um INNER JOIN entre as tabelas 'clientes' e 'pedidos'.
SELECT
    pedidos.id_pedido,
    pedidos.data_pedido,
    pedidos.valor_total,
    clientes.nome
FROM
    pedidos
    INNER JOIN clientes ON pedidos.id_cliente = clientes.id;