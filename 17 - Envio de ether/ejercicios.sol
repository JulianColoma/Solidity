// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * Ejercicio Integrador
 * 🎓 PARTE 1: Recepción de fondos
 * receive: Se activa cuando mandan ETH puro (sin datos).
 * fallback: Se activa si la función llamada no existe o mandan ETH con datos.
 *
 * 🎓 PARTE 2: Egreso de fondos
 * Usamos .call para evitar el límite de gas de los métodos viejos.
 * Aplicamos seguridad para evitar que nos vacíen el contrato (Reentrancy).
 */

contract MiAlcancia {
    // 📝 Escribe tu código aquí debajo
}