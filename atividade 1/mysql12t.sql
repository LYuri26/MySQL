-- Criando banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce_db;
CREATE DATABASE IF NOT EXISTS rh_db;

-- Usando o banco ecommerce_db
USE ecommerce_db;

-- Criando tabela produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    data_cadastro DATE
);

-- Criando tabela auditoria_produtos
CREATE TABLE IF NOT EXISTS auditoria_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    quantidade_antiga INT,
    quantidade_nova INT,
    data_alteracao DATETIME,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Criando trigger para auditoria de produtos
DELIMITER //
CREATE TRIGGER trg_auditoria_produtos
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco OR OLD.quantidade_estoque <> NEW.quantidade_estoque THEN
        INSERT INTO auditoria_produtos (produto_id, preco_antigo, preco_novo, quantidade_antiga, quantidade_nova, data_alteracao)
        VALUES (OLD.id, OLD.preco, NEW.preco, OLD.quantidade_estoque, NEW.quantidade_estoque, NOW());
    END IF;
END;
//
DELIMITER ;

-- Usando o banco rh_db
USE rh_db;

-- Criando tabela funcionarios
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    data_contratacao DATE
);

-- Criando tabela historico_funcionarios
CREATE TABLE IF NOT EXISTS historico_funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    salario_antigo DECIMAL(10,2),
    salario_novo DECIMAL(10,2),
    cargo_antigo VARCHAR(100),
    cargo_novo VARCHAR(100),
    data_alteracao DATETIME,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

-- Criando trigger para histórico de funcionários
DELIMITER //

CREATE TRIGGER trg_registra_salario_insert
AFTER INSERT ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO historico_funcionarios (funcionario_id, salario_antigo, salario_novo, cargo_antigo, cargo_novo, data_alteracao)
    VALUES (NEW.id, NEW.salario, NEW.salario, NEW.cargo, NEW.cargo, NOW());
END;
//

CREATE TRIGGER trg_registra_salario_update
AFTER UPDATE ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO historico_funcionarios (funcionario_id, salario_antigo, salario_novo, cargo_antigo, cargo_novo, data_alteracao)
    VALUES (NEW.id, OLD.salario, NEW.salario, OLD.cargo, NEW.cargo, NOW());
END;
//

DELIMITER ;
-- Usando o banco ecommerce_db
USE ecommerce_db;

-- Criando tabela pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Criando trigger para atualizar data_cadastro dos clientes
DELIMITER //
CREATE TRIGGER trg_atualiza_data_cadastro
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    UPDATE clientes SET data_cadastro = NEW.data_pedido WHERE id = NEW.cliente_id;
END;
//
DELIMITER ;
