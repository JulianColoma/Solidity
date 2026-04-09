// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 Ejercicio integrador: Vehículos 
 * * 🎓 PARTE 1: El Estándar (Interface)
 * * Imagina que estás creando un sistema para que cualquier peaje pueda hablar con cualquier vehículo.
 * 1. Definí una interfaz llamada 'IVehiculo'. 
 * 2. Solo debe tener dos funciones:
 * - acelerar.
 * - detener.
 *
 * 🎓 PARTE 2: El Molde Base (Contract Abstract)
 * * Ahora crea una base común para ahorrar código, pero que no se puede desplegar sola.
 * 1. Definí un contrato abstracto 'BaseVehiculo' que herede de IVehiculo.
 * 2. Agregá una variable publica combustible.
 * 3. Implementá 'detener()' para que siempre ponga una variable enMovimiento en false.
 * 4. Dejá 'acelerar()' como una función a implementar.
 * 5. Creá una función nueva cargarCombustible() que sea solo para los hijos.
 *
 * 🎓 PARTE 3: El Modelo Real (Contract)
 * * Es hora de fabricar un vehículo de verdad.
 * 1. Creá el contrato 'Auto' que herede de 'BaseVehiculo'.
 * 2. Implementá la lógica de 'acelerar()': debe gastar 10 de combustible y poner 'enMovimiento' en true.
 * 3. Agregá un constructor para que el auto nazca con 100 de combustible y detenido.
 */

// 📝 Escribe tu código aquí debajo