package com.oscarjava.InserirEditarDeletar;

import java.sql.*;
import java.util.Scanner;

public class DiretorCRUD {

    // Configurações de conexão com o banco de dados
    static final String URL = "jdbc:mysql://localhost:3306/oscardb";
    static final String USUARIO = "root";
    static final String SENHA = "";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Escolha uma opção:");
            System.out.println("1. Inserir diretor");
            System.out.println("2. Editar diretor");
            System.out.println("3. Deletar diretor");
            System.out.println("4. Sair");

            int escolha = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            switch (escolha) {
                case 1:
                    inserirDiretor();
                    break;
                case 2:
                    editarDiretor();
                    break;
                case 3:
                    deletarDiretor();
                    break;
                case 4:
                    System.out.println("Encerrando o programa...");
                    return;
                default:
                    System.out.println("Opção inválida. Tente novamente.");
            }
        }
    }

    public static void inserirDiretor() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "INSERT INTO Diretores (Nome, Sexo, ID_Filme) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Inserindo novo diretor...");
            System.out.print("Nome do diretor: ");
            String nome = scanner.nextLine();

            System.out.print("Sexo: ");
            String sexo = scanner.nextLine();

            System.out.print("ID do Filme: ");
            int idFilme = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            pstmt.setString(1, nome);
            pstmt.setString(2, sexo);
            pstmt.setInt(3, idFilme);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Diretor inserido com sucesso!");
            } else {
                System.out.println("Falha ao inserir o diretor.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void editarDiretor() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "UPDATE Diretores SET Nome = ?, Sexo = ?, ID_Filme = ? WHERE ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Editando diretor...");
            System.out.print("ID do diretor que deseja editar: ");
            int idDiretor = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            System.out.print("Novo nome do diretor: ");
            String novoNome = scanner.nextLine();

            System.out.print("Novo sexo: ");
            String novoSexo = scanner.nextLine();

            System.out.print("Novo ID do Filme: ");
            int novoIdFilme = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            pstmt.setString(1, novoNome);
            pstmt.setString(2, novoSexo);
            pstmt.setInt(3, novoIdFilme);
            pstmt.setInt(4, idDiretor);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Diretor editado com sucesso!");
            } else {
                System.out.println("Falha ao editar o diretor. Verifique o ID do diretor.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deletarDiretor() {
        try {
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            String sql = "DELETE FROM Diretores WHERE ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            Scanner scanner = new Scanner(System.in);

            System.out.println("Deletando diretor...");
            System.out.print("ID do diretor que deseja deletar: ");
            int idDiretor = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer

            pstmt.setInt(1, idDiretor);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Diretor deletado com sucesso!");
            } else {
                System.out.println("Falha ao deletar o diretor. Verifique o ID do diretor.");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
