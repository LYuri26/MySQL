-- Criação de Triggers

-- Trigger para atualizar o valor total do pedido após a inserção de um novo item
DELIMITER $$

CREATE TRIGGER atualiza_total_pedido_after_insert
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    DECLARE total_pedido FLOAT;

    -- Calcula o novo total do pedido
    SELECT SUM(quantidade * preco_unitario) INTO total_pedido
    FROM itens_pedido
    WHERE pedido_id = NEW.pedido_id;

    -- Atualiza o valor total do pedido na tabela pedidos
    UPDATE pedidos
    SET total = total_pedido
    WHERE id = NEW.pedido_id;
END$$

DELIMITER ;

-- Trigger para atualizar o valor total do pedido após a remoção de um item
DELIMITER $$

CREATE TRIGGER atualiza_total_pedido_after_delete
AFTER DELETE ON itens_pedido
FOR EACH ROW
BEGIN
    DECLARE total_pedido FLOAT;

    -- Calcula o novo total do pedido
    SELECT SUM(quantidade * preco_unitario) INTO total_pedido
    FROM itens_pedido
    WHERE pedido_id = OLD.pedido_id;

    -- Atualiza o valor total do pedido na tabela pedidos
    UPDATE pedidos
    SET total = total_pedido
    WHERE id = OLD.pedido_id;
END$$

DELIMITER ;

-- Trigger para atualizar o estoque após a inserção de um novo item no pedido
DELIMITER $$

CREATE TRIGGER atualiza_estoque_after_insert
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    -- Atualiza o estoque do produto subtraindo a quantidade vendida
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END$$

DELIMITER ;

-- Trigger para atualizar o estoque após a remoção de um item do pedido
DELIMITER $$

CREATE TRIGGER atualiza_estoque_after_delete
AFTER DELETE ON itens_pedido
FOR EACH ROW
BEGIN
    -- Atualiza o estoque do produto adicionando a quantidade removida
    UPDATE produtos
    SET estoque = estoque + OLD.quantidade
    WHERE id = OLD.produto_id;
END$$

DELIMITER ;

-- Criação de Views

-- View para listar todos os pedidos com detalhes do cliente
CREATE VIEW vw_pedidos_com_clientes AS
SELECT p.id AS pedido_id, c.nome AS cliente_nome, p.data_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;

-- View para listar produtos com estoque baixo (menos de 20 unidades)
CREATE VIEW vw_produtos_estoque_baixo AS
SELECT nome, estoque
FROM produtos
WHERE estoque < 20;

-- View para listar o total de vendas por cliente
CREATE VIEW vw_total_vendas_por_cliente AS
SELECT c.nome AS cliente_nome, SUM(p.total) AS total_vendas
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.nome;

-- Criação de Stored Procedures

-- Stored Procedure para adicionar um novo pedido
DELIMITER $$

CREATE PROCEDURE sp_adicionar_pedido(
    IN p_cliente_id INT,
    IN p_data_pedido DATE
)
BEGIN
    -- Insere um novo pedido com total inicial zero
    INSERT INTO pedidos (cliente_id, data_pedido, total)
    VALUES (p_cliente_id, p_data_pedido, 0);
END$$

DELIMITER ;

-- Stored Procedure para adicionar um item a um pedido
DELIMITER $$

CREATE PROCEDURE sp_adicionar_item_pedido(
    IN p_pedido_id INT,
    IN p_produto_id INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_preco_unitario FLOAT;

    -- Obtém o preço unitário do produto
    SELECT preco INTO v_preco_unitario
    FROM produtos
    WHERE id = p_produto_id;

    -- Insere o item no pedido
    INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
    VALUES (p_pedido_id, p_produto_id, p_quantidade, v_preco_unitario);
END$$

DELIMITER ;

-- Stored Procedure para remover um item de um pedido
DELIMITER $$

CREATE PROCEDURE sp_remover_item_pedido(
    IN p_item_id INT
)
BEGIN
    -- Remove o item do pedido
    DELETE FROM itens_pedido
    WHERE id = p_item_id;
END$$

DELIMITER ;

-- Stored Procedure para calcular o total de um pedido
DELIMITER $$

CREATE PROCEDURE sp_calcular_total_pedido(
    IN p_pedido_id INT
)
BEGIN
    DECLARE v_total_pedido FLOAT;

    -- Calcula o total do pedido
    SELECT SUM(quantidade * preco_unitario) INTO v_total_pedido
    FROM itens_pedido
    WHERE pedido_id = p_pedido_id;

    -- Atualiza o total do pedido na tabela pedidos
    UPDATE pedidos
    SET total = v_total_pedido
    WHERE id = p_pedido_id;
END$$

DELIMITER ;