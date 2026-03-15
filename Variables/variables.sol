// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title VariablesFacuMapp
 * @dev Contrato para ilustrar los tres tipos de variables en Solidity.
 */
contract VariablesFacuMapp {

    // 1. VARIABLES DE ESTADO
    // Se guardan en la blockchain. Cuestan Gas.
    uint256 public totalInteracciones;
    address public ultimoUsuario;

    /**
     * @dev Funcion que combina los tres tipos de variables.
     */
    function registrarInteraccion(uint256 _multiplicador) external payable returns (uint256) {
        
        // 2. VARIABLES GLOBALES
        // Proveidas por la EVM. No las declaramos nosotros.
        require(msg.value > 0, "Debes enviar algo de Ether"); // msg.value = wei enviados
        ultimoUsuario = msg.sender;                           // msg.sender = quien ejecuta esto

        // 3. VARIABLES LOCALES
        // Viven solo aca adentro. Son baratas.
        uint256 calculoTemporal = msg.value * _multiplicador;
        uint256 timestampActual = block.timestamp;            // block.timestamp = tiempo del bloque

        // Modificamos el estado usando un calculo local
        totalInteracciones += 1;

        // Retornamos la variable local. Al terminar la funcion, 'calculoTemporal' se destruye.
        return calculoTemporal;
    }

    /**
     * @dev Ejemplo de optimizacion usando variables locales como "cache".
     */
    function bucleInoptimo() external {
        // MAL: Leer y escribir en la variable de estado 'totalInteracciones' en cada iteracion cuesta muchisimo gas.
        for(uint256 i = 0; i < 5; i++) {
            totalInteracciones += 1; 
        }
    }

    function bucleOptimo() external {
        // BIEN: Copiamos el estado a una variable local (memoria)
        uint256 iteracionesLocales = totalInteracciones;

        for(uint256 i = 0; i < 5; i++) {
            iteracionesLocales += 1; // Las operaciones en memoria son casi gratis
        }

        // Al final, actualizamos la variable de estado UNA sola vez
        totalInteracciones = iteracionesLocales;
    }
}