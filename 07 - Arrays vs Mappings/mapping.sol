// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GestionSaldos
 * @dev Ejemplo didactico para entender la declaracion de los Mappings.
 */
contract GestionSaldos {

    // 1. Declaracion: Vincula una direccion (address) con un balance (uint256)
    // Al ser public, puedes consultarlo pasando la direccion: saldos("0x...")
    mapping(address => uint256) public wallets;

    // 2. Mapping para saber si una direccion esta registrada
    // Por defecto, cualquier direccion no registrada devolvera 'false'
    mapping(address => bool) public esMiembro;
    
    // 3. Mapping conectando un ID numerico con una direccion
    mapping(uint256 => address) public duenosDeTickets;

}