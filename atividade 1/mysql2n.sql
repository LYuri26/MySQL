-- Exercício 1: Gerenciamento de Acervo de Filmes

-- 1. Criar o banco de dados
CREATE DATABASE videoteca;
USE videoteca;

-- 2. Criar as tabelas
CREATE TABLE diretores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(50),
    diretor_id INT,
    FOREIGN KEY (diretor_id) REFERENCES diretores(id)
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE locacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    filme_id INT NOT NULL,
    data_locacao DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

-- 3. Inserir dados de exemplo
INSERT INTO diretores (nome, nacionalidade) VALUES
('Steven Spielberg', 'Americano'),
('Quentin Tarantino', 'Americano'),
('Christopher Nolan', 'Britânico');

INSERT INTO filmes (titulo, ano_lancamento, genero, diretor_id) VALUES
('O Poderoso Chefão', 1972, 'Drama', 1),
('Pulp Fiction', 1994, 'Crime', 2),
('Interestelar', 2014, 'Ficção Científica', 3),
('Cidade de Deus', 2002, 'Drama', 1),
('Clube da Luta', 1999, 'Drama', 2);

INSERT INTO clientes (nome, email, data_cadastro) VALUES
('Lucas Almeida', 'lucas@email.com', '2023-10-01'),
('Fernanda Costa', 'fernanda@email.com', '2023-10-02'),
('Rafael Souza', 'rafael@email.com', '2023-10-03');

INSERT INTO locacoes (cliente_id, filme_id, data_locacao, data_devolucao) VALUES
(1, 1, '2023-11-05', '2023-11-12'),
(2, 2, '2023-11-06', '2023-11-13'),
(3, 3, '2023-11-07', NULL),
(1, 4, '2023-11-08', '2023-11-15'),
(2, 5, '2023-11-09', NULL);

-- 4. Consultas
-- Listar todos os filmes locados no mês de novembro de 2023
SELECT f.titulo, l.data_locacao
FROM locacoes l
JOIN filmes f ON l.filme_id = f.id
WHERE l.data_locacao BETWEEN '2023-11-01' AND '2023-11-30';

-- Encontrar o filme mais locado
SELECT f.titulo, COUNT(l.id) AS total_locacoes
FROM locacoes l
JOIN filmes f ON l.filme_id = f.id
GROUP BY f.id
ORDER BY total_locacoes DESC
LIMIT 1;

-- Listar clientes que nunca locaram filmes
SELECT c.nome
FROM clientes c
LEFT JOIN locacoes l ON c.id = l.cliente_id
WHERE l.cliente_id IS NULL;

-- Calcular a média de filmes locados por cliente
SELECT AVG(total_locacoes) AS media_locacoes_por_cliente
FROM (
    SELECT cliente_id, COUNT(id) AS total_locacoes
    FROM locacoes
    GROUP BY cliente_id
) AS locacoes_por_cliente;

-- Exercício 2: Sistema de Pedidos de Restaurante

-- 1. Criar o banco de dados
CREATE DATABASE restaurante;
USE restaurante;

-- 2. Criar as tabelas
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE pratos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    prato_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (prato_id) REFERENCES pratos(id)
);

-- 3. Inserir dados de exemplo
INSERT INTO clientes (nome, email, data_cadastro) VALUES
('Juliana Lima', 'juliana@email.com', '2023-10-01'),
('Pedro Santos', 'pedro@email.com', '2023-10-02'),
('Amanda Ribeiro', 'amanda@email.com', '2023-10-03');

INSERT INTO pratos (nome, preco, categoria) VALUES
('Bruschetta', 15.00, 'Entrada'),
('Filé Mignon', 80.00, 'Principal'),
('Risoto de Cogumelos', 50.00, 'Principal'),
('Tiramisu', 20.00, 'Sobremesa'),
('Cheesecake', 25.00, 'Sobremesa');

INSERT INTO pedidos (cliente_id, data_pedido, total) VALUES
(1, '2023-10-05', 95.00),
(2, '2023-10-06', 130.00),
(3, '2023-10-07', 75.00);

INSERT INTO itens_pedido (pedido_id, prato_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 15.00),
(1, 2, 1, 80.00),
(2, 3, 2, 50.00),
(3, 4, 1, 20.00),
(3, 5, 1, 25.00);

-- 4. Consultas
-- Listar os 3 pratos mais pedidos
SELECT p.nome, SUM(ip.quantidade) AS total_pedidos
FROM itens_pedido ip
JOIN pratos p ON ip.prato_id = p.id
GROUP BY p.id
ORDER BY total_pedidos DESC
LIMIT 3;

-- Calcular o total de vendas por cliente
SELECT c.nome, SUM(p.total) AS total_vendas
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.id;

-- Encontrar o pedido mais caro
SELECT id, MAX(total) AS pedido_mais_caro
FROM pedidos;

-- Listar pratos que nunca foram pedidos
SELECT p.nome
FROM pratos p
LEFT JOIN itens_pedido ip ON p.id = ip.prato_id
WHERE ip.prato_id IS NULL;

-- Exercício 3: Gestão de Alunos e Cursos

-- 1. Criar o banco de dados
CREATE DATABASE escola;
USE escola;

-- 2. Criar as tabelas
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(50)
);

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professores(id)
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_matricula DATE NOT NULL
);

CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- 3. Inserir dados de exemplo
INSERT INTO professores (nome, departamento) VALUES
('Carlos Mendes', 'Matemática'),
('Ana Paula', 'História'),
('Roberto Alves', 'Biologia');

INSERT INTO cursos (nome, professor_id) VALUES
('Matemática', 1),
('História', 2),
('Biologia', 3);

