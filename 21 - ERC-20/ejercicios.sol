// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
 * 🎓 EJERCICIO 1: Configuración del Token
 * 1. Heredar de ERC20.
 * 2. Crear un constructor que reciba un nombre y un símbolo dinámico.
 * 3. Mintear un suministro inicial de 1.000.000 de tokens al creador del contrato.
 * ⚠️ Debes tener en cuenta los 18 decimales.
 *
 * 🎓 EJERCICIO 2: El Airdrop (Distribución Masiva)
 * Imagina que querés promocionar tu token. Debes crear una función 'repartirTokens'.
 * 1. Debe recibir un array de direcciones (address[] calldata recipients).
 * 2. Debe recibir un monto fijo a enviar a cada uno (uint256 amount).
 * 3. La función debe validar que el total a repartir no supere el balance del contrato.
 * 4. Usar un bucle 'for' para realizar las transferencias.
 * ⚠️ Al heredar de ERC20, ya tenés la función balanceOf y transfer disponibles.
 */

// 📝 Escribí tu contrato aquí