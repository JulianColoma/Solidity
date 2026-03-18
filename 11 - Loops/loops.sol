// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CalculadoraDeSaldos
 * @dev Ejemplo practico de bucles para procesar pagos y busquedas.
 */
contract CalculadoraDeSaldos {

    /**
     * @dev Ejemplo de FOR: Suma los numeros de un array.
     * Es la forma mas comun de iterar en Solidity.
     */
    function sumarArray(uint256[] memory _numeros) public pure returns (uint256) {
        uint256 suma = 0;
        
        for (uint256 i = 0; i < _numeros.length; i++) {
            suma += _numeros[i];
        }
        
        return suma;
    }

    /**
     * @dev Ejemplo de WHILE: Busca el primer multiplo de un numero.
     */
    function encontrarPrimerMultiplo(uint256 _base, uint256 _limite) public pure returns (uint256) {
        uint256 i = 1;
        
        while (i < _limite) {
            if (i % _base == 0) {
                return i; // Corta la ejecucion y devuelve el valor
            }
            i++;
        }
        
        return 0;
    }

    /**
     * @dev Ejemplo con BREAK y CONTINUE:
     * Suma solo numeros pares y se detiene si llega a un numero especifico.
     */
    function sumaParesConLimite(uint256 _hasta, uint256 _limiteCorte) public pure returns (uint256) {
        uint256 suma = 0;

        for (uint256 i = 1; i <= _hasta; i++) {
            // Si es impar, saltamos a la siguiente iteracion
            if (i % 2 != 0) {
                continue;
            }

            // Si llegamos al limite de corte, salimos del bucle
            if (i == _limiteCorte) {
                break;
            }

            suma += i;
        }

        return suma;
    }
}