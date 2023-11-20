package com.oscarjava.InserirEditarDeletarFilmes;

import java.sql.*;
import java.util.Scanner;

public class FilmeCRUD {

    // Configurações de conexão com o banco de dados
    static final String URL = "jdbc:mysql://localhost:3306/oscardb";
    static final String USUARIO = "root";
    static final String SENHA = "";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Escolha uma opção:");
            System.out.println("1. Inserir filme");
            System.out.println("2. Editar filme");
            System.out.println("3. Deletar filme");
            System.out.println("4. Sair");

            int escolha = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            switch (escolha) {
                case 1:
                    inserirFilme();
                    break;
                case 2:
                    editarFilme();
                    break;
                case 3:
                    deletarFilme();
                    break;
                case 4:
                    System.out.println("Encerrando o programa...");
                    return;
                default:
                    System.out.println("Opção inválida. Tente novamente.");
            }
        }
    }

    public static void inserirFilme() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "INSERT INTO Filmes (Nome, Tipo_de_Filme, Lancamento) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Inserindo novo filme...");
            System.out.print("Nome do filme: ");
            String nome = scanner.nextLine();

            System.out.print("Tipo de filme: ");
            String tipo = scanner.nextLine();

            System.out.print("ID do Roteiro: ");
            int idRoteiro = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            System.out.print("Data de Lançamento (AAAA-MM-DD): ");
            String dataLancamento = scanner.nextLine();

            pstmt.setString(1, nome);
            pstmt.setString(2, tipo);
            pstmt.setString(3, dataLancamento);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Filme inserido com sucesso!");
            } else {
                System.out.println("Falha ao inserir o filme.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void editarFilme() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "UPDATE Filmes SET Nome = ?, Tipo_de_Filme = ?, Lancamento = ? WHERE ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Editando filme...");
            System.out.print("ID do filme que deseja editar: ");
            int idFilme = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            System.out.print("Novo nome do filme: ");
            String novoNome = scanner.nextLine();

            System.out.print("Novo tipo de filme: ");
            String novoTipo = scanner.nextLine();

            System.out.print("Novo ID do Roteiro: ");
            scanner.nextLine(); // Limpar o buffer

            System.out.print("Nova data de lançamento (AAAA-MM-DD): ");
            String novaDataLancamento = scanner.nextLine();

            pstmt.setString(1, novoNome);
            pstmt.setString(2, novoTipo);
            pstmt.setString(3, novaDataLancamento);
            pstmt.setInt(4, idFilme);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Filme editado com sucesso!");
            } else {
                System.out.println("Falha ao editar o filme. Verifique o ID do filme.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deletarFilme() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "DELETE FROM Filmes WHERE ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Deletando filme...");
            System.out.print("ID do filme que deseja deletar: ");
            int idFilme = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            pstmt.setInt(1, idFilme);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Filme deletado com sucesso!");
            } else {
                System.out.println("Falha ao deletar o filme. Verifique o ID do filme.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
