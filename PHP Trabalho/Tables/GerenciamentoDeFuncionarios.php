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

    // Query para criar todas as tabelas
    $query = "
    CREATE TABLE IF NOT EXISTS funcionarios (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        cargo VARCHAR(50) NOT NULL,
        departamento VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS log_funcionarios (
        log_id INT AUTO_INCREMENT PRIMARY KEY,
        id INT NOT NULL,
        data_modificacao DATETIME DEFAULT CURRENT_TIMESTAMP,
        alteracao VARCHAR(255) NOT NULL,
        usuario VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS historico_salarios (
        id INT AUTO_INCREMENT PRIMARY KEY,
        salario_atual DECIMAL(10, 2) NOT NULL,
        data_reajuste DATETIME DEFAULT CURRENT_TIMESTAMP,
        tipo_reajuste VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS log_historico_salarios (
        log_id INT AUTO_INCREMENT PRIMARY KEY,
        id INT NOT NULL,
        data_modificacao DATETIME DEFAULT CURRENT_TIMESTAMP,
        alteracao VARCHAR(255) NOT NULL,
        usuario VARCHAR(50) NOT NULL
    );
";

    // Execução da query para criar as tabelas
    $conexao->exec($query);
    echo "Tabelas criadas com sucesso!<br>";
} catch (PDOException $e) {
    echo "Erro na conexão ou na criação das tabelas: " . $e->getMessage();
}

?>
