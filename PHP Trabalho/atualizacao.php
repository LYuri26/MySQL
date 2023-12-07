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

    // Dados para atualização (altere conforme necessário)
    $id_aluno = 1; // ID do aluno a ser atualizado
    $novo_nome = 'Joana'; // Novo nome do aluno
    $nova_idade = 21; // Nova idade do aluno
    $novo_curso = 'Ciências'; // Novo curso do aluno
    $novo_endereco = 'Rua XYZ, 789'; // Novo endereço do aluno

    // Query de atualização dos dados do aluno
    $stmt = $pdo->prepare("UPDATE alunos 
                           SET nome = :nome, idade = :idade, curso = :curso, endereco = :endereco 
                           WHERE id = :id");
    // Prepara a query SQL de atualização usando placeholders (:nome, :idade, :curso, :endereco, :id)

    $stmt->bindParam(':nome', $novo_nome);
    $stmt->bindParam(':idade', $nova_idade);
    $stmt->bindParam(':curso', $novo_curso);
    $stmt->bindParam(':endereco', $novo_endereco);
    $stmt->bindParam(':id', $id_aluno);
    // Faz o bind dos valores das variáveis aos placeholders na query SQL

    // Executando a query de atualização
    $stmt->execute();
    // Executa a query preparada com os valores fornecidos

    echo "Dados do aluno atualizados com sucesso!";
    // Exibe uma mensagem confirmando a atualização bem-sucedida

} catch(PDOException $e) {
    die("Erro ao atualizar os dados do aluno: " . $e->getMessage());
    // Encerra o script e exibe uma mensagem de erro caso ocorra uma exceção
}
?>