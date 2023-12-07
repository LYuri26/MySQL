<?php
// Dados de conexão ao banco de dados
$host = 'localhost'; // Endereço do servidor de banco de dados
$dbname = 'empresasql'; // Nome do banco de dados
$user = 'root'; // Nome de usuário do banco de dados
$password = ''; // Senha do banco de dados (vazia neste exemplo)

try {
    // Conexão com o banco de dados usando PDO (PHP Data Objects)
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    
    // Configura o PDO para lançar exceções (erros) em caso de problemas
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query para criar a tabela de alunos se ela ainda não existir
    $createTableQuery = "
        CREATE TABLE IF NOT EXISTS alunos (
            id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna de ID auto incremento e chave primária
            nome VARCHAR(100) NOT NULL,  -- Coluna para armazenar nomes, não pode ser nula
            idade INT NOT NULL,  -- Coluna para armazenar idades, não pode ser nula
            curso VARCHAR(50) NOT NULL,  -- Coluna para armazenar cursos, não pode ser nula
            endereco VARCHAR(150) NOT NULL  -- Coluna para armazenar endereços, não pode ser nula
        )
    ";

    // Executando a query para criar a tabela
    $pdo->exec($createTableQuery);

    echo "Tabela 'alunos' criada com sucesso!";
} catch(PDOException $e) {
    // Exibe uma mensagem de erro caso ocorra um problema na execução da query
    die("Erro ao criar a tabela: " . $e->getMessage());
}
?>
