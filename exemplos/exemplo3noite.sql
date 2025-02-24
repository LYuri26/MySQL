-- Criação de Triggers

-- Trigger para atualizar a quantidade de livros emprestados por um usuário
DELIMITER $$

CREATE TRIGGER atualiza_quantidade_emprestimos_after_insert
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    -- Atualiza a quantidade de livros emprestados pelo usuário
    UPDATE usuarios
    SET total_emprestimos = total_emprestimos + 1
    WHERE id = NEW.usuario_id;
END$$

DELIMITER ;

-- Trigger para atualizar a quantidade de livros emprestados após a devolução
DELIMITER $$

CREATE TRIGGER atualiza_quantidade_emprestimos_after_update
AFTER UPDATE ON emprestimos
FOR EACH ROW
BEGIN
    -- Verifica se a data de devolução foi preenchida
    IF NEW.data_devolucao IS NOT NULL THEN
        -- Atualiza a quantidade de livros emprestados pelo usuário
        UPDATE usuarios
        SET total_emprestimos = total_emprestimos - 1
        WHERE id = NEW.usuario_id;
    END IF;
END$$

DELIMITER ;

-- Trigger para impedir a inserção de um empréstimo se o livro já estiver emprestado
DELIMITER $$

CREATE TRIGGER impede_emprestimo_livro_ja_emprestado
BEFORE INSERT ON emprestimos
FOR EACH ROW
BEGIN
    DECLARE livro_emprestado INT;

    -- Verifica se o livro já está emprestado
    SELECT COUNT(*) INTO livro_emprestado
    FROM emprestimos
    WHERE livro_id = NEW.livro_id AND data_devolucao IS NULL;

    -- Se o livro já estiver emprestado, gera um erro
    IF livro_emprestado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este livro já está emprestado.';
    END IF;
END$$

DELIMITER ;

-- Criação de Views

-- View para listar todos os livros disponíveis (não emprestados)
CREATE VIEW vw_livros_disponiveis AS
SELECT l.titulo, a.nome AS autor, l.ano_publicacao, l.genero
FROM livros l
JOIN autores a ON l.autor_id = a.id
LEFT JOIN emprestimos e ON l.id = e.livro_id AND e.data_devolucao IS NULL
WHERE e.id IS NULL;

-- View para listar os livros mais emprestados
CREATE VIEW vw_livros_mais_emprestados AS
SELECT l.titulo, COUNT(e.id) AS total_emprestimos
FROM livros l
JOIN emprestimos e ON l.id = e.livro_id
GROUP BY l.id
ORDER BY total_emprestimos DESC;

-- View para listar os usuários com mais empréstimos
CREATE VIEW vw_usuarios_mais_emprestimos AS
SELECT u.nome, COUNT(e.id) AS total_emprestimos
FROM usuarios u
JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.id
ORDER BY total_emprestimos DESC;

-- Criação de Stored Procedures

-- Stored Procedure para registrar um novo empréstimo
DELIMITER $$

CREATE PROCEDURE sp_registrar_emprestimo(
    IN p_usuario_id INT,
    IN p_livro_id INT,
    IN p_data_emprestimo DATE
)
BEGIN
    -- Insere o novo empréstimo
    INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo)
    VALUES (p_usuario_id, p_livro_id, p_data_emprestimo);
END$$

DELIMITER ;

-- Stored Procedure para registrar a devolução de um livro
DELIMITER $$

CREATE PROCEDURE sp_registrar_devolucao(
    IN p_emprestimo_id INT,
    IN p_data_devolucao DATE
)
BEGIN
    -- Atualiza a data de devolução do empréstimo
    UPDATE emprestimos
    SET data_devolucao = p_data_devolucao
    WHERE id = p_emprestimo_id;
END$$

DELIMITER ;

-- Stored Procedure para listar empréstimos ativos de um usuário
DELIMITER $$

CREATE PROCEDURE sp_listar_emprestimos_ativos(
    IN p_usuario_id INT
)
BEGIN
    -- Lista os empréstimos ativos do usuário
    SELECT e.id AS emprestimo_id, l.titulo AS livro_titulo, e.data_emprestimo
    FROM emprestimos e
    JOIN livros l ON e.livro_id = l.id
    WHERE e.usuario_id = p_usuario_id AND e.data_devolucao IS NULL;
END$$

DELIMITER ;

-- Stored Procedure para listar livros de um autor específico
DELIMITER $$

CREATE PROCEDURE sp_listar_livros_autor(
    IN p_autor_id INT
)
BEGIN
    -- Lista os livros de um autor específico
    SELECT l.titulo, l.ano_publicacao, l.genero
    FROM livros l
    WHERE l.autor_id = p_autor_id;
END$$

DELIMITER ;