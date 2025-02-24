-- 5. Uso de Funções Agregadas
-- 1. Contar o número total de pedidos
SELECT COUNT(*) AS total_pedidos FROM pedidos;

-- 2. Calcular a soma total de vendas
SELECT SUM(total) AS total_vendas FROM pedidos;

-- 3. Calcular a média de valores dos pedidos
SELECT AVG(total) AS media_valor_pedidos FROM pedidos;

-- 4. Encontrar o pedido mais caro
SELECT id, MAX(total) AS pedido_mais_caro FROM pedidos;

-- 5. Encontrar o pedido mais barato
SELECT id, MIN(total) AS pedido_mais_barato FROM pedidos;

-- 6. Contar o número de itens por pedido
SELECT pedido_id, COUNT(*) AS total_itens
FROM itens_pedido
GROUP BY pedido_id;

-- 6. Modificação de Tabelas
-- 1. Adicionar uma nova coluna à tabela de clientes para armazenar o telefone
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(15);

-- 2. Modificar o tipo de dados da coluna telefone para VARCHAR(20)
ALTER TABLE clientes MODIFY COLUMN telefone VARCHAR(20);

-- 3. Excluir a coluna telefone da tabela de clientes
ALTER TABLE clientes DROP COLUMN telefone;

-- 7. Exclusão de Tabelas
-- Excluir uma tabela de teste (se existir)
CREATE TABLE teste (id INT);
DROP TABLE teste;

-- 8. Chaves Primárias e Estrangeiras
-- 1. Adicionar uma chave primária composta à tabela de itens_pedido (exemplo hipotético)
ALTER TABLE itens_pedido DROP PRIMARY KEY;
ALTER TABLE itens_pedido ADD PRIMARY KEY (pedido_id, produto_id);

-- 2. Adicionar uma nova tabela para categorias de produtos
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- 3. Adicionar uma coluna de categoria_id à tabela de produtos
ALTER TABLE produtos ADD COLUMN categoria_id INT;

-- 4. Definir uma chave estrangeira para a coluna categoria_id
ALTER TABLE produtos
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria_id) REFERENCES categorias(id);

-- 5. Inserir algumas categorias
INSERT INTO categorias (nome) VALUES
('Eletrônicos'),
('Informática'),
('Acessórios'),
('Periféricos'),
('Impressão');

-- 6. Atualizar alguns produtos com categorias
UPDATE produtos SET categoria_id = 1 WHERE id IN (1, 2, 3);
UPDATE produtos SET categoria_id = 2 WHERE id IN (4, 5, 6);
UPDATE produtos SET categoria_id = 3 WHERE id IN (7, 8, 9);
UPDATE produtos SET categoria_id = 4 WHERE id IN (10, 11, 12);
UPDATE produtos SET categoria_id = 5 WHERE id IN (13, 14, 15);

-- 9. Consultas com Chaves Estrangeiras
-- 1. Listar produtos com suas categorias
SELECT p.nome AS produto, c.nome AS categoria
FROM produtos p
JOIN categorias c ON p.categoria_id = c.id;

-- 2. Contar o número de produtos por categoria
SELECT c.nome AS categoria, COUNT(p.id) AS total_produtos
FROM categorias c
LEFT JOIN produtos p ON c.id = p.categoria_id
GROUP BY c.id;

-- 10. Exclusão de Chaves Estrangeiras
-- Remover a chave estrangeira da tabela de produtos
ALTER TABLE produtos DROP FOREIGN KEY fk_categoria;

-- 11. Exclusão de Tabelas com Chaves Estrangeiras
-- Excluir a tabela de categorias (após remover a chave estrangeira)
DROP TABLE categorias;

-- 12. Exclusão do Banco de Dados (Opcional)
-- DROP DATABASE loja_online;