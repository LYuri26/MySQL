CREATE DATABASE oscardb;

USE oscardb;

CREATE TABLE Diretores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Filme INT
);

CREATE TABLE Filmes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Roteiro INT,
    Lancamento DATE
);

CREATE TABLE Atores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Diretor INT,
    ID_Filme INT,
    Coadjuvante BOOLEAN
);

CREATE TABLE MelhorFilme (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorFilme_Voto_Soma INT
);

CREATE TABLE MelhorDiretor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Diretor INT,
    ID_MelhorDiretor_Voto_Soma INT
);

CREATE TABLE MelhorAtor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Ator INT,
    ID_MelhorAtor_Voto_Soma INT
);

CREATE TABLE MelhorAtriz (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    ID_Atriz INT,
    ID_MelhorAtriz_Voto_Soma INT
);

CREATE TABLE MelhorAtorCoadjuvante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Ator INT,
    ID_MelhorAtorCoadjuvante_Voto_Soma INT
);

CREATE TABLE MelhorAtrizCoadjuvante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Atriz INT,
    ID_MelhorAtrizCoadjuvante_Voto_Soma INT
);

CREATE TABLE MelhorRoteiroOriginal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorRoteiroOriginal_Voto_Soma INT
);

CREATE TABLE MelhorRoteiroAdaptado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorRoteiroAdaptado_Voto_Soma INT
);

CREATE TABLE MelhorFilmeAnimacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorFilmeAnimacao_Voto_Soma INT
);

CREATE TABLE MelhorFilmeInternacional (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorFilmeInternacional_Voto_Soma INT
);

CREATE TABLE MelhorDocumentarioLonga (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorDocumentarioLonga_Voto_Soma INT
);

CREATE TABLE MelhorDocumentarioCurta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorDocumentarioCurta_Voto_Soma INT
);

CREATE TABLE MelhorCurtaLiveAction (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorCurtaLiveAction_Voto_Soma INT
);

CREATE TABLE MelhorCurtaAnimacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorCurtaAnimacao_Voto_Soma INT
);

CREATE TABLE MelhorTrilhaSonora (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo_de_Filme VARCHAR(255),
    ID_Filme INT,
    ID_MelhorTrilhaSonora_Voto_Soma INT
);

CREATE TABLE MelhorCancaoOriginal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorCancaoOriginal_Voto_Soma INT
);

CREATE TABLE MelhorSom (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorSom_Voto_Soma INT
);

CREATE TABLE MelhorDesignProducao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorDesignProducao_Voto_Soma INT
);

CREATE TABLE MelhorFotografia (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorFotografia_Voto_Soma INT
);

CREATE TABLE MelhorMaquiagemPenteados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorMaquiagemPenteados_Voto_Soma INT
);

CREATE TABLE MelhorFigurino (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorFigurino_Voto_Soma INT
);

CREATE TABLE MelhorEdicao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhorEdicao_Voto_Soma INT
);

CREATE TABLE MelhoresEfeitosVisuais (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    ID_Filme INT,
    ID_MelhoresEfeitosVisuais_Voto_Soma INT
);

CREATE TABLE CadastroUsuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Idade INT,
    Sexo VARCHAR(10),
    Data_de_Nascimento DATE,
    Senha VARCHAR(255),
    Usuario VARCHAR(255)
);

CREATE TABLE Votacao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cadastro_Usuario INT,
    ID_MelhorFilme_Voto INT,
    ID_MelhorDiretor_Voto INT,
    ID_MelhorAtor_Voto INT,
    ID_MelhorAtriz_Voto INT,
    ID_MelhorAtorCoadjuvante_Voto INT,
    ID_MelhorAtrizCoadjuvante_Voto INT,
    ID_MelhorRoteiroOriginal_Voto INT,
    ID_MelhorRoteiroAdaptado_Voto INT,
    ID_MelhorFilmeAnimacao_Voto INT,
    ID_MelhorFilmeInternacional_Voto INT,
    ID_MelhorDocumentarioLonga_Voto INT,
    ID_MelhorDocumentarioCurta_Voto INT,
    ID_MelhorCurtaLiveAction_Voto INT,
    ID_MelhorCurtaAnimacao_Voto INT,
    ID_MelhorTrilhaSonora_Voto INT,
    ID_MelhorCancaoOriginal_Voto INT,
    ID_MelhorSom_Voto INT,
    ID_MelhorDesignProducao_Voto INT,
    ID_MelhorFotografia_Voto INT,
    ID_MelhorMaquiagemPenteados_Voto INT,
    ID_MelhorFigurino_Voto INT,
    ID_MelhorEdicao_Voto INT,
    ID_MelhoresEfeitosVisuais_Voto INT
);