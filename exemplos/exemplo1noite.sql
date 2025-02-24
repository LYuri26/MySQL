-- 1. Criação do Banco de Dados
CREATE DATABASE biblioteca;
USE biblioteca;

-- 2. Criação das Tabelas
-- Tabela de Autores
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela de Livros
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor_id INT NOT NULL,
    ano_publicacao INT,
    genero VARCHAR(50),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Tabela de Usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela de Empréstimos
CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    livro_id INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- 3. Inserção de Dados
-- Inserindo 15 Autores
INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('Clarice Lispector', 'Brasileira'),
('Jorge Amado', 'Brasileira'),
('José Saramago', 'Portuguesa'),
('Gabriel García Márquez', 'Colombiana'),
('Jane Austen', 'Britânica'),
('George Orwell', 'Britânica'),
('Fiódor Dostoiévski', 'Russa'),
('Haruki Murakami', 'Japonesa'),
('Agatha Christie', 'Britânica'),
('J.K. Rowling', 'Britânica'),
('Stephen King', 'Americana'),
('Toni Morrison', 'Americana'),
('Chimamanda Ngozi Adichie', 'Nigeriana'),
('Paulo Coelho', 'Brasileira');

-- Inserindo 15 Livros
INSERT INTO livros (titulo, autor_id, ano_publicacao, genero) VALUES
('Dom Casmurro', 1, 1899, 'Romance'),
('A Hora da Estrela', 2, 1977, 'Romance'),
('Capitães da Areia', 3, 1937, 'Romance'),
('Ensaio sobre a Cegueira', 4, 1995, 'Ficção'),
('Cem Anos de Solidão', 5, 1967, 'Ficção'),
('Orgulho e Preconceito', 6, 1813, 'Romance'),
('1984', 7, 1949, 'Ficção Científica'),
('Crime e Castigo', 8, 1866, 'Romance'),
('Norwegian Wood', 9, 1987, 'Romance'),
('O Assassinato no Expresso do Oriente', 10, 1934, 'Mistério'),
('Harry Potter e a Pedra Filosofal', 11, 1997, 'Fantasia'),
('O Iluminado', 12, 1977, 'Terror'),
('Amada', 13, 1987, 'Romance'),
('Americanah', 14, 2013, 'Romance'),
('O Alquimista', 15, 1988, 'Ficção');

-- Inserindo 15 Usuários
INSERT INTO usuarios (nome, email, data_cadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '2023-10-01'),
('Carlos Oliveira', 'carlos.oliveira@email.com', '2023-10-02'),
('Mariana Costa', 'mariana.costa@email.com', '2023-10-03'),
('Pedro Santos', 'pedro.santos@email.com', '2023-10-04'),
('Luiza Mendes', 'luiza.mendes@email.com', '2023-10-05'),
('Fernando Lima', 'fernando.lima@email.com', '2023-10-06'),
('Juliana Alves', 'juliana.alves@email.com', '2023-10-07'),
('Ricardo Pereira', 'ricardo.pereira@email.com', '2023-10-08'),
('Camila Carvalho', 'camila.carvalho@email.com', '2023-10-09'),
('Bruno Gomes', 'bruno.gomes@email.com', '2023-10-10'),
('Patrícia Martins', 'patricia.martins@email.com', '2023-10-11'),
('Lucas Ribeiro', 'lucas.ribeiro@email.com', '2023-10-12'),
('Amanda Ferreira', 'amanda.ferreira@email.com', '2023-10-13'),
('Roberto Souza', 'roberto.souza@email.com', '2023-10-14'),
('Carla Rocha', 'carla.rocha@email.com', '2023-10-15');

