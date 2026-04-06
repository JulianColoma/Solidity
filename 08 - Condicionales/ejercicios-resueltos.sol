// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Verificación de Elegibilidad
 *
 * Implementa un control de acceso por edad. 
 * Si la variable `edad` (provista como entrada) supera o iguala a 18, 
 * retorna "Autorizado". De lo contrario, retorna "Denegado". 
 * 
 * NOTA IMPORTANTÍSIMA: En Solidity, la lógica (if/else) SIEMPRE debe vivr dentro 
 * de una estructura llamada "Función". Más adelante dedicaremos una lección 
 * entera a estudiar las funciones. Por ahora, utilizá la función `verificarEdad` 
 * que ya está armada para escribir tu código dentro de las llaves `{ }`.
 *
 *
 * 🎓 EJERCICIO 2: Optimización del código 
 * 
 * Re-escribe tu lógica anterior utilizando el **Operador Ternario** para 
 * resolver toda la evaluación en una sola línea. 
 * Utilizá la función `verificarTernario` provista.
 */

contract EjerciciosCondicionales {
    
    // 📝 Escribe tu código aquí debajo para el Ejercicio 1
    function verificarEdad(uint256 edad) public pure returns (string memory) {
        // --- TU CÓDIGO AQUÍ ---
        if(edad >= 18){
            return "Autorizado";
        }else{
            return "Denegado";
        }
        // ----------------------
    }
    
    // 📝 Escribe tu código aquí debajo para el Ejercicio 2
    function verificarTernario(uint256 edad) public pure returns (string memory) {
        // --- TU CÓDIGO AQUÍ ---
        return  (edad >= 18)? "Autorizado": "Denegado";
        // ----------------------
    }

}
