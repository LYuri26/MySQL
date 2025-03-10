-- Exercício 1: Gerenciamento de Biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criação da tabela de autores
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

-- Criação da tabela de livros
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT NOT NULL,
    genero VARCHAR(50),
    autor_id INT,
    quantidade_em_estoque INT DEFAULT 0,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Criação da tabela de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Criação da tabela de emprestimos
CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    livro_id INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Criação da tabela de devolucoes
CREATE TABLE devolucoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emprestimo_id INT,
    livro_id INT,
    data_devolucao DATE,
    FOREIGN KEY (emprestimo_id) REFERENCES emprestimos(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Adicionando a coluna quantidade_em_estoque na tabela livros
ALTER TABLE livros ADD COLUMN quantidade_em_estoque INT DEFAULT 0;

-- Exercício 6: Trigger de Empréstimo - Diminuir Estoque
DELIMITER $$
CREATE TRIGGER trg_emprestimo_diminui_estoque
BEFORE INSERT ON emprestimos
FOR EACH ROW
BEGIN
    -- Decrementa a quantidade de livros no estoque
    UPDATE livros
    SET quantidade_em_estoque = quantidade_em_estoque - 1
    WHERE id = NEW.livro_id;
END$$
DELIMITER ;

-- Exercício 7: Trigger de Devolução - Aumentar Estoque
DELIMITER $$
CREATE TRIGGER trg_devolucao_aumenta_estoque
BEFORE UPDATE ON emprestimos
FOR EACH ROW
BEGIN
    -- Verifica se a data de devolução foi preenchida
    IF NEW.data_devolucao IS NOT NULL THEN
        -- Aumenta a quantidade de livros no estoque
        UPDATE livros
        SET quantidade_em_estoque = quantidade_em_estoque + 1
        WHERE id = NEW.livro_id;
    END IF;
END$$
DELIMITER ;

-- Exercício 8: Trigger de Atualização de Estoque - After Insert
DELIMITER $$
CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    -- Decrementa a quantidade de livros no estoque após o empréstimo
    UPDATE livros
    SET quantidade_em_estoque = quantidade_em_estoque - 1
    WHERE id = NEW.livro_id;
END$$
DELIMITER ;

-- Exercício 9: Trigger de Registro de Devolução
DELIMITER $$
CREATE TRIGGER trg_registra_devolucao
AFTER UPDATE ON emprestimos
FOR EACH ROW
BEGIN
    -- Verifica se a data de devolução foi preenchida
    IF NEW.data_devolucao IS NOT NULL THEN
        -- Insere um novo registro na tabela de devoluções
        INSERT INTO devolucoes (emprestimo_id, livro_id, data_devolucao)
        VALUES (NEW.id, NEW.livro_id, NEW.data_devolucao);
    END IF;
END$$
DELIMITER ;

-- Testando as triggers com dados de exemplo

-- Inserir autores
INSERT INTO autores (nome, nacionalidade) VALUES
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânica');

-- Inserir livros
INSERT INTO livros (titulo, ano_publicacao, genero, autor_id, quantidade_em_estoque) VALUES
('Harry Potter e a Pedra Filosofal', 1997, 'Fantasia', 1, 5),
('1984', 1949, 'Distopia', 2, 3);

-- Inserir usuários
INSERT INTO usuarios (nome, email, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '2025-03-09'),
('Maria Oliveira', 'maria.oliveira@email.com', '2025-03-09');

-- Emprestar livros
INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2025-03-09', NULL),
(2, 2, '2025-03-09', NULL);

-- Atualizar data de devolução para um empréstimo
UPDATE emprestimos
SET data_devolucao = '2025-03-16'
WHERE id = 1;

-- Verificar o estoque após o empréstimo e a devolução
SELECT * FROM livros;
SELECT * FROM devolucoes;