-- Inserindo 15 Empréstimos
INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2023-10-05', '2023-10-12'),
(2, 2, '2023-10-06', '2023-10-13'),
(3, 3, '2023-10-07', '2023-10-14'),
(4, 4, '2023-10-08', NULL), -- Empréstimo ainda não devolvido
(5, 5, '2023-10-09', '2023-10-16'),
(6, 6, '2023-10-10', '2023-10-17'),
(7, 7, '2023-10-11', NULL), -- Empréstimo ainda não devolvido
(8, 8, '2023-10-12', '2023-10-19'),
(9, 9, '2023-10-13', '2023-10-20'),
(10, 10, '2023-10-14', NULL), -- Empréstimo ainda não devolvido
(11, 11, '2023-10-15', '2023-10-22'),
(12, 12, '2023-10-16', '2023-10-23'),
(13, 13, '2023-10-17', NULL), -- Empréstimo ainda não devolvido
(14, 14, '2023-10-18', '2023-10-25'),
(15, 15, '2023-10-19', '2023-10-26');

-- 4. Consultas de Dados
-- 1. Listar todos os autores
SELECT * FROM autores;

-- 2. Listar todos os livros
SELECT * FROM livros;

-- 3. Listar todos os usuários
SELECT * FROM usuarios;

-- 4. Listar todos os empréstimos
SELECT * FROM emprestimos;

-- 5. Listar livros de um autor específico (ex: Machado de Assis)
SELECT l.titulo, l.ano_publicacao, l.genero
FROM livros l
JOIN autores a ON l.autor_id = a.id
WHERE a.nome = 'Machado de Assis';

-- 6. Listar empréstimos ainda não devolvidos
SELECT e.id AS emprestimo_id, u.nome AS usuario_nome, l.titulo AS livro_titulo, e.data_emprestimo
FROM emprestimos e
JOIN usuarios u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id
WHERE e.data_devolucao IS NULL;

-- 7. Listar livros emprestados no mês de outubro de 2023
SELECT l.titulo, u.nome AS usuario_nome, e.data_emprestimo
FROM emprestimos e
JOIN livros l ON e.livro_id = l.id
JOIN usuarios u ON e.usuario_id = u.id
WHERE e.data_emprestimo BETWEEN '2023-10-01' AND '2023-10-31';

-- 8. Listar autores com mais de 1 livro cadastrado
SELECT a.nome, COUNT(l.id) AS total_livros
FROM autores a
JOIN livros l ON a.id = l.autor_id
GROUP BY a.id
HAVING COUNT(l.id) > 1;

-- 9. Listar usuários que nunca pegaram livros emprestados
SELECT u.nome
FROM usuarios u
LEFT JOIN emprestimos e ON u.id = e.usuario_id
WHERE e.usuario_id IS NULL;

-- 10. Listar livros mais emprestados
SELECT l.titulo, COUNT(e.id) AS total_emprestimos
FROM livros l
JOIN emprestimos e ON l.id = e.livro_id
GROUP BY l.id
ORDER BY total_emprestimos DESC;

-- 11. Listar livros publicados após o ano 2000
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao > 2000;

-- 12. Listar empréstimos com devolução atrasada (considerando 7 dias de prazo)
SELECT e.id AS emprestimo_id, u.nome AS usuario_nome, l.titulo AS livro_titulo, e.data_emprestimo, e.data_devolucao
FROM emprestimos e
JOIN usuarios u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id
WHERE e.data_devolucao IS NULL AND DATEDIFF(CURDATE(), e.data_emprestimo) > 7;

-- 13. Listar livros de um gênero específico (ex: Romance)
SELECT titulo, autor_id, ano_publicacao
FROM livros
WHERE genero = 'Romance';

-- 14. Listar autores ordenados por nacionalidade
SELECT nome, nacionalidade
FROM autores
ORDER BY nacionalidade;

-- 15. Listar usuários que pegaram mais de 1 livro emprestado
SELECT u.nome, COUNT(e.id) AS total_emprestimos
FROM usuarios u
JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.id
HAVING COUNT(e.id) > 1;

-- 16. Exclusão do Banco de Dados (Opcional)
-- DROP DATABASE biblioteca;