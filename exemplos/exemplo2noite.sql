-- 5. Uso de Funções Agregadas
-- 1. Contar o número total de livros na biblioteca
SELECT COUNT(*) AS total_livros FROM livros;

-- 2. Calcular a soma dos preços de todos os livros (se houvesse uma coluna de preço)
-- Exemplo hipotético: Adicionando uma coluna de preço à tabela livros
ALTER TABLE livros ADD COLUMN preco DECIMAL(10, 2);

-- Atualizando alguns livros com preços fictícios
UPDATE livros SET preco = 50.00 WHERE id = 1;
UPDATE livros SET preco = 60.00 WHERE id = 2;
UPDATE livros SET preco = 70.00 WHERE id = 3;

-- Agora, calcular a soma dos preços
SELECT SUM(preco) AS total_preco_livros FROM livros;

-- 3. Calcular a média de preços dos livros
SELECT AVG(preco) AS media_preco_livros FROM livros;

-- 4. Encontrar o livro mais caro
SELECT titulo, MAX(preco) AS preco_maximo FROM livros;

-- 5. Encontrar o livro mais barato
SELECT titulo, MIN(preco) AS preco_minimo FROM livros;

-- 6. Contar o número de empréstimos por usuário
SELECT u.nome, COUNT(e.id) AS total_emprestimos
FROM usuarios u
LEFT JOIN emprestimos e ON u.id = e.usuario_id
GROUP BY u.id;

-- 6. Modificação de Tabelas
-- 1. Adicionar uma nova coluna à tabela de usuários para armazenar o telefone
ALTER TABLE usuarios ADD COLUMN telefone VARCHAR(15);

-- 2. Modificar o tipo de dados da coluna telefone para VARCHAR(20)
ALTER TABLE usuarios MODIFY COLUMN telefone VARCHAR(20);

-- 3. Excluir a coluna telefone da tabela de usuários
ALTER TABLE usuarios DROP COLUMN telefone;

-- 7. Exclusão de Tabelas
-- Excluir uma tabela de teste (se existir)
CREATE TABLE teste (id INT);
DROP TABLE teste;

-- 8. Chaves Primárias e Estrangeiras
-- 1. Adicionar uma chave primária composta à tabela de empréstimos (exemplo hipotético)
ALTER TABLE emprestimos DROP PRIMARY KEY;
ALTER TABLE emprestimos ADD PRIMARY KEY (usuario_id, livro_id);

-- 2. Adicionar uma nova tabela para categorias de livros
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- 3. Adicionar uma coluna de categoria_id à tabela de livros
ALTER TABLE livros ADD COLUMN categoria_id INT;

-- 4. Definir uma chave estrangeira para a coluna categoria_id
ALTER TABLE livros
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria_id) REFERENCES categorias(id);

-- 5. Inserir algumas categorias
INSERT INTO categorias (nome) VALUES
('Ficção'),
('Romance'),
('Terror'),
('Fantasia'),
('Mistério');

-- 6. Atualizar alguns livros com categorias
UPDATE livros SET categoria_id = 1 WHERE id IN (1, 2, 3);
UPDATE livros SET categoria_id = 2 WHERE id IN (4, 5, 6);
UPDATE livros SET categoria_id = 3 WHERE id = 7;
UPDATE livros SET categoria_id = 4 WHERE id = 8;
UPDATE livros SET categoria_id = 5 WHERE id = 9;

-- 9. Consultas com Chaves Estrangeiras
-- 1. Listar livros com suas categorias
SELECT l.titulo, c.nome AS categoria
FROM livros l
JOIN categorias c ON l.categoria_id = c.id;

-- 2. Contar o número de livros por categoria
SELECT c.nome AS categoria, COUNT(l.id) AS total_livros
FROM categorias c
LEFT JOIN livros l ON c.id = l.categoria_id
GROUP BY c.id;

-- 10. Exclusão de Chaves Estrangeiras
-- Remover a chave estrangeira da tabela de livros
ALTER TABLE livros DROP FOREIGN KEY fk_categoria;

-- 11. Exclusão de Tabelas com Chaves Estrangeiras
-- Excluir a tabela de categorias (após remover a chave estrangeira)
DROP TABLE categorias;

-- 12. Exclusão do Banco de Dados (Opcional)
-- DROP DATABASE biblioteca;