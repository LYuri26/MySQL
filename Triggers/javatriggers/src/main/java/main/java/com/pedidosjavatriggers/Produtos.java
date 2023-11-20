package main.java.com.pedidosjavatriggers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Produtos {
    private Connection connection;
    private Scanner scanner;

    public Produtos(Connection connection, Scanner scanner) {
        this.connection = connection;
        this.scanner = scanner;
    }

    public void inserirProduto(String nome, int quantidade, double valor) {
        String query = "INSERT INTO produto (nome, quantidade, valor) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, nome);
            pstmt.setInt(2, quantidade);
            pstmt.setDouble(3, valor);
            pstmt.executeUpdate();
            System.out.println("Produto inserido com sucesso.");
        } catch (SQLException e) {
            System.err.println("Erro ao inserir produto: " + e.getMessage());
        }
    }

    public void atualizarProduto(int idProduto, String novoNome, int novaQuantidade, double novoValor) {
        String query = "UPDATE produto SET nome = ?, quantidade = ?, valor = ? WHERE id_produto = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, novoNome);
            pstmt.setInt(2, novaQuantidade);
            pstmt.setDouble(3, novoValor);
            pstmt.setInt(4, idProduto);
            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Produto atualizado com sucesso.");
            } else {
                System.out.println("Produto não encontrado.");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar produto: " + e.getMessage());
        }
    }

    public void excluirProduto(int idProduto) {
        String query = "DELETE FROM produto WHERE id_produto = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, idProduto);
            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Produto excluído com sucesso.");
            } else {
                System.out.println("Produto não encontrado.");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao excluir produto: " + e.getMessage());
        }
    }

    public void consultarProdutos() {
        String query = "SELECT * FROM produto";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int idProduto = rs.getInt("id_produto");
                String nome = rs.getString("nome");
                int quantidade = rs.getInt("quantidade");
                double valor = rs.getDouble("valor");
                System.out.println(idProduto + " | " + nome + " | " + quantidade + " | " + valor);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao consultar produtos: " + e.getMessage());
        }
    }
}
