-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oscar2010;
USE Oscar2010;

-- Trigger para Melhor Filme
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorFilme AFTER INSERT ON MelhorFilme
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o vencedor atual com mais votos na tabela MelhorFilme
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorFilme);

    -- Verifica se já existe um vencedor para a categoria Melhor Filme
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Filme') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Filme';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Diretor
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorDiretor AFTER INSERT ON MelhorDiretor
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o vencedor atual com mais votos na tabela MelhorDiretor
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorDiretor);

    -- Verifica se já existe um vencedor para a categoria Melhor Diretor
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Diretor') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Diretor';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Ator
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorAtor AFTER INSERT ON MelhorAtor
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o vencedor atual com mais votos na tabela MelhorAtor
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtor
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorAtor);

    -- Verifica se já existe um vencedor para a categoria Melhor Ator
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Ator') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Ator';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Atriz
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorAtriz AFTER INSERT ON MelhorAtriz
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a vencedora atual com mais votos na tabela MelhorAtriz
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtriz
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorAtriz);

    -- Verifica se já existe uma vencedora para a categoria Melhor Atriz
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Atriz') THEN
        -- Atualiza a vencedora na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Atriz';
    ELSE
        -- Insere a vencedora na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Atriz', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Ator Coadjuvante
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorAtorCoadjuvante AFTER INSERT ON MelhorAtorCoadjuvante
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o vencedor atual com mais votos na tabela MelhorAtorCoadjuvante
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtorCoadjuvante
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorAtorCoadjuvante);

    -- Verifica se já existe um vencedor para a categoria Melhor Ator Coadjuvante
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Ator Coadjuvante') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Ator Coadjuvante';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Ator Coadjuvante', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Atriz Coadjuvante
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorAtrizCoadjuvante AFTER INSERT ON MelhorAtrizCoadjuvante
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a vencedora atual com mais votos na tabela MelhorAtrizCoadjuvante
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtrizCoadjuvante
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorAtrizCoadjuvante);

    -- Verifica se já existe uma vencedora para a categoria Melhor Atriz Coadjuvante
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Atriz Coadjuvante') THEN
        -- Atualiza a vencedora na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Atriz Coadjuvante';
    ELSE
        -- Insere a vencedora na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Atriz Coadjuvante', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Roteiro Original
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorRoteiroOriginal AFTER INSERT ON MelhorRoteiroOriginal
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o roteiro vencedor atual com mais votos na tabela MelhorRoteiroOriginal
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorRoteiroOriginal
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorRoteiroOriginal);

    -- Verifica se já existe um vencedor para a categoria Melhor Roteiro Original
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Roteiro Original') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Roteiro Original';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Roteiro Original', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;


-- Trigger para Melhor Filme de Animação
DELIMITER //

CREATE TRIGGER IF NOT EXISTS tr_insere_vencedor_MelhorFilmeAnimacao AFTER INSERT ON MelhorFilmeAnimacao
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_id INT;
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o vencedor atual com mais votos na tabela MelhorFilmeAnimacao
    SELECT id, nome, votacao INTO v_vencedor_id, v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilmeAnimacao
    WHERE votacao = (SELECT MAX(votacao) FROM MelhorFilmeAnimacao);

    -- Verifica se já existe um vencedor para a categoria Melhor Filme de Animação
    IF EXISTS (SELECT 1 FROM Vencedores WHERE categoria = 'Melhor Filme de Animação') THEN
        -- Atualiza o vencedor na tabela Vencedores
        UPDATE Vencedores
        SET nome = v_vencedor_nome, votos = v_vencedor_votos
        WHERE categoria = 'Melhor Filme de Animação';
    ELSE
        -- Insere o vencedor na tabela Vencedores
        INSERT INTO Vencedores (categoria, nome, votos)
        VALUES ('Melhor Filme de Animação', v_vencedor_nome, v_vencedor_votos);
    END IF;

END//

DELIMITER ;
