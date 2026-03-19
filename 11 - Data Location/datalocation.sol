// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DataLocationLab {
    struct Registro {
        string texto;
    }

    mapping(uint256 => Registro) public registros;

    // USO DE STORAGE: Modifica el estado global
    function editarStorage(uint256 _id, string memory _nuevo) external {
        Registro storage r = registros[_id]; 
        r.texto = _nuevo; // ✅ Cambia el valor en la Blockchain
    }

    // USO DE MEMORY: Solo para cálculos temporales
    function editarMemory(uint256 _id, string memory _nuevo) external view returns (string memory) {
        Registro memory r = registros[_id]; 
        r.texto = _nuevo; // ❌ NO cambia el valor en la Blockchain
        return r.texto;   // Devuelve el cambio solo en esta ejecución
    }

    // USO DE CALLDATA: Optimización de lectura
    function leerEntrada(string calldata _input) external pure returns (string calldata) {
        // _input = "error"; // ❌ Esto fallaría (es inmutable)
        return _input;
    }
}