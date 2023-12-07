<?php
// Dados de conexão ao banco de dados
$host = 'localhost';
$dbname = 'empresasql';
$user = 'root';
$password = '';

try {
    // Conexão com o banco de dados usando PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // ID do aluno a ser deletado (altere conforme necessário)
    $id_aluno = 2;

    // Query para deletar o aluno pelo ID
    $stmt = $pdo->prepare("DELETE FROM alunos WHERE id = :id");
    // Prepara a query SQL de deleção usando um placeholder (:id)

    $stmt->bindParam(':id', $id_aluno);
    // Faz o bind do valor da variável $id_aluno ao placeholder :id na query SQL

    $stmt->execute();
    // Executa a query preparada, removendo o aluno com o ID fornecido

    echo "Aluno deletado com sucesso!";
    // Exibe uma mensagem confirmando a exclusão bem-sucedida

} catch(PDOException $e) {
    die("Erro ao deletar o aluno: " . $e->getMessage());
    // Encerra o script e exibe uma mensagem de erro caso ocorra uma exceção
}
?>
