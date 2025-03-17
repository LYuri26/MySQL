-- Cria o banco de dados "Oscar" se ele não existir. Evita erros caso o banco já exista.
CREATE DATABASE IF NOT EXISTS Oscar;

-- Seleciona o banco de dados "Oscar" para uso nas operações seguintes.
USE Oscar;

-- Tabela MelhorFilme: Armazena informações sobre os filmes concorrentes ao prêmio.
CREATE TABLE IF NOT EXISTS MelhorFilme (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único e auto-incrementado para cada filme.
    nome VARCHAR(255) NOT NULL,        -- Nome do filme, com limite de 255 caracteres e não pode ser nulo.
    votos INT DEFAULT 0                -- Quantidade de votos recebidos, com valor padrão 0.
);

-- Tabela MelhorDiretor: Armazena informações sobre os diretores concorrentes ao prêmio.
CREATE TABLE IF NOT EXISTS MelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único e auto-incrementado para cada diretor.
    nome VARCHAR(255) NOT NULL,        -- Nome do diretor, com limite de 255 caracteres e não pode ser nulo.
    filme_id INT,                      -- ID do filme associado ao diretor (chave estrangeira).
    votos INT DEFAULT 0,               -- Quantidade de votos recebidos, com valor padrão 0.
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)  -- Chave estrangeira que referencia a tabela MelhorFilme.
);

-- Tabela Vencedores: Armazena os vencedores de cada categoria.
CREATE TABLE IF NOT EXISTS Vencedores (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID único e auto-incrementado para cada vencedor.
    categoria VARCHAR(255) NOT NULL UNIQUE,  -- Nome da categoria (ex: "Melhor Filme"), deve ser único.
    vencedor_nome VARCHAR(255) NOT NULL,    -- Nome do vencedor (filme, diretor, etc.).
    votos INT NOT NULL                      -- Quantidade de votos recebidos pelo vencedor.
);

-- Altera o delimitador para "//" para evitar conflitos durante a criação dos triggers.
DELIMITER //

-- Trigger para MelhorFilme: Atualiza a tabela Vencedores após um INSERT na tabela MelhorFilme.
CREATE TRIGGER tr_insere_vencedor_MelhorFilme AFTER INSERT ON MelhorFilme
FOR EACH ROW  -- Executa para cada linha inserida.
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);  -- Variável para armazenar o nome do filme vencedor.
    DECLARE v_vencedor_votos INT;          -- Variável para armazenar os votos do filme vencedor.

    -- Seleciona o filme com mais votos.
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    ORDER BY votos DESC  -- Ordena os filmes por votos em ordem decrescente.
    LIMIT 1;  -- Limita o resultado ao filme com mais votos.

    -- Insere ou atualiza o vencedor na tabela Vencedores.
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Atualiza se a categoria já existir.
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

DELIMITER ;

DELIMITER //

-- Trigger para MelhorDiretor: Atualiza a tabela Vencedores após um INSERT na tabela MelhorDiretor.
CREATE TRIGGER tr_insere_vencedor_MelhorDiretor AFTER INSERT ON MelhorDiretor
FOR EACH ROW  -- Executa para cada linha inserida.
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);  -- Variável para armazenar o nome do diretor vencedor.
    DECLARE v_vencedor_votos INT;          -- Variável para armazenar os votos do diretor vencedor.

    -- Seleciona o diretor com mais votos.
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    ORDER BY votos DESC  -- Ordena os diretores por votos em ordem decrescente.
    LIMIT 1;  -- Limita o resultado ao diretor com mais votos.

    -- Insere ou atualiza o vencedor na tabela Vencedores.
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Atualiza se a categoria já existir.
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Restaura o delimitador padrão (;) após a criação dos triggers.
DELIMITER ;

-- Trigger para MelhorFilme (UPDATE): Atualiza a tabela Vencedores após um UPDATE na tabela MelhorFilme.
CREATE TRIGGER tr_atualiza_vencedor_MelhorFilme AFTER UPDATE ON MelhorFilme
FOR EACH ROW  -- Executa para cada linha atualizada.
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);  -- Variável para armazenar o nome do filme vencedor.
    DECLARE v_vencedor_votos INT;          -- Variável para armazenar os votos do filme vencedor.

    -- Seleciona o filme com mais votos.
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    ORDER BY votos DESC  -- Ordena os filmes por votos em ordem decrescente.
    LIMIT 1;  -- Limita o resultado ao filme com mais votos.

    -- Insere ou atualiza o vencedor na tabela Vencedores.
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Atualiza se a categoria já existir.
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Trigger para MelhorDiretor (UPDATE): Atualiza a tabela Vencedores após um UPDATE na tabela MelhorDiretor.
CREATE TRIGGER tr_atualiza_vencedor_MelhorDiretor AFTER UPDATE ON MelhorDiretor
FOR EACH ROW  -- Executa para cada linha atualizada.
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);  -- Variável para armazenar o nome do diretor vencedor.
    DECLARE v_vencedor_votos INT;          -- Variável para armazenar os votos do diretor vencedor.

    -- Seleciona o diretor com mais votos.
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    ORDER BY votos DESC  -- Ordena os diretores por votos em ordem decrescente.
    LIMIT 1;  -- Limita o resultado ao diretor com mais votos.

    -- Insere ou atualiza o vencedor na tabela Vencedores.
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE  -- Atualiza se a categoria já existir.
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- Insere dados na tabela MelhorFilme: Adiciona filmes concorrentes com seus votos.
INSERT INTO MelhorFilme (nome, votos) VALUES
    ('Inception', 800),
    ('The Social Network', 700),
    ('The King''s Speech', 600),
    ('Black Swan', 500);

-- Insere dados na tabela MelhorDiretor: Adiciona diretores concorrentes com seus votos e ID do filme.
INSERT INTO MelhorDiretor (nome, filme_id, votos) VALUES
    ('Christopher Nolan', 1, 800),
    ('David Fincher', 2, 700),
    ('Tom Hooper', 3, 600),
    ('Darren Aronofsky', 4, 500);