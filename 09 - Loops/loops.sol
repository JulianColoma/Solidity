// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CalculadoraDeSaldos
 * @dev Ejemplo practico de bucles para iteraciones basicas.
 */
contract CalculadoraDeSaldos {

    /* =========================================================
       ACLARACIÓN IMPORTANTE SOBRE LAS "FUNCIONES":
       
       Al igual que sucede con los condicionales, los bucles 
       (`for`, `while`) tampoco pueden existir "sueltos" en el contrato.
       Deberán ir envueltos en bloques de `function` por ahora.
       ========================================================= */

    /**
     * @dev Ejemplo de FOR: Suma iterando un cierto numero de veces.
     * Es la forma mas comun de iterar en Solidity, cuando se sabe 
     * el numero de iteraciones.
     */
    function sumarConFor(uint256 _limite) public pure returns (uint256) {
        uint256 suma = 0;
        
        // Sintaxis: (inicializacion; condicion; incremento de a 1)
        for (uint256 i = 0; i < _limite; i++) {
            suma += i;
        }
        
        return suma;
    }

    /**
     * @dev Ejemplo de WHILE: Busca el primer multiplo de un numero.
     * Se usa cuando NO se sabe el numero exacto de iteraciones por adelantado.
     */
    function encontrarPrimerMultiplo(uint256 _base, uint256 _limiteBusqueda) public pure returns (uint256) {
        uint256 i = 1;
        
        while (i < _limiteBusqueda) {
            if (i % _base == 0) {
                // Al chocar contra un return, no iteramos mas
                return i; 
            }
            i++;
        }
        
        return 0;
    }

    /**
     * @dev Ejemplo con BREAK y CONTINUE:
     * Suma saltando condiciones y se detiene en un tope repentino.
     */
    function sumaConSaltos(uint256 _hasta, uint256 _freno) public pure returns (uint256) {
        uint256 suma = 0;

        for (uint256 i = 1; i <= _hasta; i++) {
            
            // continue: Saltar iteracion actual y moverse a la proxima vuelta del bucle
            if (i % 2 != 0) {
                continue;
            }

            // break: Corta abruptamente el bucle entero 
            if (i == _freno) {
                break;
            }

            suma += i;
        }

        return suma;
    }
}