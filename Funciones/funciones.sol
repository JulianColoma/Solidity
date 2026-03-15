// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title MapaUniversitario
 * @dev Contrato didactico para entender visibilidad y modificadores en funciones.
 */
contract MapaUniversitario {

    string public nombreUniversidad = "UTN FRLP";
    uint256 private contadorUbicaciones;

    struct Ubicacion {
        string nombre;
        string coordenadas;
    }

    mapping(uint256 => Ubicacion) public mapa;

    /**
     * @dev Funcion EXTERNAL: Solo se llama desde afuera.
     * Modifica el estado, por lo tanto cuesta Gas.
     */
    function agregarUbicacion(string calldata _nombre, string calldata _coordenadas) external {
        // Llamamos a una funcion interna para el calculo
        uint256 nuevoId = _generarId();
        mapa[nuevoId] = Ubicacion(_nombre, _coordenadas);
    }

    /**
     * @dev Funcion PRIVATE: Solo se usa dentro de este contrato.
     * Como modifica la variable 'contadorUbicaciones', NO es view ni pure.
     */
    function _generarId() private returns (uint256) {
        contadorUbicaciones += 1;
        return contadorUbicaciones;
    }

    /**
     * @dev Funcion VIEW y PUBLIC: Lee el estado pero no lo altera.
     * Puede llamarse desde adentro o desde afuera. No cuesta gas si se consulta de afuera.
     */
    function obtenerNombreYUniversidad(uint256 _id) public view returns (string memory, string memory) {
        // Ejemplo de retorno multiple
        return (mapa[_id].nombre, nombreUniversidad);
    }

    /**
     * @dev Funcion PURE: No lee variables de estado ('nombreUniversidad' o 'contadorUbicaciones').
     * Solo opera con lo que le pasan por parametro.
     */
    function calcularDistanciaSimulada(uint256 _x1, uint256 _x2) public pure returns (uint256) {
        if (_x1 > _x2) {
            return _x1 - _x2;
        }
        return _x2 - _x1;
    }

    /**
     * @dev Funcion PAYABLE: Puede recibir Wei/Ether.
     */
    function donarParaElProyecto() external payable {
        // El ether queda almacenado en el saldo de este contrato
        require(msg.value > 0, "Debes enviar algo de Ether");
    }
}