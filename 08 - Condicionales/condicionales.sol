// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EvaluadorNotas
 * @dev Ejemplo practico de condicionales y operador ternario.
 */
contract EvaluadorNotas {

    /* =========================================================
       ACLARACIÓN IMPORTANTE SOBRE LAS "FUNCIONES":
       
       En Solidity, las instrucciones de control (`if`, `else`, etc.) 
       NO pueden existir sueltas en el contrato. Deben estar 
       encapsuladas dentro de bloques de ejecución llamados `funciones`.
       
       Veremos esto en profundidad más adelante. Por ahora, 
       enfócate exclusivamente en la lógica que hay dentro de 
       las llaves de cada función en estos ejemplos.
       ========================================================= */

    /**
     * @dev Determina el estado de un alumno segun su nota usando if-else.
     */
    function obtenerCalificacion(uint256 _nota) public pure returns (string memory) {
        
        if (_nota >= 6) {
            return "Promocionado";
        } else if (_nota >= 4) {
            return "Final";
        } else {
            return "Recursa";
        }
        
    }

    /**
     * @dev Ejemplo de operador ternario para una decision simple en una linea.
     */
    function esPar(uint256 _n) public pure returns (bool) {
        // Sintaxis: condicion ? valor_si_true : valor_si_false
        return (_n % 2 == 0) ? true : false;
    }

}