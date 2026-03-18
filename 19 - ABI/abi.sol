// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title LaboratorioABI
 * @dev Contrato para entender como concatenar datos y generar identificadores.
 */
contract LaboratorioABI {

    /**
     * @dev Ejemplo clasico: Concatenar dos strings.
     */
    function unirTextos(string memory _txt1, string memory _txt2) public pure returns (string memory) {
        // 1. abi.encodePacked devuelve bytes
        // 2. Lo envolvemos en string() para convertirlo de nuevo a texto
        return string(abi.encodePacked(_txt1, " ", _txt2));
    }

    /**
     * @dev Ejemplo avanzado: Generar un ID unico para un objeto del mapa.
     * Muy util para crear "llaves" en un mapping.
     */
    function generarIdUnico(uint256 _lat, uint256 _long, string memory _nombre) public pure returns (bytes32) {
        // keccak256 requiere que los datos esten en bytes. 
        // encodePacked los prepara eficientemente.
        return keccak256(abi.encodePacked(_lat, _long, _nombre));
    }

    /**
     * @dev Comparacion visual entre encode y encodePacked.
     */
    function diferenciaEncoding(uint256 _n) public pure returns (bytes memory packed, bytes memory normal) {
        packed = abi.encodePacked(_n); // Mas corto (solo los bytes necesarios)
        normal = abi.encode(_n);       // Mas largo (rellena hasta 32 bytes con ceros)
    }
}