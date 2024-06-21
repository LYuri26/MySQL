USE futebol;


-- 1. Seleção Simples
-- Selecionar todos os jogadores que jogam na posição de "atacante"
SELECT *
FROM jogadores
WHERE posicao = 'atacante';

-- 2. Filtrando Dados com Condição
-- Selecionar todos os jogadores que têm 30 anos ou mais
SELECT *
FROM jogadores
WHERE idade >= 30;

-- 3. Ordenando Resultados
-- Listar todos os jogadores da tabela jogadores ordenados por idade em ordem crescente
SELECT *
FROM jogadores
ORDER BY idade;

-- 4. Contagem de Registros
-- Contar quantos jogadores estão cadastrados na tabela jogadores
SELECT COUNT(*) AS total_jogadores
FROM jogadores;

-- 5. Seleção com Alias
-- Selecionar o nome e a idade de todos os jogadores e renomear a coluna idade como "Idade_Jogador"
SELECT nome, idade AS Idade_Jogador
FROM jogadores;

-- 6. Filtrando Dados com Múltiplas Condições
-- Selecionar todos os jogadores que são "atacantes" e têm menos de 25 anos
SELECT *
FROM jogadores
WHERE posicao = 'atacante' AND idade < 25;

-- 7. Agrupamento e Funções de Agregação
-- Encontrar o número total de jogadores em cada clube na tabela jogadores
SELECT clube, COUNT(*) AS total_jogadores
FROM jogadores
GROUP BY clube;

-- 8. Função de Agregação com Filtragem
-- Calcular a idade média dos jogadores que jogam na posição de "meio-campo"
SELECT AVG(idade) AS idade_media
FROM jogadores
WHERE posicao = 'meio-campo';

-- 9. Atualização de Dados
-- Aumentar a idade de todos os jogadores do clube "FC Barcelona" em 1 ano
UPDATE jogadores
SET idade = idade + 1
WHERE clube = 'FC Barcelona';

-- 10. Deleção de Dados
-- Remover da tabela jogadores todos os jogadores que não têm um clube definido (clube está vazio ou NULL)
DELETE FROM jogadores
WHERE clube IS NULL OR clube = '';

