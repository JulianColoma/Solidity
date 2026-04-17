// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/*
 * 🎓 PROYECTO INTEGRADOR: Lab Decentralized
 * * Has sido contratado para programar el sistema de financiamiento del laboratorio
 * de blockchain. El contrato debe ser un búnker de seguridad.
 * * REQUERIMIENTOS TÉCNICOS:
 * 1. Contabilidad: Un mapping 'fondosAportados' para registrar cuánto puso cada billetera.
 * 2. Transparencia: Emitir el evento 'AporteRecibido' con (donante, monto, timestamp).
 * 3. Flexibilidad: Implementar 'receive()' para recibir Ether sin llamar a funciones.
 * 4. Seguridad Nivel Auditor:
 * - Solo el Director (Owner) puede retirar fondos para comprar insumos.
 * - El retiro debe usar el patrón Checks-Effects-Interactions.
 * - Debes heredar y usar 'nonReentrant' para prevenir ataques de reentrada.
 */

// --- ESCRIBE TU CONTRATO AQUÍ ---
