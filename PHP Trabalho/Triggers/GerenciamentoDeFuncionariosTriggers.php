<?php

// Configurações de conexão
$host = 'localhost';
$dbname = 'RecursosHumanos';
$username = 'root';
$password = '';

// Conexão com o banco de dados usando PDO
try {
    $conexao = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexão estabelecida com sucesso!<br><br>";

    // Comando SQL para criação dos triggers
    $triggers = "
        CREATE TRIGGER insere_funcionario AFTER INSERT ON funcionarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_funcionarios (id, data_modificacao, alteracao, usuario)
            VALUES (NEW.id, NOW(), 'Inserção de funcionário', 'Admin');
        END;

        CREATE TRIGGER atualiza_funcionario BEFORE UPDATE ON funcionarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_funcionarios (id, data_modificacao, alteracao, usuario)
            VALUES (NEW.id, NOW(), 'Atualização de funcionário', 'Admin');
        END;

        CREATE TRIGGER deleta_funcionario AFTER DELETE ON funcionarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_funcionarios (id, data_modificacao, alteracao, usuario)
            VALUES (OLD.id, NOW(), 'Exclusão de funcionário', 'Admin');
        END;

        CREATE TRIGGER insere_historico_salario AFTER INSERT ON historico_salarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_historico_salarios (id, data_modificacao, alteracao, usuario)
            VALUES (NEW.id, NOW(), 'Inserção de histórico de salário', 'Admin');
        END;

        CREATE TRIGGER atualiza_historico_salario BEFORE UPDATE ON historico_salarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_historico_salarios (id, data_modificacao, alteracao, usuario)
            VALUES (NEW.id, NOW(), 'Atualização de histórico de salário', 'Admin');
        END;

        CREATE TRIGGER deleta_historico_salario AFTER DELETE ON historico_salarios
        FOR EACH ROW
        BEGIN
            INSERT INTO log_historico_salarios (id, data_modificacao, alteracao, usuario)
            VALUES (OLD.id, NOW(), 'Exclusão de histórico de salário', 'Admin');
        END;
    ";

    // Executando os comandos SQL
    $conexao->exec($triggers);

    echo "Triggers criados com sucesso!";
} catch(PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
}
?>
