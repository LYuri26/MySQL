package com.oscarjava;

import java.sql.*;
import java.util.Scanner;

public class InserirDiretor {

    // Configurações de conexão com o banco de dados
    static final String URL = "jdbc:mysql://localhost:3306/oscardb";
    static final String USUARIO = "root";
    static final String SENHA = "";

    public static void main(String[] args) {
        try {
            // Carregar o driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Estabelecer conexão com o banco de dados
            Connection conn = DriverManager.getConnection(URL, USUARIO, SENHA);

            // Preparar a declaração SQL para inserir dados na tabela Diretores
            String sql = "INSERT INTO Diretores (Nome, Sexo, ID_Filme) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Usar Scanner para ler os dados do console
            Scanner scanner = new Scanner(System.in);

            System.out.println("Inserindo novo diretor...");
            System.out.print("Nome do diretor: ");
            String nome = scanner.nextLine();

            System.out.print("Sexo: ");
            String sexo = scanner.nextLine();

            System.out.print("ID do Filme: ");
            int idFilme = scanner.nextInt();

            // Inserir dados na tabela Diretores
            pstmt.setString(1, nome);
            pstmt.setString(2, sexo);
            pstmt.setInt(3, idFilme);

            int linhasAfetadas = pstmt.executeUpdate();
            if (linhasAfetadas > 0) {
                System.out.println("Diretor inserido com sucesso!");
            } else {
                System.out.println("Falha ao inserir o diretor.");
            }

            // Fechar recursos
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
