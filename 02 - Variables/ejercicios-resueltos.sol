// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Explorando Tipos de Valores
 *
 * En este ejercicio debes establecer diferentes variables de estado públicas inicializadas. 
 * Requerirás:
 * - Un valor de falso/verdadero activo.
 * - Un entero para contabilizar cantidades.
 * - Un entero capaz de representar temperaturas bajo cero.
 * - Una dirección de usuario de Ethereum de prueba de tu elección.
 *
 *
 * 🎓 EJERCICIO 2: Valores por Defecto (Default Values)
 * 
 * Veremos qué pasa con los valores que declaramos pero no asignamos intencionalmente. 
 * Declara una variable booleana, un entero sin signo y una dirección a nivel global 
 * y de carácter público, pero no definas su valor con un igual (`=`). 
 * 
 * Observa luego (al compilar e inspeccionar) qué valor inicial adquieren por defecto.
 */

contract EjerciciosVariables {
    // 📝 Escribe tu código aquí debajo para el Ejercicio 1
    bool public activo = false;
    uint public cantidades = 0;
    int public temperatura = 0; 
    address public user = msg.sender;

    // 📝 Escribe tu código aquí debajo para el Ejercicio 2
    bool public var1; // default value = false
    uint public var2; // default value = 0
    address public var3; // default value = 0x0000000000000000000000000000000000000000
    // solidity ya inicializa en 0 las variables que declaramos al momento de desplegar
    // por lo que inicializarlas por nuestra cuenta en 0 no es una buena practica (es desaprovechar el gas)
}
