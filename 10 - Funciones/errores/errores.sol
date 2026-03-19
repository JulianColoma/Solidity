// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GestorUbicaciones
 * @dev Contrato para el manejo de ubicaciones del mapa interactivo con control de errores.
 */
contract GestorUbicaciones {

    address public administrador;
    uint256 public totalUbicaciones;

    // 1. Definicion de un Custom Error (Ahorra mucho Gas)
    // Podemos pasarle parametros para saber exactamente que fallo
    error NoAutorizado(address usuarioQueIntento);
    error CoordenadasInvalidas();

    constructor() {
        administrador = msg.sender; // Quien despliega el contrato es el admin
    }

    /**
     * @dev Funcion con validaciones usando Require y Custom Errors.
     */
    function agregarPunto(string calldata _nombre, uint256 _latitud, uint256 _longitud) external {
        
        // Uso de REQUIRE clasico con string
        // Cuesta mas gas porque guarda el texto en la transaccion
        require(bytes(_nombre).length > 0, "El nombre no puede estar vacio");

        // Uso de CUSTOM ERROR con REVERT (Recomendado)
        // Es mas barato y permite pasar el dato del infractor
        if (msg.sender != administrador) {
            revert NoAutorizado(msg.sender);
        }

        if (_latitud == 0 || _longitud == 0) {
            revert CoordenadasInvalidas();
        }

        // Si pasa todas las validaciones, ejecutamos la logica
        totalUbicaciones += 1;

        // Uso de ASSERT
        // Comprueba que la variable jamas se haya desbordado o corrompido.
        // Si esto falla, hay un error critico en la EVM o en nuestra logica base.
        assert(totalUbicaciones > 0); 
    }

    /**
     * @dev Ejemplo de revert clasico dentro de logica condicional.
     */
    function procesarDatoComplejo(uint256 _codigo) external pure returns (string memory) {
        if (_codigo == 1) {
            return "Pabellon A";
        } else if (_codigo == 2) {
            return "Laboratorios";
        } else {
            // Revert clasico con mensaje
            revert("Codigo de ubicacion desconocido");
        }
    }
}