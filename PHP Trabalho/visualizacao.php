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

    // Query para selecionar todos os alunos
    $stmt = $pdo->query("SELECT * FROM alunos");
    // Executa uma consulta SQL para selecionar todos os registros da tabela 'alunos'

    // Exibir os dados dos alunos
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // Laço que percorre os resultados da consulta um por um

        foreach ($row as $key => $value) {
            // Laço que percorre cada campo (coluna) de um aluno

            echo ucfirst($key) . ": " . $value . "<br>";
            // Exibe o nome do campo (coluna) em letra maiúscula e o valor correspondente
        }
        echo "<br>";
        // Quebra de linha para separar os dados de cada aluno na exibição
    }

} catch(PDOException $e) {
    die("Erro ao exibir os alunos: " . $e->getMessage());
    // Finaliza o script e exibe uma mensagem de erro se ocorrer uma exceção
}
?>
