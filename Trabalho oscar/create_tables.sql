-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oscar2010;
USE Oscar2010;
-- Tabela para Melhor Filme
CREATE TABLE IF NOT EXISTS MelhorFilme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votacao INT DEFAULT 0
);

-- Tabela para Melhor Diretor
CREATE TABLE IF NOT EXISTS MelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Ator
CREATE TABLE IF NOT EXISTS MelhorAtor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Atriz
CREATE TABLE IF NOT EXISTS MelhorAtriz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Ator Coadjuvante
CREATE TABLE IF NOT EXISTS MelhorAtorCoadjuvante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Atriz Coadjuvante
CREATE TABLE IF NOT EXISTS MelhorAtrizCoadjuvante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Roteiro Original
CREATE TABLE IF NOT EXISTS MelhorRoteiroOriginal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votacao INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Tabela para Melhor Filme de Animação
CREATE TABLE IF NOT EXISTS MelhorFilmeAnimacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votacao INT DEFAULT 0
);

-- Tabela para armazenar vencedores
CREATE TABLE IF NOT EXISTS Vencedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    votos INT NOT NULL,
    UNIQUE KEY unique_categoria (categoria)
);