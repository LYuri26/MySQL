-- Exercício 1: Gerenciamento de Biblioteca
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT NOT NULL,
    genero VARCHAR(50),
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    livro_id INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('Clarice Lispector', 'Brasileira'),
('Jorge Amado', 'Brasileiro');

INSERT INTO livros (titulo, ano_publicacao, genero, autor_id) VALUES
('Dom Casmurro', 1899, 'Romance', 1),
('A Hora da Estrela', 1977, 'Ficção', 2),
('Cem Anos de Solidão', 1967, 'Realismo Mágico', 3),
('Ensaio sobre a Cegueira', 1995, 'Ficção', 3),
('1984', 1949, 'Distopia', 2);

INSERT INTO usuarios (nome, email, data_cadastro) VALUES
('João Silva', 'joao@email.com', '2023-01-15'),
('Maria Oliveira', 'maria@email.com', '2023-02-20'),
('Carlos Souza', 'carlos@email.com', '2023-03-10');

INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2023-10-01', '2023-10-10'),
(2, 2, '2023-10-05', '2023-10-15'),
(3, 3, '2023-10-10', NULL),
(1, 4, '2023-10-15', '2023-10-25'),
(2, 5, '2023-10-20', NULL);

-- Consultas
SELECT * FROM emprestimos WHERE MONTH(data_emprestimo) = 10 AND YEAR(data_emprestimo) = 2023;
SELECT livro_id, COUNT(*) AS total FROM emprestimos GROUP BY livro_id ORDER BY total DESC LIMIT 1;
SELECT * FROM usuarios WHERE id NOT IN (SELECT DISTINCT usuario_id FROM emprestimos);
SELECT AVG(emprestimos_por_usuario) FROM (SELECT COUNT(*) AS emprestimos_por_usuario FROM emprestimos GROUP BY usuario_id) AS subquery;

-- Exercício 2: Sistema de Vendas Online
CREATE DATABASE loja_online;
USE loja_online;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email, data_cadastro) VALUES
('Ana Silva', 'ana@email.com', '2023-01-15'),
('Carlos Oliveira', 'carlos@email.com', '2023-02-20'),
('Mariana Costa', 'mariana@email.com', '2023-03-10');

INSERT INTO produtos (nome, preco, quantidade_estoque) VALUES
('Notebook Dell', 5000.00, 10),
('Smartphone Samsung', 2000.00, 15),
('Tablet Apple', 3000.00, 5),
('Monitor LG', 1500.00, 8),
('Teclado Mecânico', 400.00, 20);

INSERT INTO pedidos (data_pedido, valor_total, cliente_id) VALUES
('2023-10-05', 7000.00, 1),
('2023-10-10', 3000.00, 2),
('2023-10-15', 5500.00, 3);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 5000.00),
(1, 2, 1, 2000.00),
(2, 3, 1, 3000.00),
(3, 4, 2, 1500.00),
(3, 5, 5, 400.00);

-- Consultas
SELECT produto_id, COUNT(*) AS total_vendido FROM itens_pedido GROUP BY produto_id ORDER BY total_vendido DESC LIMIT 3;
SELECT cliente_id, SUM(valor_total) AS total_gasto FROM pedidos GROUP BY cliente_id;
SELECT * FROM pedidos ORDER BY valor_total DESC LIMIT 1;
SELECT * FROM produtos WHERE id NOT IN (SELECT DISTINCT produto_id FROM itens_pedido);

-- Exercício 3: Gestão de Funcionários
CREATE DATABASE gestao_empresa;
USE gestao_empresa;

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcionario_responsavel INT,
    FOREIGN KEY (funcionario_responsavel) REFERENCES funcionarios(id)
);

CREATE TABLE alocacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    projeto_id INT,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);

INSERT INTO departamentos (nome) VALUES
('TI'), ('RH'), ('Vendas');

INSERT INTO funcionarios (nome, departamento_id) VALUES
('Fernando Lima', 1),
('Juliana Alves', 1),
('Ricardo Pereira', 2),
('Camila Carvalho', 3),
('Bruno Gomes', 3);

INSERT INTO projetos (nome, funcionario_responsavel) VALUES
('Sistema de Gestão', 1),
('Campanha Publicitária', 3),
('Expansão de Mercado', 5);

INSERT INTO alocacoes (funcionario_id, projeto_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 3), (5, 3);

-- Consultas
SELECT * FROM funcionarios WHERE departamento_id = 1;
SELECT projeto_id, COUNT(*) AS total_funcionarios FROM alocacoes GROUP BY projeto_id;
SELECT projeto_id FROM alocacoes GROUP BY projeto_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT * FROM funcionarios WHERE id NOT IN (SELECT DISTINCT funcionario_id FROM alocacoes);
-- EXERCÍCIO 4: Sistema de Reservas de Hotéis
-- Criação do banco de dados
CREATE DATABASE reservas_hotel;

