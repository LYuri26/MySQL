-- Criação do Banco de Dados
CREATE DATABASE videoteca;
USE videoteca;

-- Criação das Tabelas
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
    estoque INT DEFAULT 10,  -- Definindo 10 cópias por filme inicialmente
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

ALTER TABLE filmes ADD COLUMN estoque INT DEFAULT 0;

-- Inserção de Dados de Exemplo
-- Inserir Diretores
INSERT INTO diretores (nome, nacionalidade) VALUES
('Steven Spielberg', 'Americana'),
('Christopher Nolan', 'Britânica'),
('Quentin Tarantino', 'Americana');

-- Inserir Filmes com Estoque
INSERT INTO filmes (titulo, ano_lancamento, genero, diretor_id, estoque) VALUES
('Jurassic Park', 1993, 'Aventura', 1, 10),
('Inception', 2010, 'Ficção científica', 2, 10),
('Pulp Fiction', 1994, 'Crime', 3, 10);

-- Inserir Clientes
INSERT INTO clientes (nome, email, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '2023-11-01'),
('Maria Souza', 'maria.souza@email.com', '2023-11-02'),
('Carlos Oliveira', 'carlos.oliveira@email.com', '2023-11-03');

-- Inserir Locações
INSERT INTO locacoes (cliente_id, filme_id, data_locacao, data_devolucao) VALUES
(1, 1, '2023-11-05', '2023-11-10'),
(2, 2, '2023-11-06', '2023-11-12'),
(3, 3, '2023-11-07', '2023-11-13');

-- Triggers para Atualizar o Estoque

DELIMITER $$

-- Trigger para Reduzir o Estoque ao Locar um Filme
CREATE TRIGGER trg_estoque_locacao
AFTER INSERT ON locacoes
FOR EACH ROW
BEGIN
    UPDATE filmes
    SET estoque = estoque - 1
    WHERE id = NEW.filme_id;
END$$

-- Trigger para Restaurar o Estoque ao Cancelar uma Locação
CREATE TRIGGER trg_estoque_cancelamento
AFTER DELETE ON locacoes
FOR EACH ROW
BEGIN
    UPDATE filmes
    SET estoque = estoque + 1
    WHERE id = OLD.filme_id;
END$$

DELIMITER ;

-- Consultas para Verificar os Resultados

-- Verificando Estoque após Locação
SELECT * FROM filmes;

-- Verificando Estoque após Cancelamento de Locação
-- Excluir uma locação para simular um cancelamento
DELETE FROM locacoes WHERE id = 1;

-- Verificando Estoque após Exclusão
SELECT * FROM filmes;