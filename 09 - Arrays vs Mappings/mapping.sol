// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title GestionSaldos
 * @dev Ejemplo didactico para entender el funcionamiento de los Mappings.
 */
contract GestionSaldos {

    // 1. Declaracion: Vincula una direccion con un balance de tokens
    mapping(address => uint256) public saldos;

    // 2. Mapping para saber si una direccion esta registrada
    mapping(address => bool) public esMiembro;

    /**
     * @dev Asigna un saldo a una direccion.
     * Observa que no hay que "crear" el espacio, solo asignar.
     */
    function setSaldo(address _usuario, uint256 _cantidad) external {
        saldos[_usuario] = _cantidad;
        esMiembro[_usuario] = true;
    }

    /**
     * @dev Consulta el saldo. 
     * Si la direccion no existe, devolvera 0 automaticamente.
     */
    function consultarSaldo(address _usuario) external view returns (uint256) {
        return saldos[_usuario];
    }

    /**
     * @dev Aumenta el saldo existente.
     */
    function depositar() external payable {
        saldos[msg.sender] += msg.value;
        esMiembro[msg.sender] = true;
    }

    /**
     * @dev Borra la entrada de un mapping.
     * En realidad, resetea el valor al valor por defecto (0 o false).
     */
    function eliminarRegistro() external {
        delete saldos[msg.sender];
        delete esMiembro[msg.sender];
    }
}