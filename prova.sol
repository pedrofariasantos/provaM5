pragma solidity >=0.5.0 <0.6.0;

// Definição do contrato ZombieFactory
contract ZombieFactory {

    // Evento para ser emitido após a criação de um novo zumbi
    // declare our event here

    uint dnaDigits = 16; // Define o número de dígitos para o DNA do zumbi
    uint dnaModulus = 10 ** dnaDigits; // Define o módulo para garantir que o DNA do zumbi tenha exatamente dnaDigits dígitos

    // Estrutura para representar um zumbi
    struct Zombie {
        string name; // Nome do zumbi
        uint dna; // DNA do zumbi, com um número fixo de dígitos
    }

    // Array dinâmico para armazenar os zumbis criados
    Zombie[] public zombies;

    // Função privada para criar um zumbi e adicionar ao array
    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna)); // Cria um novo zumbi e o adiciona ao array 'zombies'
        // Aqui deveria emitir o evento de zumbi criado
        // and fire it here
    }

    // Função privada que gera um DNA aleatório para um zumbi baseado em uma string de entrada
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str))); // Gera um número aleatório baseado na string fornecida
        return rand % dnaModulus; // Usa o módulo para garantir que o DNA esteja dentro do número de dígitos especificado
    }

    // Função pública para criar um zumbi com um nome e DNA aleatórios
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name); // Gera um DNA aleatório para o novo zumbi
        _createZombie(_name, randDna); // Cria um novo zumbi com o nome e DNA fornecidos
    }

}
