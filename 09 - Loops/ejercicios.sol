// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Bucle de Cuenta Regresiva
 *
 * Construye una sumatoria consecutiva progresiva. 
 * Dada una cuota numérica variable ingresada de tipo `n`, desarrolla un bucle `for` 
 * que incremente linealmente de uno en uno hasta llegar a dicho límite `n`.
 * Durante el proceso, suma dichos números e incrementa una variable total.
 * Devuelve ese total.
 * 
 * NOTA: Utiliza la función `sumatoria` provista. Escribe tu bucle 
 * dentro de las llaves correspondientes.
 *
 *
 * 🎓 EJERCICIO 2: Iterar hasta una condición (Buscador Seguro)
 * 
 * Ahora vamos a buscar en un array. El array ya viene cargado.
 * Construye un bucle `while` que recorra el array buscando el número `clave`.
 * 
 * Cuando encuentres el elemento, debes abortar el ciclo anticipadamente usando `break`
 * para ahorrar gas, y devolver la posición donde lo encontraste.
 * Si nunca lo encuentras, recorre todo el array y devuelve 999.
 * 
 * NOTA: Utiliza la función `buscarTesorito` provista.
 */

contract EjerciciosLoops {
    
    // 📝 Escribe tu código aquí debajo para el Ejercicio 1
    function sumatoria(uint256 n) public pure returns (uint256) {
        // --- TU CÓDIGO AQUÍ ---
        
        // ----------------------
    }

    uint256[] public repositorioDeCifras = [15, 42, 8, 99, 23, 10];

    // 📝 Escribe tu código aquí debajo para el Ejercicio 2
    function buscarTesorito(uint256 clave) public view returns (uint256) {
        // --- TU CÓDIGO AQUÍ ---
        
        // ----------------------
    }
}
