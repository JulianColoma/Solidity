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

contract BioTechLab is ReentrancyGuard, Ownable {
    mapping(address => uint256) public fondosAportados;

    event AporteRecibido(
        address indexed investigador,
        uint256 monto,
        uint256 fecha
    );

    // Inicializamos al Director del Laboratorio
    constructor() Ownable(msg.sender) {}

    /**
     * @dev Recepción de fondos para la investigación (Mandamiento 5 y 6)
     */
    receive() external payable {
        fondosAportados[msg.sender] += msg.value;
        emit AporteRecibido(msg.sender, msg.value, block.timestamp);
    }

    /**
     * @dev Función para financiar la compra de equipamiento (Mandamiento 1 y 9)
     */
    function financiarInvestigacion(
        uint256 _monto
    ) public onlyOwner nonReentrant {
        uint256 balanceDisponible = address(this).balance;
        require(
            _monto <= balanceDisponible,
            "Fondos insuficientes en el laboratorio"
        );

        // --- APLICANDO CHECKS-EFFECTS-INTERACTIONS ---
        // 1. Check: Ya lo hicimos con el require arriba.
        // 2. Effect: En este caso es el balance global del contrato el que baja.
        // 3. Interaction: Enviamos los fondos al Director.

        (bool success, ) = payable(owner()).call{value: _monto}("");
        require(success, "Error en la transferencia de fondos");
    }

    /**
     * @dev Función de consulta rápida de fondos totales
     */
    function verPresupuestoTotal() public view returns (uint256) {
        return address(this).balance;
    }
}
