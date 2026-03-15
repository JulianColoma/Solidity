// 1. Identificador de Licencia (Obligatorio)
// SPDX-License-Identifier: MIT

// 2. Pragma: Version del compilador
pragma solidity ^0.8.20;

/**
 * @title IntroduccionYTipos
 * @dev Contrato base para entender la estructura y los tipos de datos primitivos.
 */
// 3. Declaracion del Contrato
contract IntroduccionYTipos {

    // --- TIPOS DE DATOS PRIMITIVOS (Variables de Estado) ---
    
    // uint: Numero entero positivo. Se inicializa en 0 por defecto.
    uint256 public numeroPositivo = 42;
    
    // int: Numero entero que puede ser negativo.
    int256 public temperatura = -5;
    
    // bool: Verdadero o falso. Se inicializa en false por defecto.
    bool public estaActivado = true;
    
    // address: Direccion de una wallet o contrato.
    address public billeteraAdmin;
    
    // string: Texto. Cuesta bastante gas guardarlo.
    string public mensajeBienvenida;
}
