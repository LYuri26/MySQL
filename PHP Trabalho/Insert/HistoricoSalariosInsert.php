<?php

// Configurações de conexão
$host = 'localhost';
$dbname = 'RecursosHumanos';
$username = 'root';
$password = '';

try {
    // Conexão com o banco de dados usando PDO
    $conexao = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Dados para inserção (altere conforme necessário)
    $salario_atual = 5000.00; // Salário atual do funcionário
    $tipo_reajuste = 'Promoção'; // Tipo de reajuste (por exemplo, Promoção, Aumento, etc.)

    // Query de inserção
    $query = "INSERT INTO historico_salarios (salario_atual, tipo_reajuste) VALUES (:salario_atual, :tipo_reajuste)";
    
    // Preparação da query
    $stmt = $conexao->prepare($query);
    
    // Bind dos parâmetros
    $stmt->bindParam(':salario_atual', $salario_atual);
    $stmt->bindParam(':tipo_reajuste', $tipo_reajuste);
    
    // Execução da query de inserção
    $stmt->execute();
    
    echo "Inserção realizada com sucesso!";
} catch (PDOException $e) {
    echo "Erro na inserção: " . $e->getMessage();
}
?>
