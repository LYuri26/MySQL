-- 1. Criação do Banco de Dados
CREATE DATABASE loja_doces; -- Cria o banco de dados chamado "loja_doces"
USE loja_doces; -- Seleciona o banco de dados "loja_doces" para uso

-- 2. Criação das Tabelas
CREATE TABLE doces (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada doce (chave primária)
    nome VARCHAR(100) NOT NULL, -- Nome do doce (não pode ser nulo)
    sabor VARCHAR(50), -- Sabor do doce
    preco DECIMAL(6, 2), -- Preço do doce (até 6 dígitos, 2 decimais)
    quantidade_estoque INT -- Quantidade disponível em estoque
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada cliente (chave primária)
    nome VARCHAR(100) NOT NULL, -- Nome do cliente (não pode ser nulo)
    telefone VARCHAR(15), -- Telefone do cliente
    data_cadastro DATE -- Data de cadastro do cliente
);

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada venda (chave primária)
    cliente_id INT, -- ID do cliente que fez a venda (chave estrangeira)
    doce_id INT, -- ID do doce vendido (chave estrangeira)
    data_venda DATE, -- Data da venda
    quantidade INT, -- Quantidade de doces vendidos
    valor_total DECIMAL(6, 2), -- Valor total da venda
    FOREIGN KEY (cliente_id) REFERENCES clientes(id), -- Relaciona com a tabela clientes
    FOREIGN KEY (doce_id) REFERENCES doces(id) -- Relaciona com a tabela doces
);

-- Adiciona uma coluna para data de devolução na tabela vendas
ALTER TABLE vendas ADD COLUMN data_devolucao DATE;

-- 3. Criação da Tabela de Auditoria para Produtos
CREATE TABLE auditoria_produtos (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada registro de auditoria
    produto_id INT, -- ID do produto alterado (chave estrangeira)
    preco_antigo DECIMAL(10, 2), -- Preço antigo do produto
    preco_novo DECIMAL(10, 2), -- Preço novo do produto
    quantidade_antiga INT, -- Quantidade antiga em estoque
    quantidade_nova INT, -- Quantidade nova em estoque
    data_alteracao DATETIME, -- Data e hora da alteração
    FOREIGN KEY (produto_id) REFERENCES doces(id) -- Relaciona com a tabela doces
);

-- 4. Criação da Tabela Funcionários
CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada funcionário (chave primária)
    nome VARCHAR(100), -- Nome do funcionário
    salario DECIMAL(10, 2), -- Salário do funcionário
    cargo VARCHAR(100) -- Cargo do funcionário
);

-- 5. Criação da Tabela de Histórico de Funcionários
CREATE TABLE historico_funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada registro de histórico
    funcionario_id INT, -- ID do funcionário alterado (chave estrangeira)
    salario_antigo DECIMAL(10, 2), -- Salário antigo do funcionário
    salario_novo DECIMAL(10, 2), -- Salário novo do funcionário
    cargo_antigo VARCHAR(100), -- Cargo antigo do funcionário
    cargo_novo VARCHAR(100), -- Cargo novo do funcionário
    data_alteracao DATETIME, -- Data e hora da alteração
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id) -- Relaciona com a tabela funcionarios
);

-- 6. Trigger para Registrar Alterações na Tabela Funcionários
DELIMITER //
CREATE TRIGGER trg_registra_salario
AFTER UPDATE ON funcionarios -- Acionado após uma atualização na tabela funcionarios
FOR EACH ROW
BEGIN
    -- Verifica se houve alteração no salário ou no cargo
    IF OLD.salario != NEW.salario OR OLD.cargo != NEW.cargo THEN
        -- Insere um novo registro na tabela de histórico
        INSERT INTO historico_funcionarios (
            funcionario_id,
            salario_antigo, salario_novo,
            cargo_antigo, cargo_novo,
            data_alteracao
        ) VALUES (
            OLD.id, OLD.salario, NEW.salario, 
            OLD.cargo, NEW.cargo, 
            NOW() -- Data e hora atuais
        );
    END IF;
END;
//
DELIMITER ;

-- 7. Criação da Tabela de Pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada pedido (chave primária)
    cliente_id INT, -- ID do cliente que fez o pedido (chave estrangeira)
    data_pedido DATE, -- Data do pedido
    valor_total DECIMAL(10, 2), -- Valor total do pedido
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) -- Relaciona com a tabela clientes
);

