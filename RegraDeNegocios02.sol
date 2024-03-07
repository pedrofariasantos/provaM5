// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contrato para registrar e gerenciar transações entre vendedores e compradores
contract ContratoDeTransacao {
    // Estrutura de dados para armazenar informações de cada transação
    struct Transacao {
        string produto; // Nome do produto envolvido na transação
        uint256 valor; // Valor financeiro da transação
        uint256 quantidade; // Quantidade do produto negociado
        address vendedor; // Endereço da carteira do vendedor
        address comprador; // Endereço da carteira do comprador
    }

    // Array para armazenar todas as transações realizadas
    Transacao[] private transacoes;

    // Evento emitido quando uma nova transação é criada
    event NovaTransacao(string produto, uint256 valor, uint256 quantidade, address indexed vendedor, address indexed comprador);

    // Cria uma nova transação e registra no blockchain
    function criarTransacao(string memory produto, uint256 valor, uint256 quantidade, address vendedor, address comprador) public {
        // Verifica se o endereço do comprador é diferente do vendedor para evitar auto-transações
        require(comprador != vendedor, "Transacoes entre a mesma entidade nao sao permitidas");

        // Constrói a nova transação e adiciona ao array de transações
        Transacao memory novaTransacao = Transacao({
            produto: produto,
            valor: valor,
            quantidade: quantidade,
            vendedor: vendedor,
            comprador: comprador
        });
        transacoes.push(novaTransacao);

        // Emite um evento para registrar a nova transação
        emit NovaTransacao(produto, valor, quantidade, vendedor, comprador);
    }

    // Retorna detalhes de todas as transações que envolvem um produto específico
    function obterDetalhesPublicosTransacaoPorProduto(string memory produto) public view returns (string[] memory, uint256[] memory, uint256[] memory) {
        uint256 total = transacoes.length; // Número total de transações
        uint256 contador = 0; // Contador para transações correspondentes

        // Conta o total de transações que correspondem ao produto especificado
        for (uint256 i = 0; i < total; i++) {
            if (keccak256(bytes(transacoes[i].produto)) == keccak256(bytes(produto))) {
                contador++;
            }
        }

        // Inicializa arrays para armazenar detalhes das transações correspondentes
        string[] memory produtos = new string[](contador);
        uint256[] memory valores = new uint256[](contador);
        uint256[] memory quantidades = new uint256[](contador);

        // Preenche os arrays com os dados das transações correspondentes
        contador = 0;
        for (uint256 i = 0; i < total; i++) {
            if (keccak256(bytes(transacoes[i].produto)) == keccak256(bytes(produto))) {
                produtos[contador] = transacoes[i].produto;
                valores[contador] = transacoes[i].valor;
                quantidades[contador] = transacoes[i].quantidade;
                contador++;
            }
        }

        // Retorna os detalhes das transações
        return (produtos, valores, quantidades);
    }

    // Retorna detalhes de todas as transações realizadas
    function obterTodasTransacoesPublicas() public view returns (string[] memory, uint256[] memory, uint256[] memory) {
        uint256 total = transacoes.length; // Número total de transações
        // Inicializa arrays para armazenar os detalhes de todas as transações
        string[] memory produtos = new string[](total);
        uint256[] memory valores = new uint256[](total);
        uint256[] memory quantidades = new uint256[](total);

        // Preenche os arrays com os dados de cada transação
        for (uint256 i = 0; i < total; i++) {
            produtos[i] = transacoes[i].produto;
            valores[i] = transacoes[i].valor;
            quantidades[i] = transacoes[i].quantidade;
        }

        // Retorna os detalhes das transações
        return (produtos, valores, quantidades);
    }
}
