package main.java.com.pedidosjavatriggers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String DB_NAME = "pedidostriggers";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private Statement statement;

    public Connection conectar() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexão estabelecida.");

            criarBancoDeDados();
            connection.setCatalog(DB_NAME);
            criarTabelas(connection);
            criarTriggers(connection);

        } catch (SQLException e) {
            System.err.println("Erro ao conectar: " + e.getMessage());
        }
        return connection;
    }

    public void desconectar(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Conexão encerrada.");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao desconectar: " + e.getMessage());
        }
    }

    private void criarBancoDeDados() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            statement = connection.createStatement();
            statement.executeUpdate("CREATE DATABASE IF NOT EXISTS " + DB_NAME);
            System.out.println("Banco de dados criado com sucesso!");
            statement.close();
        } catch (SQLException e) {
            System.err.println("Erro ao criar banco de dados: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void criarTabelas(Connection connection) {
        try {
            statement = connection.createStatement();

            String criarTabelaCliente = "CREATE TABLE IF NOT EXISTS cliente (" +
                    "id_cliente INT AUTO_INCREMENT PRIMARY KEY," +
                    "nome VARCHAR(50)," +
                    "email VARCHAR(50)," +
                    "telefone VARCHAR(20)" +
                    ")";

            String criarTabelaProduto = "CREATE TABLE IF NOT EXISTS produto (" +
                    "id_produto INT AUTO_INCREMENT PRIMARY KEY," +
                    "nome VARCHAR(50)," +
                    "quantidade INT," +
                    "valor DECIMAL(10, 2)" +
                    ")";

            String criarTabelaPedido = "CREATE TABLE IF NOT EXISTS pedido (" +
                    "id_pedido INT AUTO_INCREMENT PRIMARY KEY," +
                    "id_cliente INT," +
                    "id_produto INT," +
                    "quantidade INT," +
                    "status ENUM('pendente', 'entregue', 'cancelado') DEFAULT 'pendente'," +
                    "data TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
                    "FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)," +
                    "FOREIGN KEY (id_produto) REFERENCES produto(id_produto)" +
                    ")";

            statement.executeUpdate(criarTabelaCliente);
            statement.executeUpdate(criarTabelaProduto);
            statement.executeUpdate(criarTabelaPedido);
            System.out.println("Tabelas criadas com sucesso!");

            statement.close();
        } catch (SQLException e) {
            System.err.println("Erro ao criar tabelas: " + e.getMessage());
        }
    }

    private void criarTriggers(Connection connection) {
        try {
            Statement statement = connection.createStatement();

            String criarTriggerPendente = "CREATE TRIGGER IF NOT EXISTS after_pedido_update_pendente " +
                    "AFTER UPDATE ON pedido FOR EACH ROW " +
                    "BEGIN " +
                    "    IF NEW.status = 'pendente' OR NEW.status = 'entregue' THEN " +
                    "        UPDATE produto " +
                    "        SET quantidade = CASE " +
                    "            WHEN NEW.status = 'pendente' THEN quantidade - NEW.quantidade " +
                    "            ELSE quantidade " +
                    "        END " +
                    "        WHERE id_produto = NEW.id_produto; " +
                    "    END IF; " +
                    "END";

            String criarTriggerCancelado = "CREATE TRIGGER IF NOT EXISTS after_pedido_update_cancelado " +
                    "AFTER UPDATE ON pedido FOR EACH ROW " +
                    "BEGIN " +
                    "    IF NEW.status = 'cancelado' THEN " +
                    "        UPDATE produto " +
                    "        SET quantidade = quantidade + OLD.quantidade " +
                    "        WHERE id_produto = OLD.id_produto; " +
                    "    END IF; " +
                    "END";

            String criarTriggerInsert = "CREATE TRIGGER IF NOT EXISTS after_pedido_insert " +
                    "AFTER INSERT ON pedido FOR EACH ROW " +
                    "BEGIN " +
                    "    UPDATE produto " +
                    "    SET quantidade = quantidade - NEW.quantidade " +
                    "    WHERE id_produto = NEW.id_produto; " +
                    "END";

            statement.executeUpdate(criarTriggerPendente);
            statement.executeUpdate(criarTriggerCancelado);
            statement.executeUpdate(criarTriggerInsert);
            System.out.println("Triggers criados com sucesso!");

            statement.close();
        } catch (SQLException e) {
            System.err.println("Erro ao criar triggers: " + e.getMessage());
        }
    }
}
