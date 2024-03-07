pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 private storedData;

    event DataChanged(uint256 newValue);

    // Uma função pública que aceita um valor e armazena
    function set(uint256 x) public {
        storedData = x;
        emit DataChanged(x);
    }

    // Uma função 'view' que retorna o valor armazenado
    function get() public view returns (uint256) {
        return storedData;
    }

    // Uma função 'pure' que calcula a soma de dois números
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Função 'payable' que permite receber Ether
    function deposit() public payable {
        // Lógica para lidar com o Ether recebido
    }

    // Função interna que não pode ser chamada fora do contrato
    function internalFunction() internal pure returns (string memory) {
        return "Internal";
    }
}

// 