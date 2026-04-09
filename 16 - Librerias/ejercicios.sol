// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 📦 IMPORTACIÓN REAL: Traemos la herramienta estándar de la industria
import "@openzeppelin/contracts/utils/Strings.sol";

/*
 * 🎓 INTRODUCCIÓN A OPENZEPPELIN
 * No reinventamos la rueda. Usamos '@openzeppelin/contracts' porque es el código
 * más auditado y seguro del ecosistema. Hoy usamos 'Strings' para convertir datos,
 * pero es la base para crear cualquier Token o NFT profesional.
 *
 * 🎓 EJERCICIO 1: Encapsulamiento de Lógica (Biblioteca Propia)
 * 1. Creá una 'library' llamada 'CalculosCombustible'.
 * 2. Definí la función 'gastarSeguro(uint256 _actual, uint256 _gasto)' 
 * que valide el saldo actual y devuelva la resta.
 * 3. Usala en la función 'acelerar' para descontar de a 10 unidades.
 *
 * 🎓 EJERCICIO 2: Usando el Estándar (Strings)
 * 1. Aplicá la librería para los uint256.
 * 2. Creá una función 'verCombustibleTexto' que devuelva el combustible 
 * convertido a string usando '.toString()'.
 */

// 📝 Escribe tu código aquí debajo
