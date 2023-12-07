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

    // Dados fictícios de alunos para inserção
    $alunos = [
        ['João', 20, 'Engenharia', 'Rua A, 123'],
        ['Maria', 22, 'Administração', 'Avenida B, 456'],
        ['Pedro', 19, 'Direito', 'Rua C, 789'],
        ['Oswaldo', 2, 'Jogador', 'Rua B, 2'],
        // Adicione mais alunos conforme necessário
    ];

    // Preparar a declaração de inserção
    $stmt = $pdo->prepare("INSERT INTO alunos (nome, idade, curso, endereco) VALUES (?, ?, ?, ?)");
    // Preparação da query SQL para inserir dados na tabela 'alunos'

    // Inserir cada aluno na tabela
    foreach ($alunos as $aluno) {
        $stmt->execute($aluno);
        // Execução da declaração preparada inserindo dados do aluno na tabela

        echo "Aluno inserido: " . $aluno[0] . "<br>";
        // Exibição de mensagem indicando o nome do aluno inserido
    }

} catch(PDOException $e) {
    die("Erro ao inserir os alunos: " . $e->getMessage());
    // Finaliza o script e exibe uma mensagem de erro se ocorrer uma exceção
}
?>
