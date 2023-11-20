package main.java.com.pedidosjavatriggers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Scanner;

public class Pedidos {
    private Connection connection;
    private Scanner scanner;

    public Pedidos(Connection connection, Scanner scanner) {
        this.connection = connection;
        this.scanner = scanner;
    }

    public void inserirPedido(int idCliente, int idProduto, int quantidade, String status) {
        String query = "INSERT INTO pedido (id_cliente, id_produto, quantidade, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, idCliente);
            pstmt.setInt(2, idProduto);
            pstmt.setInt(3, quantidade);
            pstmt.setString(4, status);
            pstmt.executeUpdate();
            System.out.println("Pedido inserido com sucesso.");
        } catch (SQLException e) {
            System.err.println("Erro ao inserir pedido: " + e.getMessage());
        }
    }

    public void atualizarStatus(int idPedido, String novoStatus) {

        String query = "UPDATE pedido SET status = ? WHERE id_pedido = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, novoStatus);
            pstmt.setInt(2, idPedido);
            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Status do pedido atualizado com sucesso.");
            } else {
                System.out.println("Pedido não encontrado.");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar status do pedido: " + e.getMessage());
        }
    }

    public void excluirPedido(int idPedido) {
        String query = "DELETE FROM pedido WHERE id_pedido = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, idPedido);
            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Pedido excluído com sucesso.");
            } else {
                System.out.println("Pedido não encontrado.");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao excluir pedido: " + e.getMessage());
        }
    }

    public void consultarPedidos() {
        String query = "SELECT * FROM pedido";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int idPedido = rs.getInt("id_pedido");
                int idCliente = rs.getInt("id_cliente");
                int idProduto = rs.getInt("id_produto");
                int quantidade = rs.getInt("quantidade");
                String status = rs.getString("status");
                Timestamp data = rs.getTimestamp("data");
                System.out.println(idPedido + " | " + idCliente + " | " + idProduto + " | " + quantidade + " | "
                        + status + " | " + data);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao consultar pedidos: " + e.getMessage());
        }
    }
}
