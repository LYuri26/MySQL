CREATE DATABASE oscardb;

USE oscardb;

-- Tabela Diretores
CREATE TABLE Diretores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Filme INT
);

-- Tabela Filmes
CREATE TABLE Filmes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    Lancamento DATE
);

-- Tabela Atores
CREATE TABLE Atores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Diretor INT,
    ID_Filme INT,
    Coadjuvante BOOLEAN
);

-- Tabela MelhorFilme
CREATE TABLE MelhorFilme (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorDiretor
CREATE TABLE MelhorDiretor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Diretor INT
);

-- Tabela MelhorAtor
CREATE TABLE MelhorAtor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Ator INT
);

-- Tabela MelhorAtriz
CREATE TABLE MelhorAtriz (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Atriz INT
);

-- Tabela MelhorAtorCoadjuvante
CREATE TABLE MelhorAtorCoadjuvante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Ator INT
);

-- Tabela MelhorAtrizCoadjuvante
CREATE TABLE MelhorAtrizCoadjuvante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Atriz INT
);

-- Tabela MelhorRoteiroOriginal
CREATE TABLE MelhorRoteiroOriginal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorRoteiroAdaptado
CREATE TABLE MelhorRoteiroAdaptado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorFilmeAnimacao
CREATE TABLE MelhorFilmeAnimacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorFilmeInternacional
CREATE TABLE MelhorFilmeInternacional (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorDocumentarioLonga
CREATE TABLE MelhorDocumentarioLonga (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorDocumentarioCurta
CREATE TABLE MelhorDocumentarioCurta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorCurtaLiveAction
CREATE TABLE MelhorCurtaLiveAction (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorCurtaAnimacao
CREATE TABLE MelhorCurtaAnimacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorTrilhaSonora
CREATE TABLE MelhorTrilhaSonora (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorCancaoOriginal
CREATE TABLE MelhorCancaoOriginal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorSom
CREATE TABLE MelhorSom (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorDesignProducao
CREATE TABLE MelhorDesignProducao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorFotografia
CREATE TABLE MelhorFotografia (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorMaquiagemPenteados
CREATE TABLE MelhorMaquiagemPenteados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorFigurino
CREATE TABLE MelhorFigurino (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhorEdicao
CREATE TABLE MelhorEdicao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela MelhoresEfeitosVisuais
CREATE TABLE MelhoresEfeitosVisuais (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT
);

-- Tabela CadastroUsuario
CREATE TABLE CadastroUsuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Idade INT,
    Sexo VARCHAR(10),
    Data_de_Nascimento DATE,
    Senha VARCHAR(255),
    Usuario VARCHAR(255)
);