-- 8. Trigger para Atualizar Data de Cadastro no Cliente
DELIMITER //
CREATE TRIGGER trg_atualiza_data_cadastro
AFTER INSERT ON pedidos -- Acionado após a inserção de um pedido
FOR EACH ROW
BEGIN
    -- Atualiza a data de cadastro do cliente para a data do pedido
    UPDATE clientes 
    SET data_cadastro = NEW.data_pedido 
    WHERE id = NEW.cliente_id;
END;
//
DELIMITER ;

-- 10. Trigger de Venda - Diminuir Estoque
DELIMITER //
CREATE TRIGGER trg_venda_diminui_estoque
BEFORE INSERT ON vendas -- Acionado antes de inserir uma venda
FOR EACH ROW
BEGIN
    -- Diminui a quantidade em estoque do doce vendido
    UPDATE doces 
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE id = NEW.doce_id;
END;
//
DELIMITER ;

-- 11. Criação da Tabela de Devoluções
CREATE TABLE devolucoes (
    id INT PRIMARY KEY AUTO_INCREMENT, -- ID único para cada devolução (chave primária)
    venda_id INT, -- ID da venda relacionada (chave estrangeira)
    produto_id INT, -- ID do produto devolvido (chave estrangeira)
    data_devolucao DATE, -- Data da devolução
    quantidade INT, -- Quantidade devolvida
    FOREIGN KEY (venda_id) REFERENCES vendas(id), -- Relaciona com a tabela vendas
    FOREIGN KEY (produto_id) REFERENCES doces(id) -- Relaciona com a tabela doces
);

-- 12. Trigger de Registro de Devolução
DELIMITER //
CREATE TRIGGER trg_registra_devolucao
AFTER UPDATE ON vendas -- Acionado após uma atualização na tabela vendas
FOR EACH ROW
BEGIN
    -- Verifica se a data de devolução foi preenchida
    IF NEW.data_devolucao IS NOT NULL THEN
        -- Insere um novo registro na tabela de devoluções
        INSERT INTO devolucoes (
            venda_id, produto_id, data_devolucao, quantidade
        ) VALUES (
            OLD.id, OLD.doce_id, NEW.data_devolucao, NEW.quantidade
        );
    END IF;
END;
//
DELIMITER ;

-- 13. Inserção de Produtos na Tabela `doces`
INSERT INTO doces (nome, preco, quantidade_estoque)
VALUES 
    ('Chocolate', 5.00, 100), -- Insere um doce de chocolate
    ('Bala', 2.00, 200), -- Insere uma bala
    ('Biscoito', 3.50, 150); -- Insere um biscoito

-- 14. Atualização de Produto na Tabela `doces`
UPDATE doces
SET preco = 6.00, quantidade_estoque = 120
WHERE id = 1; -- Atualiza o preço e o estoque do chocolate

-- 15. Exclusão de Produto da Tabela `doces`
DELETE FROM doces
WHERE id = 2; -- Remove a bala da tabela

-- 16. Atualização de Produto para Disparar Auditoria de Preço e Estoque
UPDATE doces
SET preco = 6.50, quantidade_estoque = 110
WHERE id = 1; -- Atualiza o preço e o estoque do chocolate novamente

-- 17. Atualização de Funcionário para Disparar Histórico de Alterações
UPDATE funcionarios
SET salario = 2500.00, cargo = 'Supervisor'
WHERE id = 1; -- Atualiza o salário e o cargo de um funcionário

-- 18. Inserção de Pedido na Tabela `pedidos`
INSERT INTO pedidos (cliente_id, data_pedido, valor_total)
VALUES 
    (1, '2025-03-09', 50.00); -- Insere um pedido para o cliente com ID 1

-- 19. Inserção de Venda na Tabela `vendas`
INSERT INTO vendas (doce_id, cliente_id, data_venda, quantidade)
VALUES 
    (1, 1, '2025-03-09', 2); -- Registra uma venda de 2 chocolates

-- 20. Atualização de Venda para Registrar Devolução
UPDATE vendas
SET data_devolucao = '2025-03-10', quantidade = 1
WHERE id = 1; -- Registra a devolução de 1 chocolate

-- 21. Inserção de Devolução na Tabela `devolucoes`
INSERT INTO devolucoes (venda_id, produto_id, data_devolucao, quantidade)
VALUES 
    (1, 1, '2025-03-10', 1); -- Insere a devolução na tabela de devoluções