// Define a versão do compilador Solidity que este contrato usará
pragma solidity 0.8.24;

// Interface para outros contratos seguirem, garantindo que implementem essas funções
interface IExampleInterface {
    // Declaração de uma função que deve ser implementada
    function exampleFunction() external returns(uint);
}

// Contrato base que pode ser herdado por outros contratos
contract BaseContract {
    // Variável de estado privada, acessível apenas dentro deste contrato
    uint private data;

    // Evento que é emitido quando 'data' muda
    event DataChanged(uint newValue);

    // Função protegida que pode ser acessada por contratos herdeiros
    function setData(uint _data) internal {
        data = _data;
        emit DataChanged(_data); // Emissão do evento
    }
}

// Contrato principal que herda de 'BaseContract' e implementa 'IExampleInterface'
contract MainContract is BaseContract, IExampleInterface {

    // Variável pública que todos podem acessar, mas somente o contrato pode modificar
    address public owner;

    // Modificador que restringe o acesso a certas funções apenas ao proprietário do contrato
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _; // Continua a execução da função
    }

    // Construtor executado uma vez na criação do contrato
    constructor() {
        owner = msg.sender; // Define o proprietário do contrato como quem o implantou
    }

    // Implementação da função obrigatória da interface
    function exampleFunction() external override returns(uint) {
        return 123; // Valor de exemplo
    }

    // Função pública que somente o proprietário pode chamar
    function changeData(uint _data) public onlyOwner {
        setData(_data); // Chama 'setData' do contrato base
    }

    // Função para receber Ether e registrar o valor recebido
    receive() external payable {
        emit DataChanged(msg.value); // Assume que a mudança de dados está relacionada ao valor recebido
    }

    // Função para retirar todo o Ether do contrato
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
