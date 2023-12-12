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
    
    // Dados para inserção (altere conforme necessário)
    $nome = 'Larissa';
    $cargo = 'Estagiária';
    $departamento = 'Atendimento ao Cliente';

    // Query de inserção
    $query = "INSERT INTO funcionarios (nome, cargo, departamento) VALUES (:nome, :cargo, :departamento)";
    
    // Preparação da query
    $stmt = $conexao->prepare($query);
    
    // Bind dos parâmetros
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':cargo', $cargo);
    $stmt->bindParam(':departamento', $departamento);
    
    // Execução da query de inserção
    $stmt->execute();
    
    echo "Inserção realizada com sucesso!";
} catch (PDOException $e) {
    echo "Erro na inserção: " . $e->getMessage();
}
?>
