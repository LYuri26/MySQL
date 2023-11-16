<?php
// Incluindo o arquivo de conexão
include "./conexao.php";

// Função para obter entrada do usuário via terminal
function getInput($message) {
    echo $message . "\n";
    return trim(fgets(STDIN));
}

// Obtendo a conexão do arquivo conexao.php
$conn = getConnection(); // Função em conexao.php para retornar a conexão PDO

// Função para determinar o ascendente com base na data de nascimento, hora de nascimento e hora do nascer do sol
function determinarAscendente($data, $horaNascimento, $horaNascerSol) {
    // Lista dos signos do zodíaco
    $signos = array(
        "Áries", "Touro", "Gêmeos", "Câncer", "Leão", "Virgem",
        "Libra", "Escorpião", "Sagitário", "Capricórnio", "Aquário", "Peixes"
    );

    // Divide a data em partes usando o caractere '/'
    $partesData = explode("/", $data);

    // Divide a hora de nascimento em partes usando o caractere ':'
    $partesHora = explode(":", $horaNascimento);

    // Verifica se foram obtidas corretamente três partes na data e duas na hora de nascimento
    if (count($partesData) !== 3 || count($partesHora) !== 2) {
        return "Ascendente não calculado"; // Retorna uma mensagem de erro se os dados estiverem incorretos
    }

    // Converte as partes em inteiros para validação
    $dia = (int)$partesData[0];
    $mes = (int)$partesData[1];
    $hora = (int)$partesHora[0];
    $minutos = (int)$partesHora[1];

    // Verifica a validade dos dados inseridos
    if ($mes < 1 || $mes > 12 || $dia < 1 || $dia > 31 || $hora < 0 || $hora > 23 || $minutos < 0 || $minutos > 59) {
        return "Ascendente não calculado"; // Retorna uma mensagem de erro se os dados estiverem incorretos
    }

    // Intervalo de horas para cada signo (apenas um exemplo)
    $intervalo = 2;

    // Determina o signo com base na data de nascimento
    $signo = determinarSigno($data);

    // Encontra a posição do signo na lista
    $posicao = array_search($signo, $signos);

    // Verifica se o signo foi encontrado
    if ($posicao !== false) {
        // Calcular a hora do nascer do sol
        $horaNascerSolParsed = DateTime::createFromFormat('H:i', $horaNascerSol);

        // Comparar a hora do nascer do sol com a hora de nascimento
        if ($horaNascerSolParsed < DateTime::createFromFormat('H:i', "$hora:$minutos")) {
            // Atualizar o ascendente
            $horasDiferenca = $horaNascerSolParsed->diff(DateTime::createFromFormat('H:i', "$hora:$minutos"))->h;
            $novaPosicao = ($posicao + ($horasDiferenca / $intervalo)) % 12;
            return $signos[$novaPosicao];
        } else {
            return $signos[$posicao]; // Não houve mudança de ascendente
        }
    } else {
        return "Ascendente não calculado"; // Retorna uma mensagem de erro se o signo não for encontrado
    }
}

// Função para determinar o signo com base na data de nascimento
function determinarSigno($data) {
    $partesData = explode("/", $data);

    // Verifica se existem três partes (dia, mês, ano)
    if (count($partesData) !== 3) {
        return "dados inválidos"; // Retorna uma mensagem de erro se os dados estiverem incorretos
    }

    // Converte as partes em números inteiros para validação
    $dia = (int)$partesData[0];
    $mes = (int)$partesData[1];

    // Verifica a validade dos dados inseridos (mês entre 1 e 12, dia entre 1 e 31)
    if ($mes < 1 || $mes > 12 || $dia < 1 || $dia > 31) {
        return "dados inválidos"; // Retorna uma mensagem de erro se os dados estiverem incorretos
    }

    // Determina o signo com base no mês e dia de nascimento
    switch ($mes) {
        case 1:
            return ($dia >= 20) ? "Aquário" : "Capricórnio";
        case 2:
            return ($dia >= 19) ? "Peixes" : "Aquário";
        case 3:
            return ($dia >= 21) ? "Áries" : "Peixes";
        case 4:
            return ($dia >= 20) ? "Touro" : "Áries";
        case 5:
            return ($dia >= 21) ? "Gêmeos" : "Touro";
        case 6:
            return ($dia >= 21) ? "Câncer" : "Gêmeos";
        case 7:
            return ($dia >= 23) ? "Leão" : "Câncer";
        case 8:
            return ($dia >= 23) ? "Virgem" : "Leão";
        case 9:
            return ($dia >= 23) ? "Libra" : "Virgem";
        case 10:
            return ($dia >= 23) ? "Escorpião" : "Libra";
        case 11:
            return ($dia >= 22) ? "Sagitário" : "Escorpião";
        case 12:
            return ($dia >= 22) ? "Capricórnio" : "Sagitário";
        default:
            return "dados inválidos"; // Retorna uma mensagem de erro se o mês for inválido
    }
}

// Solicita ao usuário para inserir o nome
$nome = getInput("Digite o seu nome: ");

// Solicita ao usuário para inserir a data de nascimento
$data = getInput("Digite a data no formato dd/mm/aaaa: ");

// Solicita ao usuário para inserir a hora de nascimento
$horaNascimento = getInput("Digite a hora de nascimento (formato 24h - hh:mm): ");

// Solicita ao usuário para inserir a hora do nascer do sol
$horaNascerSol = getInput("Digite a hora do nascer do sol (formato 24h - hh:mm): ");

// Determina o signo e o ascendente
$signo = determinarSigno($data);
$ascendente = determinarAscendente($data, $horaNascimento, $horaNascerSol);

// Verifica se o signo e o ascendente não são inválidos
if ($signo !== "dados inválidos" && $ascendente !== "Ascendente não calculado") {
    // Prepara a query para inserir os dados no banco de dados
    $stmt = $conn->prepare("INSERT INTO horoscopo (Nome, Signo, Ascendente) VALUES (:nome, :signo, :ascendente)");

    // Verifica se a query está pronta para ser executada
    if ($stmt) {
        // Faz o bind dos parâmetros e executa a query
        $stmt->bindParam(":nome", $nome);
        $stmt->bindParam(":signo", $signo);
        $stmt->bindParam(":ascendente", $ascendente);

        $stmt->execute();

        echo "Dados inseridos no banco de dados com sucesso!\n";
    } else {
        echo "Erro ao preparar a query.\n";
    }
    // A conexão com o PDO é fechada automaticamente ao final do script,
}
?>
