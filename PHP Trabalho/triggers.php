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

    // Query para criar o trigger de inserção na tabela de alunos_log (se não existir)
    $query = "
    CREATE TRIGGER IF NOT EXISTS trigger_insert_alunos
    AFTER INSERT ON alunos
    FOR EACH ROW
    BEGIN
        INSERT INTO alunos_log (id_aluno, acao)
        VALUES (NEW.id, 'inserção');
    END;
    ";
    // Define a query SQL para criar o trigger de inserção

    // Executando a query para criar o trigger (se não existir)
    $pdo->exec($query);
    // Realiza a execução da query no banco de dados para criar o trigger

    echo "Trigger de inserção na tabela de log de alunos criado com sucesso ou já existe!";
    // Mensagem de confirmação exibida se o trigger for criado com êxito ou já existir
} catch(PDOException $e) {
    die("Erro ao criar trigger de inserção na tabela de log de alunos: " . $e->getMessage());
    // Encerra o script e exibe uma mensagem de erro caso ocorra uma exceção
}
?>
