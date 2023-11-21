-- Criação do banco de dados "ExemploTriggers" se não existir e seleção do mesmo
CREATE DATABASE IF NOT EXISTS ExemploTriggers;
USE ExemploTriggers;

-- Criando a tabela de clientes e definindo sua estrutura
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do cliente
    nome VARCHAR(100), -- Nome do cliente
    email VARCHAR(100) -- Endereço de e-mail do cliente
);

-- Criando a tabela de histórico de novos clientes e definindo sua estrutura
CREATE TABLE IF NOT EXISTS historico_novos_clientes (
    id_registro INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do registro
    id_cliente INT, -- Identificador do cliente relacionado
    nome_cliente VARCHAR(100), -- Nome do cliente registrado
    email_cliente VARCHAR(100), -- E-mail do cliente registrado
    data_insercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de inserção do registro
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) -- Chave estrangeira referenciando a tabela de clientes
);

-- Criando a tabela de pedidos e definindo sua estrutura
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT PRIMARY KEY, -- Identificador único do pedido
    descricao VARCHAR(100), -- Descrição do pedido
    status VARCHAR(50) -- Status do pedido
);

-- Criando a tabela de histórico de pedidos e definindo sua estrutura
CREATE TABLE IF NOT EXISTS historico_pedidos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do histórico
    id_pedido INT, -- Identificador do pedido relacionado
    descricao_anterior VARCHAR(100), -- Descrição anterior do pedido
    status_anterior VARCHAR(50), -- Status anterior do pedido
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de modificação do registro
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) -- Chave estrangeira referenciando a tabela de pedidos
);

-- Criando a tabela de histórico de exclusão de pedidos e definindo sua estrutura
CREATE TABLE IF NOT EXISTS historico_exclusao_pedidos (
    id_exclusao INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único da exclusão
    id_pedido INT, -- Identificador do pedido excluído
    descricao_excluida VARCHAR(100), -- Descrição do pedido excluído
    status_excluido VARCHAR(50), -- Status do pedido excluído
    data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de exclusão do registro
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) -- Chave estrangeira referenciando a tabela de pedidos
);

-- Criando o trigger para registrar novos clientes na tabela de histórico de novos clientes após uma inserção na tabela de clientes
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_insert_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    -- Registrando os detalhes do novo cliente no histórico de novos clientes
    INSERT INTO historico_novos_clientes (id_cliente, nome_cliente, email_cliente)
    VALUES (NEW.id_cliente, NEW.nome, NEW.email);
END;
DELIMITER ;

INSERT INTO clientes (id_cliente,nome, email)
VALUES (3, 'Danilo', 'Danilo@teste.com');

SELECT * FROM clientes;
SELECT * FROM historico_novos_clientes;

-- Criando o trigger para registrar atualizações de pedidos na tabela de histórico de pedidos após uma atualização na tabela de pedidos
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_update_pedido
AFTER UPDATE ON pedidos
FOR EACH ROW
BEGIN
    -- Verificando se houve uma atualização e registrando as informações anteriores no histórico de pedidos
    IF OLD.id_pedido IS NOT NULL THEN
        INSERT INTO historico_pedidos (id_pedido, descricao_anterior, status_anterior)
        VALUES (OLD.id_pedido, OLD.descricao, OLD.status);
    END IF;
END;
DELIMITER ;

INSERT INTO pedidos ( id_pedido, descricao, status)
VALUES (1, 'teste','pendente' );

UPDATE pedidos
SET status = 'entregue'
WHERE id_pedido = 1;

-- Criando o trigger para adicionar entradas na tabela de exclusão de pedidos quando registros forem excluídos da tabela de histórico de pedidos
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_delete_historico_pedidos
AFTER DELETE ON historico_pedidos
FOR EACH ROW
BEGIN
    -- Registrando as informações do registro excluído na tabela de exclusão de pedidos
    INSERT INTO historico_exclusao_pedidos (id_pedido, descricao_excluida, status_excluido)
    VALUES (OLD.id_pedido, OLD.descricao_anterior, OLD.status_anterior);
END;
DELIMITER ;

DELETE FROM historico_pedidos
WHERE id_pedido = 1;

-- Inserindo um novo cliente na tabela clientes
INSERT INTO clientes (nome, email) VALUES ('Maria', 'maria@example.com');

-- Inserindo um pedido na tabela pedidos
INSERT INTO pedidos (id_pedido, descricao, status) VALUES (1, 'Pedido 1', 'Em andamento');

-- Atualizando um pedido existente na tabela pedidos
UPDATE pedidos SET status = 'Concluído' WHERE id_pedido = 1;

-- Excluindo um registro da tabela historico_pedidos
DELETE FROM historico_pedidos WHERE id_historico = 1;
