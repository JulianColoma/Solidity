// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Storage vs Memory
 *
 * Define globalmente en el contrato una variable de texto. Construye dos funciones 
 * que intenten actualizar y pisar esta variable con un contenido diferente:
 * - La primera función debe asignar el texto global en una región temporal y efímera 
 *   durante la ejecución, y cambiar su valor allí mismo.
 * - La segunda debe alterar permanentemente el dato, apuntando e interceptando la 
 *   referencia original de almacenamiento persistente.
 * Observa cuidosaménte el comportamiento final de la variable pública tras la ejecución de ambas.
 *
 *
 * 🎓 EJERCICIO 2: Optimizando inputs de sólo lectura
 * 
 * Crea un método externalizado que pretenda recibir un texto gigante y pesado como parámetro. 
 * En este caso, no tienes ninguna intención de mutarlo ni transformarlo dentro de tu lógica, 
 * por lo que exprimirás al máximo el ahorro de comisiones. 
 * 
 * Aplica la ubicación de datos más estricta sobre el parámetro del input para que su procesamiento
 * cueste la mínima cantidad posible de gas a las billeteras de los usuarios.
 */

contract EjerciciosDataLocation {
    // 📝 Escribe tu código aquí debajo

}
