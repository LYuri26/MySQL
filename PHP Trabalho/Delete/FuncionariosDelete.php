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

    // ID do funcionário a ser deletado (altere o valor conforme necessário)
    $id_funcionario = 5; // Por exemplo, deletar o funcionário com ID 5

    // Query de delete
    $sql = "DELETE FROM funcionarios WHERE id = :id";
    $stmt = $conexao->prepare($sql);

    // Bind do parâmetro e execução da query
    $stmt->bindParam(':id', $id_funcionario);
    $stmt->execute();

    echo "Funcionário deletado com sucesso!";
} catch(PDOException $e) {
    echo "Erro ao deletar funcionário: " . $e->getMessage();
}

$conexao = null; // Fechar conexão
?>
