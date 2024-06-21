-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oscar2010;
USE Oscar2010;

-- Inserção de dados nas tabelas com votos fictícios para o Oscar 2010

-- Melhor Filme
INSERT INTO MelhorFilme (nome, votacao) VALUES
    ('Inception', 800),
    ('The Social Network', 700),
    ('The King''s Speech', 600),
    ('Black Swan', 500),
    ('True Grit', 400);

-- Melhor Diretor
INSERT INTO MelhorDiretor (nome, filme_id, votacao) VALUES
    ('Christopher Nolan', 1, 800),
    ('David Fincher', 2, 700),
    ('Tom Hooper', 3, 600),
    ('Darren Aronofsky', 4, 500),
    ('Joel Coen e Ethan Coen', 5, 400);

-- Melhor Ator
INSERT INTO MelhorAtor (nome, filme_id, votacao) VALUES
    ('Javier Bardem', 1, 800),
    ('Jesse Eisenberg', 2, 700),
    ('Colin Firth', 3, 600),
    ('James Franco', 4, 500),
    ('Jeff Bridges', 5, 400);

-- Melhor Atriz
INSERT INTO MelhorAtriz (nome, filme_id, votacao) VALUES
    ('Natalie Portman', 4, 800),
    ('Annette Bening', 3, 700),
    ('Nicole Kidman', NULL, 600),
    ('Jennifer Lawrence', NULL, 500),
    ('Michelle Williams', NULL, 400);


    -- Melhor Ator Coadjuvante
INSERT INTO MelhorAtorCoadjuvante (nome, filme_id, votacao) VALUES
    ('Christian Bale', 3, 800),
    ('Geoffrey Rush', NULL, 700),
    ('Jeremy Renner', NULL, 600),
    ('Mark Ruffalo', NULL, 500),
    ('John Hawkes', NULL, 400);

-- Melhor Atriz Coadjuvante
INSERT INTO MelhorAtrizCoadjuvante (nome, filme_id, votacao) VALUES
    ('Melissa Leo', NULL, 800),
    ('Amy Adams', NULL, 700),
    ('Jacki Weaver', NULL, 600),
    ('Hailee Steinfeld', NULL, 500),
    ('Helena Bonham Carter', NULL, 400);

-- Melhor Roteiro Original
INSERT INTO MelhorRoteiroOriginal (nome, filme_id, votacao) VALUES
    ('The King''s Speech', 3, 800),
    ('Another Year', NULL, 700),
    ('The Fighter', NULL, 600),
    ('Inception', 1, 500),
    ('The Kids Are All Right', NULL, 400);

-- Melhor Filme de Animação
INSERT INTO MelhorFilmeAnimacao (nome, votacao) VALUES
    ('Toy Story 3', 800),
    ('How to Train Your Dragon', 600),
    ('The Illusionist', 400);