// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Funciones puras
 *
 * Implementa la funcion duplicar. Recibe un entero sin signo y devuelve su multiplicacion por 2.
 * Asegurarse de que no se reciban numeros impares.
 * 
 * 🎓 EJERCICIO 2: Retornos Múltiples (Multiple returns)
 * 
 * Diseña una única función matemática que reciba dos números como argumentos y sea capaz 
 * de retornar, de forma simultánea, tres resultados distintos:
 * - La sumatoria de ambos.
 * - El producto de ambos.
 * - Una confirmación booleana indicando si el primero es estrictamente mayor que el segundo.
 *
 * 🎓 EJERCICIO 3: Funciones view
 * Crear una variable de estado saldo y asignarle un valor. 
 * Diseñar la funcion externa fondoSuficiente que reciba un importe numerico y devuelva true si los fondos son suficientes
 */


contract EjerciciosFunciones {
    // 📝 Escribe tu código aquí debajo
    function duplicar(uint _numerito)public pure returns(uint){
        require(_numerito % 2 == 0, "No se permiten impares");
        return _numerito * 2;
    }

    function multipleReturn (uint _numerito1, uint _numerito2)public pure returns(uint suma, uint producto, bool esMayor) {
        return (_numerito1 + _numerito2, _numerito1 * _numerito2, _numerito1 > _numerito2);
    }

    uint fondo = 100 ether;

    function fondoSuficiente(uint _importe)external view returns (bool esSuficiente){
        return (fondo >= _importe);
    } 
}


