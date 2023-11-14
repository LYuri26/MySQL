CREATE DATABASE OscarDB;

USE OscarDB;


CREATE TABLE Diretores (
ID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
Sexo VARCHAR(10),
ID_Filme INT,
Tipo_de_Filme VARCHAR(255)
);

CREATE TABLE Filmes (
ID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
ID_Tipo_de_Filme INT,
Lancamento DATE
);

SELECT * FROM diretores;


INSERT INTO
    Diretores (
        nome,
        Sexo,
        ID_Filme,
        Tipo_de_Filme
    )
VALUES (
       'Jane Campion',
       'Feminino',
       'Drama'
    );


INSERT INTO
    Filmes (
        nome,
        ID_Tipo_de_Filme,
        Lancamento
    )
VALUES (
       'The Power of the Dog',
       '',
       '2021/12/01'
    );
SELECT * FROM filmes;

UPDATE Diretores
SET ID_Filme = 1
WHERE ID = 1;
