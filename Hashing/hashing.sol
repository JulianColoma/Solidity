// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title LaboratorioHashing
 * @dev Aplicacion practica de Keccak256 para IDs y comparaciones.
 */
contract LaboratorioHashing {
    // Almacenamos un hash para simular una "contraseña" o ID secreto
    bytes32 public hashGuardado;

    /**
     * @dev Genera un ID unico basado en varios datos.
     */
    function generarID(
        uint256 _piso,
        string memory _aula,
        address _responsable
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_piso, _aula, _responsable));
    }

    /**
     * @dev La UNICA forma eficiente de comparar dos strings en Solidity.
     */
    function compararCadenas(
        string memory _a,
        string memory _b
    ) public pure returns (bool) {
        return
            keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b));
    }

    /**
     * @dev Guarda un hash en el estado (Storage).
     */
    function guardarHash(string memory _palabraSecreta) external {
        hashGuardado = keccak256(abi.encodePacked(_palabraSecreta));
    }

    /**
     * @dev Verifica si una entrada coincide con el hash guardado.
     */
    function verificarSecreto(
        string memory _intento
    ) external view returns (bool) {
        return keccak256(abi.encodePacked(_intento)) == hashGuardado;
    }
}
