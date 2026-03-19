// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Variables de Estado
 * 
 * Define dos variables de estado. Una de ellas constant debe almacenar el numero pi y permitir ser 
 * leída por cualquier usuario externo o contrato de manera automática y nativa. 
 * 
 * La otra variable de estado debe ser immutable, debe almacenar la wallet que despliega el contrato
 * no debe exponer un método de lectura nativo ni permitir 
 * que contratos de terceros accedan a ella directamente. 
 */

contract EjerciciosVariablesEstado {
    // 📝 Escribe tu código aquí debajo
    uint256 public constant PI = 3141592653589793238; // no existen los decimales en solidity poner 3,14 es un error
    //  Ejemplo de pi con 18 decimales 1e18

    address private immutable administrador;
    constructor(){
        administrador = msg.sender;
    }
}
