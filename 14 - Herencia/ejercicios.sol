// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: El Árbol Genealógico (virtual & override & super)
 * 1. Definí un contrato padre 'Hardware' con la función virtual 'descripcion'.
 * 2. Creá un hijo 'Monitor' que sobreescriba el mensaje, 
 *    Usá 'super.descripcion()' en 'Monitor' para combinar mensajes.
 *    NOTA: para concatenar strings se utiliza string(abi.encodePacked("hola ", "mundo"))
 *
 * 🎓 EJERCICIO 2: Herencia con Constructores y Permisos
 * 1. Creá 'BaseSeguridad' con 'owner' y el modifier 'soloOwner'.
 * 2. Creá 'Servidor' que herede de 'BaseSeguridad' y proteja una función.
 *
 * 🎓 EJERCICIO 3: Herencia Múltiple (El "Súper Contrato")
 * * Vamos a crear un contrato que sea Hardware y que además tenga Seguridad.
 * 1. Creá un contrato llamado 'SmartMonitor'.
 * 2. Hacé que herede de AMBOS: 'Hardware' y 'BaseSeguridad'.
 * 3. Dentro de 'SmartMonitor', creá una función 'configuracion' que 
 * devuelva la 'descripcion()' (de Hardware) pero que SOLO pueda 
 * ser ejecutada por el 'owner' (de BaseSeguridad).
 */


// 📝 Escribe tu código aquí debajo