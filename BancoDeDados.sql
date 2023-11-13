CREATE DATABASE SenaiBD;

USE SenaiBD;

CREATE TABLE
    clientes(
        id_cliente INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR (255) UNIQUE NOT NULL,
        telefone VARCHAR(20),
        endereco VARCHAR(255),
        cidade VARCHAR(100),
        estado VARCHAR(2),
        cep VARCHAR(10),
        datacadastro DATE DEFAULT CURRENT_DATE
    );

SELECT * FROM clientes;

INSERT INTO
    clientes (
        nome,
        email,
        telefone,
        endereco,
        cidade,
        estado,
        cep
    )
VALUES (
        'Antonio Brito',
        'antonio@teste.com',
        '3488888888',
        'Rua 3',
        'Uberaba',
        'MG',
        '1234567891'
    );

UPDATE clientes
SET cidade = 'Belo Horizonte'
WHERE id_cliente = 1;

DELETE FROM clientes
WHERE id_cliente = 1;

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL(10,2)
);

SELECT * FROM produtos;

ALTER TABLE produtos
ADD COLUMN origem VARCHAR (255);

ALTER TABLE clientes
CHANGE celular telefone VARCHAR(20);

SELECT * FROM clientes;

DROP TABLE produtos;