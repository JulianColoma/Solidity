// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title UnidadesYGas
 * @dev Contrato para entender equivalencias de Ether y control de Gas.
 */
contract UnidadesYGas {

    // Las variables de estado guardan el valor en Wei internamente.
    // Solidity provee las palabras clave wei, gwei y ether.
    uint256 public unWei = 1 wei;
    uint256 public unGwei = 1 gwei;     // Equivale a 1.000.000.000 wei (1e9)
    uint256 public unEther = 1 ether;   // Equivale a 1.000.000.000.000.000.000 wei (1e18)

    /**
     * @dev Demuestra que 1 ether es matematicamente igual a 1e18 wei.
     */
    function probarEquivalencia() external pure returns (bool) {
        return 1 ether == 1e18; // Esto retornara true
    }

    /**
     * @dev Funcion que recibe Ether. 
     * Requiere que el usuario envie exactamente 1 Ether (enviado en Wei por debajo).
     */
    function recibirUnEther() external payable {
        // msg.value siempre se evalua en Wei
        require(msg.value == 1 ether, "Debes enviar exactamente 1 Ether");
    }

    /**
     * @dev Bucle infinito simulado para demostrar el limite de gas.
     * ADVERTENCIA: Llamar a esta funcion consumira todo el Gas Limit 
     * que le asignes en la transaccion (o en Metamask) y luego fallara.
     */
    function provocarOutOfGas() external {
        uint256 contador = 0;
        
        // Este bucle correra infinitamente hasta vaciar tu limite de gas
        while (true) {
            contador += 1;
        }
    }

    /**
     * @dev Solidity tiene una funcion global 'gasleft()' que devuelve
     * la cantidad de gas restante en la ejecucion actual.
     * Es util para calculos internos muy especificos.
     */
    function chequearGasRestante() external view returns (uint256) {
        return gasleft();
    }
}