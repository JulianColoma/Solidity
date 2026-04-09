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
    address public owner;

    error NoSosElDuenio();
    error SaldoInsuficiente();
    error FalloElEnvio();

    constructor() {
        owner = msg.sender;
    }

    // Se dispara cuando mandás ETH desde la wallet sin tocar ninguna función
    receive() external payable { }

    // Se dispara si mandás ETH y te equivocás de función o mandás datos raros
    fallback() external payable { }

    function retirar(address payable _destino, uint256 _monto) external {
        // 1. Validaciones (Checks)
        if (msg.sender != owner) revert NoSosElDuenio();
        if (address(this).balance < _monto) revert SaldoInsuficiente();

        // 2. Interacción (Interaction)
        // La coma vacía es porque el call devuelve (bool, bytes), pero el segundo dato no nos sirve ahora
        (bool exito, ) = _destino.call{value: _monto}("");
        
        // 3. Verificación de resultado
        if (!exito) revert FalloElEnvio();
    }

    // Consulta rápida para ver cuánto hay guardado en el contrato
    function verSaldo() public view returns (uint256) {
        return address(this).balance;
    }
}