-- Selecionar o banco de dados
USE reservas_hotel;

-- Criação das tabelas
CREATE TABLE hospedes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE quartos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    preco_diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_hospede INT,
    id_quarto INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (id_hospede) REFERENCES hospedes(id),
    FOREIGN KEY (id_quarto) REFERENCES quartos(id)
);

CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id)
);

-- Inserção de dados de exemplo

-- Hóspedes
INSERT INTO hospedes (nome, email, telefone) VALUES
('Ana Silva', 'ana.silva@email.com', '999999999'),
('Carlos Oliveira', 'carlos.oliveira@email.com', '988888888'),
('Mariana Costa', 'mariana.costa@email.com', '977777777');

-- Quartos
INSERT INTO quartos (numero, tipo, preco_diaria) VALUES
(101, 'Simples', 150.00),
(102, 'Duplo', 250.00),
(103, 'Suíte', 500.00),
(104, 'Simples', 150.00),
(105, 'Duplo', 250.00);

-- Reservas
INSERT INTO reservas (id_hospede, id_quarto, check_in, check_out) VALUES
(1, 1, '2023-10-01', '2023-10-05'),
(2, 2, '2023-10-10', '2023-10-15'),
(3, 3, '2023-10-20', '2023-10-25');

-- Pagamentos
INSERT INTO pagamentos (id_reserva, valor, data_pagamento) VALUES
(1, 600.00, '2023-10-03'),
(2, 1000.00, '2023-10-12'),
(3, 2500.00, '2023-10-22');

-- Consultas solicitadas

-- 1. Listar todas as reservas feitas em outubro de 2023
SELECT r.id AS reserva_id, h.nome AS hospede_nome, q.numero AS quarto_numero, r.check_in, r.check_out
FROM reservas r
JOIN hospedes h ON r.id_hospede = h.id
JOIN quartos q ON r.id_quarto = q.id
WHERE r.check_in BETWEEN '2023-10-01' AND '2023-10-31';

-- 2. Calcular o total de pagamentos recebidos por mês
SELECT MONTH(data_pagamento) AS mes, SUM(valor) AS total_pagamento
FROM pagamentos
GROUP BY MONTH(data_pagamento);

-- 3. Encontrar o quarto mais reservado
SELECT q.numero AS quarto_numero, COUNT(r.id) AS total_reservas
FROM reservas r
JOIN quartos q ON r.id_quarto = q.id
GROUP BY q.numero
ORDER BY total_reservas DESC
LIMIT 1;

-- 4. Listar hóspedes que nunca fizeram uma reserva
SELECT h.nome
FROM hospedes h
LEFT JOIN reservas r ON h.id = r.id_hospede
WHERE r.id IS NULL;

-- EXERCÍCIO 5: Controle de Estoque
-- Criação do banco de dados
CREATE DATABASE controle_estoque;

-- Selecionar o banco de dados
USE controle_estoque;

-- Criação das tabelas
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE entradas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_fornecedor INT,
    quantidade INT NOT NULL,
    data_entrada DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE saídas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Inserção de dados de exemplo

-- Produtos
INSERT INTO produtos (nome, quantidade) VALUES
('Notebook Dell', 50),
('Smartphone Samsung', 100),
('Tablet Apple', 75),
('Monitor LG', 30),
('Teclado Mecânico', 150);

-- Fornecedores
INSERT INTO fornecedores (nome, telefone) VALUES
('Fornecedor A', '999999999'),
('Fornecedor B', '988888888'),
('Fornecedor C', '977777777');

-- Entradas
INSERT INTO entradas (id_produto, id_fornecedor, quantidade, data_entrada) VALUES
(1, 1, 30, '2023-02-01'),
(2, 2, 50, '2023-03-15'),
(3, 3, 40, '2023-04-10'),
(4, 1, 20, '2023-05-05'),
(5, 2, 60, '2023-06-20');

-- Saídas
INSERT INTO saídas (id_produto, quantidade, data_saida) VALUES
(1, 10, '2023-02-10'),
(2, 30, '2023-03-20'),
(3, 20, '2023-04-15');

-- Consultas solicitadas

-- 1. Calcular o total de produtos em estoque
SELECT SUM(quantidade) AS total_estoque FROM produtos;

-- 2. Listar os produtos com estoque abaixo de 10 unidades
SELECT nome, quantidade FROM produtos WHERE quantidade < 10;

-- 3. Encontrar o fornecedor que mais forneceu produtos
SELECT f.nome, SUM(e.quantidade) AS total_fornecido
FROM entradas e
JOIN fornecedores f ON e.id_fornecedor = f.id
GROUP BY f.nome
ORDER BY total_fornecido DESC
LIMIT 1;

-- 4. Listar produtos que nunca tiveram saída de estoque
SELECT p.nome
FROM produtos p
LEFT JOIN saídas s ON p.id = s.id_produto
WHERE s.id_produto IS NULL;
