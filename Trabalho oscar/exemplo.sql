-- Cria o banco de dados "Oscar" se ele não existir
CREATE DATABASE IF NOT EXISTS Oscar;

-- Seleciona o banco de dados "Oscar" para uso
USE Oscar;

-- Cria a tabela "MelhorFilme" se ela não existir
CREATE TABLE IF NOT EXISTS MelhorFilme (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna "id" que é um número inteiro, auto-incrementado e chave primária
    nome VARCHAR(255) NOT NULL,        -- Coluna "nome" que armazena texto (até 255 caracteres) e não pode ser nula
    votos INT DEFAULT 0                -- Coluna "votos" que armazena um número inteiro, com valor padrão 0
);

-- Inserção de dados na tabela MelhorFilme
INSERT INTO MelhorFilme (nome, votos) VALUES
    ('Inception', 800),
    ('The Social Network', 700),
    ('The King''s Speech', 600),
    ('Black Swan', 500);

--TRIGGER OPCIONAL
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de UPDATE na tabela "MelhorFilme"
CREATE TRIGGER tr_atualiza_vencedor_MelhorFilme AFTER UPDATE ON MelhorFilme
FOR EACH ROW  -- O trigger é executado para cada linha afetada pela operação
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do filme com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    ORDER BY votos DESC  -- Ordena os filmes por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o filme com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

--TRIGGER OBRIGATÓRIO
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de INSERT na tabela "MelhorFilme"
CREATE TRIGGER tr_insere_vencedor_MelhorFilme AFTER INSERT ON MelhorFilme
FOR EACH ROW  -- O trigger é executado para cada linha inserida
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do filme com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    ORDER BY votos DESC  -- Ordena os filmes por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o filme com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

-- Cria a tabela "MelhorDiretor" se ela não existir
CREATE TABLE IF NOT EXISTS MelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna "id" que é um número inteiro, auto-incrementado e chave primária
    nome VARCHAR(255) NOT NULL,        -- Coluna "nome" que armazena texto (até 255 caracteres) e não pode ser nula
    filme_id INT,                      -- Coluna "filme_id" que armazena um número inteiro (chave estrangeira)
    votos INT DEFAULT 0,               -- Coluna "votos" que armazena um número inteiro, com valor padrão 0
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)  -- Define "filme_id" como chave estrangeira referenciando a tabela "MelhorFilme"
);

-- Inserção de dados na tabela MelhorDiretor
INSERT INTO MelhorDiretor (nome, filme_id, votos) VALUES
    ('Christopher Nolan', 1, 800),
    ('David Fincher', 2, 700),
    ('Tom Hooper', 3, 600),
    ('Darren Aronofsky', 4, 500);

--TRIGGER OPCIONAL
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de UPDATE na tabela "MelhorDiretor"
CREATE TRIGGER tr_atualiza_vencedor_MelhorDiretor AFTER UPDATE ON MelhorDiretor
FOR EACH ROW  -- O trigger é executado para cada linha afetada pela operação
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do diretor com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    ORDER BY votos DESC  -- Ordena os diretores por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o diretor com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

--TRIGGER OBRIGATÓRIO
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de INSERT na tabela "MelhorDiretor"
CREATE TRIGGER tr_insere_vencedor_MelhorDiretor AFTER INSERT ON MelhorDiretor
FOR EACH ROW  -- O trigger é executado para cada linha inserida
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do diretor com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    ORDER BY votos DESC  -- Ordena os diretores por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o diretor com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

-- Cria a tabela "MelhorAtor" se ela não existir
CREATE TABLE IF NOT EXISTS MelhorAtor (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna "id" que é um número inteiro, auto-incrementado e chave primária
    nome VARCHAR(255) NOT NULL,        -- Coluna "nome" que armazena texto (até 255 caracteres) e não pode ser nula
    filme_id INT,                      -- Coluna "filme_id" que armazena um número inteiro (chave estrangeira)
    votos INT DEFAULT 0,               -- Coluna "votos" que armazena um número inteiro, com valor padrão 0
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)  -- Define "filme_id" como chave estrangeira referenciando a tabela "MelhorFilme"
);

-- Inserção de dados na tabela MelhorAtor
INSERT INTO MelhorAtor (nome, filme_id, votos) VALUES
    ('Leonardo DiCaprio', 1, 800),
    ('Jesse Eisenberg', 2, 700),
    ('Colin Firth', 3, 600),
    ('James Franco', 4, 500);

--TRIGGER OPCIONAL
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de UPDATE na tabela "MelhorAtor"
CREATE TRIGGER tr_atualiza_vencedor_MelhorAtor AFTER UPDATE ON MelhorAtor
FOR EACH ROW  -- O trigger é executado para cada linha afetada pela operação
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do ator com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtor
    ORDER BY votos DESC  -- Ordena os atores por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o ator com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

--TRIGGER OBRIGATÓRIO
-- Define o delimitador para "//" para criar o trigger
DELIMITER //

-- Cria um trigger que é acionado APÓS uma operação de INSERT na tabela "MelhorAtor"
CREATE TRIGGER tr_insere_vencedor_MelhorAtor AFTER INSERT ON MelhorAtor
FOR EACH ROW  -- O trigger é executado para cada linha inserida
BEGIN
    -- Declara variáveis para armazenar o nome e os votos do vencedor
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o nome e os votos do ator com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtor
    ORDER BY votos DESC  -- Ordena os atores por votos em ordem decrescente
    LIMIT 1;  -- Limita o resultado a apenas 1 linha (o ator com mais votos)

    -- Insere ou atualiza o vencedor na tabela "Vencedores"
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Se já existir um registro com a mesma categoria, atualiza os valores
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;)
DELIMITER ;

-- Cria a tabela "Vencedores" se ela não existir
CREATE TABLE IF NOT EXISTS Vencedores (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna "id" que é um número inteiro, auto-incrementado e chave primária
    categoria VARCHAR(255) NOT NULL UNIQUE,  -- Coluna "categoria" que armazena texto (até 255 caracteres), não pode ser nula e deve ser única
    vencedor_nome VARCHAR(255) NOT NULL,    -- Coluna "vencedor_nome" que armazena texto (até 255 caracteres) e não pode ser nula
    votos INT NOT NULL                      -- Coluna "votos" que armazena um número inteiro e não pode ser nula
);