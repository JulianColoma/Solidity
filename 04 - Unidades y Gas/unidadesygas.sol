// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title UnidadesYGas
 * @dev Contrato para entender equivalencias de Ether y control de Gas.
 */
contract UnidadesYGas {

    // Las variables de estado guardan su valor numérico nativo.
    // Solidity provee las palabras clave reservadas `wei`, `gwei` y `ether` 
    // para facilitar trabajar con grandes cantidades de ceros.
    
    // 1 Wei es la unidad indivisible más pequeña de la red Ethereum.
    uint256 public unWei = 1 wei;
    
    // 1 Gwei equivale a 1.000.000.000 wei (mil millones de wei).
    // Suele usarse para medir y pagar el precio del Gas.
    uint256 public unGwei = 1 gwei;     
    
    // 1 Ether equivale a 1.000.000.000.000.000.000 wei (un trillón de wei).
    // Es la unidad principal que manejamos los humanos.
    uint256 public unEther = 1 ether;   

    /**
     * @dev A continuacion usamos una "funcion" de prueba.
     * Esta funcion devuelve `true` probando la matemática interna de la EVM.
     */
    function probarEquivalencia() public pure returns (bool) {
        // Demuestra que 1 ether es matemáticamente igual a 1e18 wei (1 seguido de 18 ceros).
        return 1 ether == 1e18; 
    }

}