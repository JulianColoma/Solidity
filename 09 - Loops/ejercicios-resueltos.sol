// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Bucle de Cuenta Regresiva
 *
 * Construye una sumatoria consecutiva progresiva. 
 * Dada una cuota numérica variable ingresada de tipo n y un limite, desarrolla un bucle `for` 
 * que incremente linealmente de n en n hasta llegar al limite (tener en cuenta que el paso puede desbordar del limite en la ultima iteracion).
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
    function sumatoria(uint256 n, uint256 _limite) public pure returns (uint256) {
        // --- TU CÓDIGO AQUÍ ---

       if(n > _limite || n == 0){
        return 0;
        }

        uint256 total;
        for(uint256 i = n; i <= _limite; i+=n){
            total += n;
            if (_limite - i < n) {
                break;
            }   
        }
        return total;

        // ----------------------
    }

    uint256[] public repositorioDeCifras = [15, 42, 8, 99, 23, 10];

    // 📝 Escribe tu código aquí debajo para el Ejercicio 2
    function buscarTesorito(uint256 clave) public view returns (uint256) {
        // --- TU CÓDIGO AQUÍ ---
        uint256[] memory copia = repositorioDeCifras;
        uint256 i;
        uint256 limite = copia.length;
        while(i < limite){
            if(copia[i] == clave){
                break;
            }else{
                i++;
            }
        }
        return (i == limite)? 999 : i;
        // ----------------------
    }
}
