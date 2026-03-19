// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VariablesFacuMapp
 * @dev Contrato para ilustrar los tres tipos de variables en Solidity.
 */
contract VariablesFacuMapp {

    // 1. VARIABLES DE ESTADO
    // Se guardan en la blockchain de manera permanente. Cuestan Gas al ser modificadas.
    // Al declararlas 'public', se pueden leer gratuitamente desde afuera.
    uint256 public totalInteracciones;
    address public ultimoUsuario;

    /**
     * @dev A continuacion usamos una "funcion" de prueba.
     * Recuerda que la lógica y variables locales solo pueden existir dentro de funciones.
     */
    function registrarInteraccion(uint256 _multiplicador) public payable returns (uint256) {
        
        // 2. VARIABLES GLOBALES
        // Proveidas directamente por la EVM (Ethereum Virtual Machine). No las declaramos nosotros.
        ultimoUsuario = msg.sender; // msg.sender = "direccion de quien llama a este contrato"

        // 3. VARIABLES LOCALES
        // Viven solo aca adentro de esta funcion. No se guardan en la blockchain.
        uint256 calculoTemporal = 5 * _multiplicador;
        uint256 timestampActual = block.timestamp; // block.timestamp = tiempo de creacion del bloque

        // Modificamos el estado usando matematica simple
        totalInteracciones = totalInteracciones + 1;

        // Retornamos la variable local. Al terminar la funcion, 'calculoTemporal' y 'timestampActual' se destruyen.
        return calculoTemporal;
    }
}