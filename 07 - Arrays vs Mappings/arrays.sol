// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Arrays
 * @dev Contrato didactico para entender la declaracion de arrays fijos y dinamicos.
 */
contract Arrays {
    
    // Array de tamaño fijo (se inicializa con ceros si no se le dan valores)
    // Al hacerlo public, Solidity genera una forma de consultar posiciones individuales: arrayFijo(0)
    uint256[3] public arrayFijo = [10, 20, 30];

    // Array dinamico, su tamaño puede crecer
    // Como es public, Solidity permite leer elementos individuales: arrayDinamico(indice)
    uint256[] public arrayDinamico;
    
    // Array dinamico inicializado con valores
    uint256[] public arrayDinamicoInicializado = [5, 15, 25];
}