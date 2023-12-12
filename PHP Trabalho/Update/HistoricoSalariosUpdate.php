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

    // Dados para inserção
    $salario_atual = 5000.00;
    $data_reajuste = date("2023-12-12"); // Data atual
    $tipo_reajuste = "Reajuste Anual";

    // Query de inserção
    $sql = "INSERT INTO historico_salarios (salario_atual, data_reajuste, tipo_reajuste) VALUES (:salario_atual, :data_reajuste, :tipo_reajuste)";
    $stmt = $conexao->prepare($sql);

    // Bind dos parâmetros e execução da query
    $stmt->bindParam(':salario_atual', $salario_atual);
    $stmt->bindParam(':data_reajuste', $data_reajuste);
    $stmt->bindParam(':tipo_reajuste', $tipo_reajuste);
    $stmt->execute();

    echo "Dados de histórico de salários inseridos com sucesso!";
} catch(PDOException $e) {
    echo "Erro ao inserir dados de histórico de salários: " . $e->getMessage();
}

$conexao = null; // Fechar conexão
?>
