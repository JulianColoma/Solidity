// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GasOptimizado {
    
    // --- OPTIMIZACION DE SLOTS ---
    // Estos tres entran en UN SOLO slot de 32 bytes (16+8+1 = 25 bytes)
    uint128 public a;
    uint64 public b;
    bool public c; 

    // --- CONSTANTES ---
    // No ocupan storage, van directo al bytecode
    uint256 public constant MAX_USUARIOS = 1000;
    address public immutable OWNER;

    constructor() {
        OWNER = msg.sender;
    }

    /**
     * @dev Uso de 'calldata' en lugar de 'memory' para ahorrar gas en lectura.
     */
    function procesarLista(string[] calldata _nombres) external pure returns (uint256) {
        return _nombres.length;
    }

    /**
     * @dev Ejemplo de corto-circuito en condiciones.
     */
    function operacionPrivada(uint256 _valor) external view {
        // Ponemos la validacion mas barata y probable de fallar primero
        require(_valor > 0 && msg.sender == OWNER, "No permitido");
        // ... logica
    }

    /**
     * @dev TIP: Usar ++i es ligeramente mas barato que i++ en bucles.
     */
    function bucleEficiente(uint256 _vueltas) external pure {
        for (uint256 i = 0; i < _vueltas; ++i) {
            // logica
        }
    }
}