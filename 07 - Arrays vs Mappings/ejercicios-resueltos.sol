// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Arrays
 *
 * Desarrolla el almacenamiento de un inventario numérico de precios expandible. 
 * Crea un array dinámico público de números enteros (`uint`) llamado `tarifas`.
 *
 *
 * 🎓 EJERCICIO 2: Trabajando con Mappings
 * 
 * Desarrolla el core de un sistema de saldos bancarios internos. 
 * Cada usuario distinto que interactúe con el contrato debe tener un casillero virtual asociando 
 * de manera íntima su dirección propia con un balance numérico. 
 * 
 * Implementa un mapping público llamado `saldos` que asocie un `address` con un `uint`.
 */

contract EjerciciosArraysMappings {
    // 📝 Escribe tu código aquí debajo
    uint[] public tarifas;

    mapping (address => uint) public saldos;
}
