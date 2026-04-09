// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CajaFuerte
 * @dev Ejemplo de como un contrato gestiona entradas inesperadas.
 */
contract CajaFuerte {
    
    event PagoRecibido(address indexed remitente, uint256 monto);
    event FuncionNoEncontrada(address indexed remitente, uint256 monto, bytes datos);

    /**
     * @dev Se dispara cuando mandas ETH sin datos (ej. desde MetaMask).
     */
    receive() external payable {
        emit PagoRecibido(msg.sender, msg.value);
    }

    /**
     * @dev Se dispara cuando la llamada es rara o la funcion no existe.
     */
    fallback() external payable {
        emit FuncionNoEncontrada(msg.sender, msg.value, msg.data);
    }

    /**
     * @dev Para ver cuanto acumuló el contrato.
     */
    function consultarSaldo() public view returns (uint256) {
        return address(this).balance;
    }
}