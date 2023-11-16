<?php

function getConnection() {
    $servername = "localhost"; // substitua pelo seu servidor
    $username = "root"; // substitua pelo seu usuário
    $password = ""; // substitua pela sua senha
    $dbname = "horoscopo_db"; // nome do banco de dados

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        // Configura o PDO para lançar exceções em caso de erro
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        // Em caso de erro na conexão, exibe uma mensagem
        die("Erro na conexão: " . $e->getMessage());
    }
}
?>
