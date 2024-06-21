CREATE DATABASE IF NOT EXISTS futebol;
USE futebol;

CREATE TABLE IF NOT EXISTS jogadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    posicao VARCHAR(50) NOT NULL,
    clube VARCHAR(100),
    idade INT NOT NULL
);

INSERT INTO jogadores (nome, posicao, clube, idade) VALUES
('Lionel Messi', 'atacante', 'Paris Saint-Germain', 34),
('Cristiano Ronaldo', 'atacante', 'Manchester United', 36),
('Neymar Jr', 'atacante', 'Paris Saint-Germain', 30),
('Kylian Mbappé', 'atacante', NULL, 22),
('Kevin De Bruyne', 'meio-campo', 'Manchester City', 30),
('Sergio Busquets', 'meio-campo', 'FC Barcelona', 33),
('Gerard Piqué', 'defesa', NULL, 35),
('Virgil van Dijk', 'defesa', 'Liverpool', 30),
('Alisson Becker', 'goleiro', 'Liverpool', 29),
('Manuel Neuer', 'goleiro', NULL, 35),
('Robert Lewandowski', 'atacante', 'Bayern Munich', 33),
('Thomas Müller', 'meio-campo', 'Bayern Munich', 32),
('Joshua Kimmich', 'meio-campo', NULL, 26),
('Paulo Dybala', 'atacante', 'Juventus', 28),
('Paul Pogba', 'meio-campo', 'Manchester United', 28),
('Harry Maguire', 'defesa', NULL, 29),
('Gianluigi Donnarumma', 'goleiro', 'Paris Saint-Germain', 22),
('Phil Foden', 'meio-campo', 'Manchester City', 21),
('Riyad Mahrez', 'atacante', 'Manchester City', 31),
('Zlatan Ibrahimovic', 'atacante', 'AC Milan', 40),
('Brahim Díaz', 'meio-campo', NULL, 22),
('Rúben Dias', 'defesa', 'Manchester City', 25),
('Ederson Moraes', 'goleiro', 'Manchester City', 28),
('N\'Golo Kanté', 'meio-campo', 'Chelsea', 31),
('Mason Mount', 'meio-campo', NULL, 23),
('Edouard Mendy', 'goleiro', 'Chelsea', 30),
('Romelu Lukaku', 'atacante', 'Inter Milan', 29),
('Marcelo Brozovic', 'meio-campo', 'Inter Milan', 29),
('Nicolo Barella', 'meio-campo', 'Inter Milan', 25),
('Milan Skriniar', 'defesa', 'Inter Milan', 27);
