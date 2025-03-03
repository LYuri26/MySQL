-- Inserção de dados na tabela MelhorFilme
INSERT INTO MelhorFilme (nome, votos) VALUES
    ('Inception', 800),
    ('The Social Network', 700),
    ('The King''s Speech', 600),
    ('Black Swan', 500);

-- Inserção de dados na tabela MelhorDiretor
INSERT INTO MelhorDiretor (nome, filme_id, votos) VALUES
    ('Christopher Nolan', 1, 800),
    ('David Fincher', 2, 700),
    ('Tom Hooper', 3, 600),
    ('Darren Aronofsky', 4, 500);

-- Inserção de dados na tabela MelhorAtor
INSERT INTO MelhorAtor (nome, filme_id, votos) VALUES
    ('Leonardo DiCaprio', 1, 800),
    ('Jesse Eisenberg', 2, 700),
    ('Colin Firth', 3, 600),
    ('James Franco', 4, 500);

-- Inserção de dados na tabela MelhorAtriz
INSERT INTO MelhorAtriz (nome, filme_id, votos) VALUES
    ('Natalie Portman', 4, 800),
    ('Annette Bening', 3, 700),
    ('Nicole Kidman', 2, 600),
    ('Jennifer Lawrence', 1, 500);

-- Inserção de dados na tabela MelhorAtorCoadjuvante
INSERT INTO MelhorAtorCoadjuvante (nome, filme_id, votos) VALUES
    ('Christian Bale', 1, 800),
    ('Andrew Garfield', 2, 700),
    ('Geoffrey Rush', 3, 600),
    ('Mark Ruffalo', 4, 500);

-- Inserção de dados na tabela MelhorAtrizCoadjuvante
INSERT INTO MelhorAtrizCoadjuvante (nome, filme_id, votos) VALUES
    ('Melissa Leo', 1, 800),
    ('Hailee Steinfeld', 2, 700),
    ('Helena Bonham Carter', 3, 600),
    ('Amy Adams', 4, 500);

-- Inserção de dados na tabela MelhorRoteiroOriginal
INSERT INTO MelhorRoteiroOriginal (nome, filme_id, votos) VALUES
    ('Christopher Nolan', 1, 800),
    ('Aaron Sorkin', 2, 700),
    ('David Seidler', 3, 600),
    ('Mark Heyman', 4, 500);

-- Inserção de dados na tabela MelhorRoteiroAdaptado
INSERT INTO MelhorRoteiroAdaptado (nome, filme_id, votos) VALUES
    ('Christopher Nolan', 1, 800),
    ('Aaron Sorkin', 2, 700),
    ('David Seidler', 3, 600),
    ('Mark Heyman', 4, 500);

-- Inserção de dados na tabela MelhorFilmeInternacional
INSERT INTO MelhorFilmeInternacional (nome, pais, votos) VALUES
    ('A Separação', 'Irã', 800),
    ('Roma', 'México', 700),
    ('Parasita', 'Coreia do Sul', 600),
    ('A Vida dos Outros', 'Alemanha', 500);

-- Inserção de dados na tabela MelhorAnimacao
INSERT INTO MelhorAnimacao (nome, votos) VALUES
    ('Toy Story 3', 800),
    ('Como Treinar o Seu Dragão', 700),
    ('Divertida Mente', 600),
    ('Frozen', 500);

-- Inserção de dados na tabela MelhorDocumentario
INSERT INTO MelhorDocumentario (nome, votos) VALUES
    ('Inside Job', 800),
    ('Restrepo', 700),
    ('Waste Land', 600),
    ('Exit Through the Gift Shop', 500);

-- Inserção de dados na tabela MelhorCurtaMetragem
INSERT INTO MelhorCurtaMetragem (nome, votos) VALUES
    ('God of Love', 800),
    ('The Confession', 700),
    ('The Crush', 600),
    ('Wish 143', 500);

-- Inserção de dados na tabela MelhorTrilhaSonora
INSERT INTO MelhorTrilhaSonora (nome, filme_id, votos) VALUES
    ('Hans Zimmer', 1, 800),
    ('Trent Reznor', 2, 700),
    ('Alexandre Desplat', 3, 600),
    ('Clint Mansell', 4, 500);

-- Inserção de dados na tabela MelhorCançãoOriginal
INSERT INTO MelhorCançãoOriginal (nome, filme_id, votos) VALUES
    ('We Belong Together', 1, 800),
    ('You Haven''t Seen the Last of Me', 2, 700),
    ('I See the Light', 3, 600),
    ('If I Rise', 4, 500);

-- Inserção de dados na tabela MelhorFigurino
INSERT INTO MelhorFigurino (nome, filme_id, votos) VALUES
    ('Colleen Atwood', 1, 800),
    ('Janty Yates', 2, 700),
    ('Jenny Beavan', 3, 600),
    ('Antonella Cannarozzi', 4, 500);

-- Inserção de dados na tabela MelhorMaquiagemEPenteados
INSERT INTO MelhorMaquiagemEPenteados (nome, filme_id, votos) VALUES
    ('Rick Baker', 1, 800),
    ('Edouard F. Henriques', 2, 700),
    ('Gregory Nicotero', 3, 600),
    ('Howard Berger', 4, 500);

-- Inserção de dados na tabela MelhorDirecaoDeArte
INSERT INTO MelhorDirecaoDeArte (nome, filme_id, votos) VALUES
    ('Guy Hendrix Dyas', 1, 800),
    ('Donald Graham Burt', 2, 700),
    ('Eve Stewart', 3, 600),
    ('Thérèse DePrez', 4, 500);

-- Inserção de dados na tabela MelhorFotografia
INSERT INTO MelhorFotografia (nome, filme_id, votos) VALUES
    ('Wally Pfister', 1, 800),
    ('Jeff Cronenweth', 2, 700),
    ('Danny Cohen', 3, 600),
    ('Matthew Libatique', 4, 500);

-- Inserção de dados na tabela MelhorEdicao
INSERT INTO MelhorEdicao (nome, filme_id, votos) VALUES
    ('Lee Smith', 1, 800),
    ('Kirk Baxter', 2, 700),
    ('Tariq Anwar', 3, 600),
    ('Andrew Weisblum', 4, 500);

-- Inserção de dados na tabela MelhoresEfeitosVisuais
INSERT INTO MelhoresEfeitosVisuais (nome, filme_id, votos) VALUES
    ('Chris Corbould', 1, 800),
    ('Janek Sirrs', 2, 700),
    ('Tim Burke', 3, 600),
    ('Bryan Grill', 4, 500);