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

    // Query para criar a tabela de log de alunos, se não existir
    $query = "CREATE TABLE IF NOT EXISTS alunos_log (
        id_log INT AUTO_INCREMENT PRIMARY KEY,
        id_aluno INT NOT NULL,
        acao VARCHAR(50) NOT NULL,
        data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (id_aluno) REFERENCES alunos (id)
    )";
    // Define a query SQL para criar a tabela alunos_log caso ela não exista

    // Executando a query para criar a tabela
    $pdo->exec($query);
    // Realiza a execução da query no banco de dados para criar a tabela

    echo "Tabela de log de alunos criada com sucesso!";
    // Mensagem de confirmação exibida se a tabela for criada com êxito
} catch (PDOException $e) {
    die("Erro ao criar tabela de log de alunos: " . $e->getMessage());
    // Encerra o script e exibe uma mensagem de erro caso ocorra uma exceção
}
?>
