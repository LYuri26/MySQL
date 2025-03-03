-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oscar;
USE Oscar;

-- 1. Tabela MelhorFilme
CREATE TABLE IF NOT EXISTS MelhorFilme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votos INT DEFAULT 0
);

-- 2. Tabela MelhorDiretor
CREATE TABLE IF NOT EXISTS MelhorDiretor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 3. Tabela MelhorAtor
CREATE TABLE IF NOT EXISTS MelhorAtor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 4. Tabela MelhorAtriz
CREATE TABLE IF NOT EXISTS MelhorAtriz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 5. Tabela MelhorAtorCoadjuvante
CREATE TABLE IF NOT EXISTS MelhorAtorCoadjuvante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 6. Tabela MelhorAtrizCoadjuvante
CREATE TABLE IF NOT EXISTS MelhorAtrizCoadjuvante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 7. Tabela MelhorRoteiroOriginal
CREATE TABLE IF NOT EXISTS MelhorRoteiroOriginal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 8. Tabela MelhorRoteiroAdaptado
CREATE TABLE IF NOT EXISTS MelhorRoteiroAdaptado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 9. Tabela MelhorFilmeInternacional
CREATE TABLE IF NOT EXISTS MelhorFilmeInternacional (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    votos INT DEFAULT 0
);

-- 10. Tabela MelhorAnimacao
CREATE TABLE IF NOT EXISTS MelhorAnimacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votos INT DEFAULT 0
);

-- 11. Tabela MelhorDocumentario
CREATE TABLE IF NOT EXISTS MelhorDocumentario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votos INT DEFAULT 0
);

-- 12. Tabela MelhorCurtaMetragem
CREATE TABLE IF NOT EXISTS MelhorCurtaMetragem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    votos INT DEFAULT 0
);

-- 13. Tabela MelhorTrilhaSonora
CREATE TABLE IF NOT EXISTS MelhorTrilhaSonora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 14. Tabela MelhorCançãoOriginal
CREATE TABLE IF NOT EXISTS MelhorCançãoOriginal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 15. Tabela MelhorFigurino
CREATE TABLE IF NOT EXISTS MelhorFigurino (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 16. Tabela MelhorMaquiagemEPenteados
CREATE TABLE IF NOT EXISTS MelhorMaquiagemEPenteados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 17. Tabela MelhorDirecaoDeArte
CREATE TABLE IF NOT EXISTS MelhorDirecaoDeArte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 18. Tabela MelhorFotografia
CREATE TABLE IF NOT EXISTS MelhorFotografia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 19. Tabela MelhorEdicao
CREATE TABLE IF NOT EXISTS MelhorEdicao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- 20. Tabela MelhoresEfeitosVisuais
CREATE TABLE IF NOT EXISTS MelhoresEfeitosVisuais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    filme_id INT,
    votos INT DEFAULT 0,
    FOREIGN KEY (filme_id) REFERENCES MelhorFilme(id)
);

-- Criação da Tabela Vencedores
CREATE TABLE IF NOT EXISTS Vencedores (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do vencedor
    categoria VARCHAR(255) NOT NULL UNIQUE,   -- Nome da categoria (ex: "Melhor Filme", "Melhor Diretor")
    vencedor_nome VARCHAR(255) NOT NULL, -- Nome do vencedor (filme, diretor, ator, etc.)
    votos INT NOT NULL                 -- Quantidade de votos recebidos
);