package main.java.com.pedidosjavatriggers;

import java.sql.Connection;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Conexao conexao = new Conexao();
        Connection connection = conexao.conectar();

        Scanner scanner = new Scanner(System.in);
        Cliente cliente = new Cliente(connection, scanner);
        Produtos produtos = new Produtos(connection, scanner);
        Pedidos pedidos = new Pedidos(connection, scanner);

        boolean continuar = true;

        while (continuar) {
            System.out.println("Escolha uma opção:");
            System.out.println("1 - Gerenciar Clientes");
            System.out.println("2 - Gerenciar Produtos");
            System.out.println("3 - Gerenciar Pedidos");
            System.out.println("4 - Sair");

            int opcao = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer do scanner

            switch (opcao) {
                case 1:
                    System.out.println("Menu de Clientes:");
                    System.out.println("1 - Inserir Cliente");
                    System.out.println("2 - Atualizar Cliente");
                    System.out.println("3 - Excluir Cliente");
                    System.out.println("4 - Consultar Clientes");

                    int escolhaCliente = scanner.nextInt();
                    scanner.nextLine(); // Limpar o buffer do scanner

                    switch (escolhaCliente) {
                        case 1:
                            System.out.println("Inserir Cliente:");
                            System.out.println("Digite o nome do cliente:");
                            String nome = scanner.nextLine();
                            System.out.println("Digite o email do cliente:");
                            String email = scanner.nextLine();
                            System.out.println("Digite o telefone do cliente:");
                            String telefone = scanner.nextLine();

                            // Chame o método de inserção de cliente da classe Cliente
                            cliente.inserirCliente(nome, email, telefone);
                            break;
                        case 2:
                            System.out.println("Atualizar Cliente:");
                            System.out.println("Digite o ID do cliente que deseja atualizar:");
                            int idCliente = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer

                            // Verifique se o cliente existe antes de prosseguir

                            System.out.println("Digite o novo nome do cliente:");
                            String novoNome = scanner.nextLine();
                            System.out.println("Digite o novo email do cliente:");
                            String novoEmail = scanner.nextLine();
                            System.out.println("Digite o novo telefone do cliente:");
                            String novoTelefone = scanner.nextLine();

                            // Chame o método de atualização de cliente da classe Cliente
                            cliente.atualizarCliente(idCliente, novoNome, novoEmail, novoTelefone);
                            break;
                        case 3:
                            System.out.println("Excluir Cliente:");
                            System.out.println("Digite o ID do cliente que deseja excluir:");
                            int idClienteExcluir = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer

                            // Verifique se o cliente existe antes de prosseguir

                            // Chame o método de exclusão de cliente da classe Cliente
                            cliente.excluirCliente(idClienteExcluir);
                            break;
                        case 4:
                            System.out.println("Consultar Clientes:");
                            // Chame o método de consulta de clientes da classe Cliente
                            cliente.consultarClientes();
                            break;
                        default:
                            System.out.println("Opção inválida para clientes.");
                            break;
                    }
                    break;

                case 2:
                    System.out.println("Menu de Produtos:");
                    System.out.println("1 - Inserir Produto");
                    System.out.println("2 - Atualizar Produto");
                    System.out.println("3 - Excluir Produto");
                    System.out.println("4 - Consultar Produtos");

                    int escolhaProduto = scanner.nextInt();
                    scanner.nextLine(); // Limpar o buffer do scanner

                    switch (escolhaProduto) {
                        case 1:
                            System.out.println("Inserir Produto:");
                            System.out.println("Digite o nome do produto:");
                            String nomeProduto = scanner.nextLine();
                            System.out.println("Digite a quantidade do produto:");
                            int quantidadeProduto = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner
                            System.out.println("Digite o valor do produto:");
                            double valorProduto = scanner.nextDouble();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            // Chamada do método de inserção de produto da classe Produtos
                            produtos.inserirProduto(nomeProduto, quantidadeProduto, valorProduto);
                            break;
                        case 2:
                            System.out.println("Atualizar Produto:");
                            System.out.println("Digite o ID do produto que deseja atualizar:");
                            int idProdutoAtualizar = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            // Verificar se o produto existe antes de prosseguir

                            System.out.println("Digite o novo nome do produto:");
                            String novoNomeProduto = scanner.nextLine();
                            System.out.println("Digite a nova quantidade do produto:");
                            int novaQuantidadeProduto = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner
                            System.out.println("Digite o novo valor do produto:");
                            double novoValorProduto = scanner.nextDouble();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            // Chamada do método de atualização de produto da classe Produtos
                            produtos.atualizarProduto(idProdutoAtualizar, novoNomeProduto, novaQuantidadeProduto,
                                    novoValorProduto);
                            break;
                        case 3:
                            System.out.println("Excluir Produto:");
                            System.out.println("Digite o ID do produto que deseja excluir:");
                            int idProdutoExcluir = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            // Verificar se o produto existe antes de prosseguir

                            // Chamada do método de exclusão de produto da classe Produtos
                            produtos.excluirProduto(idProdutoExcluir);
                            break;
                        case 4:
                            System.out.println("Consultar Produtos:");
                            // Chamada do método de consulta de produtos da classe Produtos
                            produtos.consultarProdutos();
                            break;
                        default:
                            System.out.println("Opção inválida para produtos.");
                            break;
                    }

                    break;
                case 3:
                    System.out.println("Menu de Pedidos:");
                    System.out.println("1 - Inserir Pedido");
                    System.out.println("2 - Atualizar Pedido");
                    System.out.println("3 - Excluir Pedido");
                    System.out.println("4 - Consultar Pedidos");

                    int escolhaPedido = scanner.nextInt();
                    scanner.nextLine(); // Limpar o buffer do scanner

                    switch (escolhaPedido) {
                        case 1:
                            System.out.println("Inserir Pedido:");
                            System.out.println("Digite o ID do cliente:");
                            int idClientePedido = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner
                            System.out.println("Digite o ID do produto:");
                            int idProdutoPedido = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner
                            System.out.println("Digite a quantidade:");
                            int quantidadePedido = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner
                            System.out.println("Digite o status (pendente/entregue/cancelado):");
                            String statusPedido = scanner.nextLine();

                            // Chamada do método de inserção de pedido da classe Pedidos
                            pedidos.inserirPedido(idClientePedido, idProdutoPedido, quantidadePedido, statusPedido);
                            break;
                        case 2:
                            System.out.println("Atualizar Pedido:");
                            System.out.println("Digite o ID do pedido que deseja atualizar:");
                            int idPedidoAtualizar = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            System.out.println("Digite o novo status do pedido (pendente, entregue ou cancelado):");
                            String novoStatusPedido = scanner.nextLine();

                            pedidos.atualizarStatus(idPedidoAtualizar, novoStatusPedido);
                            break;
                        case 3:
                            System.out.println("Excluir Pedido:");
                            System.out.println("Digite o ID do pedido que deseja excluir:");
                            int idPedidoExcluir = scanner.nextInt();
                            scanner.nextLine(); // Limpar o buffer do scanner

                            // Verificar se o pedido existe antes de prosseguir

                            // Chamada do método de exclusão de pedido da classe Pedidos
                            pedidos.excluirPedido(idPedidoExcluir);
                            break;
                        case 4:
                            System.out.println("Consultar Pedidos:");
                            // Chamada do método de consulta de pedidos da classe Pedidos
                            pedidos.consultarPedidos();
                            break;
                        default:
                            System.out.println("Opção inválida para pedidos.");
                            break;
                    }

                    break;
                case 4:
                    continuar = false;
                    break;
                default:
                    System.out.println("Opção inválida.");
                    break;
            }
        }

        conexao.desconectar(connection);
        scanner.close();
    }
}
