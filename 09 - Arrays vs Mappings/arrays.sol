// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Arrays
 * @dev Contrato didactico para entender la manipulacion de arrays fijos y dinamicos.
 */
contract Arrays {
    
    // Array de tamaño fijo (se inicializa con ceros)
    uint256[3] public arrayFijo = [10, 20, 30];

    // Array dinamico
    uint256[] public arrayDinamico;

    /**
     * @dev Agrega un numero al final del array dinamico.
     */
    function agregar(uint256 _n) external {
        arrayDinamico.push(_n);
    }

    /**
     * @dev Elimina el ultimo elemento y reduce el tamaño del array.
     */
    function eliminarUltimo() external {
        require(arrayDinamico.length > 0, "Array vacio"); 
        arrayDinamico.pop();
    }

    /**
     * @dev Retorna la longitud del array.
     */
    function obtenerLongitud() external view returns (uint256) {
        return arrayDinamico.length;
    }

    /**
     * @dev Demostracion de comportamiento del comando 'delete'.
     * CUIDADO: El tamaño del array NO cambia, el valor se vuelve 0.
     */
    function resetearElemento(uint256 _indice) external {
        require(_indice < arrayDinamico.length, "Indice fuera de rango");
        delete arrayDinamico[_indice];
    }

    /**
     * @dev Ejemplo de array en memoria. 
     * Nota: En memoria el tamaño debe ser fijo y no se puede usar .push().
     */
    function ejemploMemoria() external pure returns (uint256[] memory) {
        uint256[] memory arrayEnMemoria = new uint256[](2);
        arrayEnMemoria[0] = 55;
        arrayEnMemoria[1] = 99;
        return arrayEnMemoria;
    }

    /**
     * @dev Retornar todo el array (solo recomendado para arrays pequeños).
     */
    function obtenerTodo() external view returns (uint256[] memory) {
        return arrayDinamico;
    }
}