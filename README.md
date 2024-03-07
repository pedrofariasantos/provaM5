# provaM5
Nome da Função: Identifica unicamente a função dentro do contrato.

Parâmetros: Lista de entradas que a função aceita. Cada parâmetro tem um tipo e um nome.

Visibilidade:

public: Função acessível de dentro e fora do contrato.
private: Função acessível apenas de dentro do contrato onde foi definida.
internal: Função acessível de dentro do contrato e contratos derivados.
external: Função acessível apenas de fora do contrato.
Mutabilidade:

pure: Indica que a função não lê nem modifica o estado do contrato.
view: Indica que a função não modifica o estado, mas pode ler.
payable: Permite que a função receba Ether junto com a chamada.
Sem especificador: A função pode modificar o estado do contrato.
Retorno: Tipo de dados que a função retorna após sua execução. Funções também podem retornar múltiplos valores.

Modificadores: Usados para modificar o comportamento das funções. Exemplos comuns incluem restrições de acesso (onlyOwner), verificação de condições (require), entre outros.

Corpo da Função: Contém a lógica executada quando a função é chamada.

set(uint256 x): É uma função public, que significa que qualquer um pode chamá-la. Ela aceita um argumento uint256 e modifica o estado do contrato, além de emitir um evento.

get(): É uma função public e view, que permite que ela seja lida externamente e que leia dados do contrato sem modificá-los.

add(uint256 a, uint256 b): É uma função pure, pois não lê nem altera o estado, apenas executa cálculos com os inputs.

deposit(): É uma função payable, permitindo que ela receba Ether quando chamada.

internalFunction(): É uma função internal, não acessível fora do contrato ou sem herança, e é pure, significando que não modifica nem lê o estado do contrato.
