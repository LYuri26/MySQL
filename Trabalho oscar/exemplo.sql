-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oscar2023;
USE Oscar2023;

-- Tabela para Melhor Filme
CREATE TABLE IF NOT EXISTS MelhorFilme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Tabela para Melhor Diretor
CREATE TABLE IF NOT EXISTS MelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Ator
CREATE TABLE IF NOT EXISTS MelhorAtor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para registro de log de Melhor Diretor
CREATE TABLE IF NOT EXISTS LogMelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    diretor_nome VARCHAR(255) NOT NULL,
    filme_nome VARCHAR(255) NOT NULL,
    data_registro DATETIME NOT NULL
);

-- Exemplo de inserção de dados
INSERT INTO MelhorFilme (nome) VALUES ('The Power of the Dog');
INSERT INTO MelhorFilme (nome) VALUES ('CODA');

INSERT INTO MelhorDiretor (nome, filme_id)
VALUES ('Jane Campion', 1);  -- Jane Campion dirigiu "The Power of the Dog"

INSERT INTO MelhorAtor (nome, filme_id)
VALUES ('Benedict Cumberbatch', 1);  -- Benedict Cumberbatch atuou em "The Power of the Dog"

-- Alteração do delimitador para criar o trigger


-- Criação do Trigger para registrar alterações na tabela MelhorDiretor
CREATE TRIGGER after_insert_MelhorDiretor
AFTER INSERT ON MelhorDiretor
FOR EACH ROW
BEGIN
    DECLARE filme_nome VARCHAR(255);
    SELECT nome INTO filme_nome FROM MelhorFilme WHERE id = NEW.filme_id;

    INSERT INTO LogMelhorDiretor (diretor_nome, filme_nome, data_registro)
    VALUES (NEW.nome, filme_nome, NOW());
END;

