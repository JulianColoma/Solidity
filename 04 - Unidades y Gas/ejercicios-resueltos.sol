// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Configurando la Bóveda
 * * Para que el contrato funcione, necesitamos definir montos claros. 
 * Declará una variable de estado pública llamada 'presupuestoViaje' 
 * y asignale el valor de 2 Ether.
 *
 * 🎓 EJERCICIO 2: El Peaje (Gas)
 * * Toda operación en Ethereum consume Gas. 
 * Declará una variable de estado pública llamada 'costoPeaje' 
 * y asignale el valor de 500 Gwei.
 *
 * 🎓 EJERCICIO 3: Verificación de Ceros
 * * Queremos estar seguros de que 1 Ether son 18 ceros.
 * Declará una variable booleana (bool) pública llamada 'esCorrecto' 
 * que guarde el resultado de comparar 1 ether contra 1e18.
 *
 * 🎓 EJERCICIO 4: El Saldo Restante
 * * Finalmente, declará una variable llamada 'saldoFinal' que sea 
 * el resultado de restar 'presupuestoViaje' menos 'costoPeaje'.
 * Observá en Remix cómo Solidity hace la resta perfecta convirtiendo el total a Wei.
 */

contract EjerciciosUnidadesYGas {
    // 📝 Escribe tu código aquí debajo
    uint public presupuestoViaje = 2 ether;
    uint public costoPeaje = 500 gwei;
    bool public esCorrecto = (1 ether == 1e18);
    uint public saldoFinal = (presupuestoViaje - costoPeaje);
}