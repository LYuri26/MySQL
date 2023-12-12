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

    // Dados para atualização
    $id = 1; // ID do funcionário a ser atualizado
    $nome = "Lenon Yuri";
    $cargo = "Instrutor C";
    $departamento = "Desenvolvimento de Sistemas";

    // Query de atualização
    $sql = "UPDATE funcionarios SET nome=:nome, cargo=:cargo, departamento=:departamento WHERE id=:id";
    $stmt = $conexao->prepare($sql);

    // Bind dos parâmetros e execução da query
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':cargo', $cargo);
    $stmt->bindParam(':departamento', $departamento);
    $stmt->bindParam(':id', $id);
    $stmt->execute();

    echo "Dados do funcionário atualizados com sucesso!";
} catch(PDOException $e) {
    echo "Erro ao atualizar os dados do funcionário: " . $e->getMessage();
}

$conexao = null; // Fechar conexão
?>
