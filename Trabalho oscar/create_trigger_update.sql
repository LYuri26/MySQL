DELIMITER //

-- 1. Trigger para MelhorFilme
CREATE TRIGGER tr_atualiza_vencedor_MelhorFilme AFTER UPDATE ON MelhorFilme
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o filme com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilme
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 2. Trigger para MelhorDiretor
CREATE TRIGGER tr_atualiza_vencedor_MelhorDiretor AFTER UPDATE ON MelhorDiretor
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o diretor com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDiretor
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Diretor', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 3. Trigger para MelhorAtor
CREATE TRIGGER tr_atualiza_vencedor_MelhorAtor AFTER UPDATE ON MelhorAtor
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o ator com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtor
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Ator', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 4. Trigger para MelhorAtriz
CREATE TRIGGER tr_atualiza_vencedor_MelhorAtriz AFTER UPDATE ON MelhorAtriz
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a atriz com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtriz
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Atriz', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 5. Trigger para MelhorAtorCoadjuvante
CREATE TRIGGER tr_atualiza_vencedor_MelhorAtorCoadjuvante AFTER UPDATE ON MelhorAtorCoadjuvante
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o ator coadjuvante com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtorCoadjuvante
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Ator Coadjuvante', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 6. Trigger para MelhorAtrizCoadjuvante
CREATE TRIGGER tr_atualiza_vencedor_MelhorAtrizCoadjuvante AFTER UPDATE ON MelhorAtrizCoadjuvante
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a atriz coadjuvante com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAtrizCoadjuvante
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Atriz Coadjuvante', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 7. Trigger para MelhorRoteiroOriginal
CREATE TRIGGER tr_atualiza_vencedor_MelhorRoteiroOriginal AFTER UPDATE ON MelhorRoteiroOriginal
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o roteiro original com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorRoteiroOriginal
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Roteiro Original', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 8. Trigger para MelhorRoteiroAdaptado
CREATE TRIGGER tr_atualiza_vencedor_MelhorRoteiroAdaptado AFTER UPDATE ON MelhorRoteiroAdaptado
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o roteiro adaptado com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorRoteiroAdaptado
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Roteiro Adaptado', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 9. Trigger para MelhorFilmeInternacional
CREATE TRIGGER tr_atualiza_vencedor_MelhorFilmeInternacional AFTER UPDATE ON MelhorFilmeInternacional
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o filme internacional com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFilmeInternacional
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Filme Internacional', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 10. Trigger para MelhorAnimacao
CREATE TRIGGER tr_atualiza_vencedor_MelhorAnimacao AFTER UPDATE ON MelhorAnimacao
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o filme de animação com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorAnimacao
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Animação', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 11. Trigger para MelhorDocumentario
CREATE TRIGGER tr_atualiza_vencedor_MelhorDocumentario AFTER UPDATE ON MelhorDocumentario
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o documentário com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDocumentario
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Documentário', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 12. Trigger para MelhorCurtaMetragem
CREATE TRIGGER tr_atualiza_vencedor_MelhorCurtaMetragem AFTER UPDATE ON MelhorCurtaMetragem
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o curta-metragem com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorCurtaMetragem
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Curta-Metragem', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 13. Trigger para MelhorTrilhaSonora
CREATE TRIGGER tr_atualiza_vencedor_MelhorTrilhaSonora AFTER UPDATE ON MelhorTrilhaSonora
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a trilha sonora com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorTrilhaSonora
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Trilha Sonora', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 14. Trigger para MelhorCançãoOriginal
CREATE TRIGGER tr_atualiza_vencedor_MelhorCançãoOriginal AFTER UPDATE ON MelhorCançãoOriginal
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona a canção original com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorCançãoOriginal
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Canção Original', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 15. Trigger para MelhorFigurino
CREATE TRIGGER tr_atualiza_vencedor_MelhorFigurino AFTER UPDATE ON MelhorFigurino
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o figurino com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFigurino
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Figurino', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 16. Trigger para MelhorMaquiagemEPenteados
CREATE TRIGGER tr_atualiza_vencedor_MelhorMaquiagemEPenteados AFTER UPDATE ON MelhorMaquiagemEPenteados
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o trabalho de maquiagem e penteados com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorMaquiagemEPenteados
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Maquiagem e Penteados', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 17. Trigger para MelhorDirecaoDeArte
CREATE TRIGGER tr_atualiza_vencedor_MelhorDirecaoDeArte AFTER UPDATE ON MelhorDirecaoDeArte
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o trabalho de direção de arte com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorDirecaoDeArte
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Direção de Arte', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 18. Trigger para MelhorFotografia
CREATE TRIGGER tr_atualiza_vencedor_MelhorFotografia AFTER UPDATE ON MelhorFotografia
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o trabalho de fotografia com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorFotografia
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Fotografia', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 19. Trigger para MelhorEdicao
CREATE TRIGGER tr_atualiza_vencedor_MelhorEdicao AFTER UPDATE ON MelhorEdicao
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o trabalho de edição com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhorEdicao
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhor Edição', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

-- 20. Trigger para MelhoresEfeitosVisuais
CREATE TRIGGER tr_atualiza_vencedor_MelhoresEfeitosVisuais AFTER UPDATE ON MelhoresEfeitosVisuais
FOR EACH ROW
BEGIN
    DECLARE v_vencedor_nome VARCHAR(255);
    DECLARE v_vencedor_votos INT;

    -- Seleciona o trabalho de efeitos visuais com mais votos
    SELECT nome, votos INTO v_vencedor_nome, v_vencedor_votos
    FROM MelhoresEfeitosVisuais
    ORDER BY votos DESC
    LIMIT 1;

    -- Insere ou atualiza o vencedor na tabela Vencedores
    INSERT INTO Vencedores (categoria, vencedor_nome, votos)
    VALUES ('Melhores Efeitos Visuais', v_vencedor_nome, v_vencedor_votos)
    ON DUPLICATE KEY UPDATE
        vencedor_nome = v_vencedor_nome,
        votos = v_vencedor_votos;
END//

DELIMITER ;