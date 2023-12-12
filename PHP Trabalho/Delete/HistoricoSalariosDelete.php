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

    // ID do registro de histórico de salários a ser deletado (altere o valor conforme necessário)
    $id_historico_salarios = 1;

    // Query de delete
    $sql = "DELETE FROM historico_salarios WHERE id = :id";
    $stmt = $conexao->prepare($sql);

    // Bind do parâmetro e execução da query
    $stmt->bindParam(':id', $id_historico_salarios);
    $stmt->execute();

    echo "Registro de histórico de salários deletado com sucesso!";
} catch(PDOException $e) {
    echo "Erro ao deletar registro de histórico de salários: " . $e->getMessage();
}

$conexao = null; // Fechar conexão
?>