INSERT INTO alunos (nome, data_matricula) VALUES
('Larissa Silva', '2023-10-01'),
('Gabriel Oliveira', '2023-10-02'),
('Mariana Costa', '2023-10-03'),
('Rafael Souza', '2023-10-04'),
('Camila Lima', '2023-10-05');

INSERT INTO matriculas (aluno_id, curso_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

-- 4. Consultas
-- Listar os alunos de um curso específico
SELECT a.nome
FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id
WHERE m.curso_id = 1;

-- Contar o número de alunos matriculados em cada curso
SELECT c.nome, COUNT(m.aluno_id) AS total_alunos
FROM cursos c
LEFT JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id;

-- Encontrar o curso com mais alunos matriculados
SELECT c.nome, COUNT(m.aluno_id) AS total_alunos
FROM cursos c
JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id
ORDER BY total_alunos DESC
LIMIT 1;

-- Listar alunos que não estão matriculados em nenhum curso
SELECT a.nome
FROM alunos a
LEFT JOIN matriculas m ON a.id = m.aluno_id
WHERE m.aluno_id IS NULL;

-- Exercício 4: Sistema de Agendamento de Consultas Médicas

-- 1. Criar o banco de dados
CREATE DATABASE clinica_medica;
USE clinica_medica;

-- 2. Criar as tabelas
CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    consulta_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);

-- 3. Inserir dados de exemplo
INSERT INTO pacientes (nome, email, telefone) VALUES
('Lucas Almeida', 'lucas@email.com', '11999999999'),
('Fernanda Costa', 'fernanda@email.com', '11988888888'),
('Rafael Souza', 'rafael@email.com', '11977777777');

INSERT INTO medicos (nome, especialidade) VALUES
('Dr. Carlos Mendes', 'Cardiologista'),
('Dra. Ana Paula', 'Dermatologista'),
('Dr. Roberto Alves', 'Ortopedista');

INSERT INTO consultas (paciente_id, medico_id, data_consulta, horario) VALUES
(1, 1, '2023-11-10', '10:00'),
(2, 2, '2023-11-11', '11:00'),
(3, 3, '2023-11-12', '12:00');

INSERT INTO pagamentos (consulta_id, valor, data_pagamento) VALUES
(1, 200.00, '2023-11-10'),
(2, 150.00, '2023-11-11'),
(3, 180.00, '2023-11-12');

-- 4. Consultas
-- Listar todas as consultas agendadas para novembro de 2023
SELECT c.data_consulta, c.horario, p.nome AS paciente, m.nome AS medico
FROM consultas c
JOIN pacientes p ON c.paciente_id = p.id
JOIN medicos m ON c.medico_id = m.id
WHERE c.data_consulta BETWEEN '2023-11-01' AND '2023-11-30';

-- Calcular o total de pagamentos recebidos por mês
SELECT MONTH(data_pagamento) AS mes, SUM(valor) AS total_pagamentos
FROM pagamentos
GROUP BY mes;

-- Encontrar o médico com mais consultas agendadas
SELECT m.nome, COUNT(c.id) AS total_consultas
FROM consultas c
JOIN medicos m ON c.medico_id = m.id
GROUP BY m.id
ORDER BY total_consultas DESC
LIMIT 1;

-- Listar pacientes que nunca agendaram consultas
SELECT p.nome
FROM pacientes p
LEFT JOIN consultas c ON p.id = c.paciente_id
WHERE c.paciente_id IS NULL;

-- Exercício 5: Controle de Estoque de Farmácia

-- 1. Criar o banco de dados
CREATE DATABASE farmacia;
USE farmacia;

-- 2. Criar as tabelas
CREATE TABLE medicamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE entradas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicamento_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    quantidade INT NOT NULL,
    data_entrada DATE NOT NULL,
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

CREATE TABLE saidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicamento_id INT NOT NULL,
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id)
);

-- 3. Inserir dados de exemplo
INSERT INTO medicamentos (nome, quantidade_estoque) VALUES
('Paracetamol', 100),
('Ibuprofeno', 50),
('Amoxicilina', 75),
('Dipirona', 120),
('Omeprazol', 90);

INSERT INTO fornecedores (nome, telefone) VALUES
('Fornecedor X', '11999999999'),
('Fornecedor Y', '11988888888'),
('Fornecedor Z', '11977777777');

INSERT INTO entradas (medicamento_id, fornecedor_id, quantidade, data_entrada) VALUES
(1, 1, 50, '2023-10-01'),
(2, 2, 30, '2023-10-02'),
(3, 3, 25, '2023-10-03'),
(4, 1, 40, '2023-10-04'),
(5, 2, 20, '2023-10-05');

INSERT INTO saidas (medicamento_id, quantidade, data_saida) VALUES
(1, 10, '2023-10-06'),
(2, 5, '2023-10-07'),
(3, 15, '2023-10-08');

-- 4. Consultas
-- Calcular o total de medicamentos em estoque
SELECT nome, quantidade_estoque
FROM medicamentos;

-- Listar os medicamentos com estoque abaixo de 10 unidades
SELECT nome, quantidade_estoque
FROM medicamentos
WHERE quantidade_estoque < 10;

-- Encontrar o fornecedor que mais forneceu medicamentos
SELECT f.nome, SUM(e.quantidade) AS total_fornecido
FROM entradas e
JOIN fornecedores f ON e.fornecedor_id = f.id
GROUP BY f.id
ORDER BY total_fornecido DESC
LIMIT 1;

-- Listar medicamentos que nunca tiveram saída de estoque
SELECT m.nome
FROM medicamentos m
LEFT JOIN saidas s ON m.id = s.medicamento_id
WHERE s.medicamento_id IS NULL;