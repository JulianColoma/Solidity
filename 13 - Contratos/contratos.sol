// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MapaUTN
 * @dev Contrato principal para gestionar los datos de un mapa interactivo universitario.
 * Demuestra la inicializacion de datos a traves del constructor.
 */
contract MapaUTN {

    // Variables de estado
    address public immutable administrador;
    string public facultad;
    uint256 public fechaDeCreacion;
    bool public mapaActivo;

    // Supongamos que queremos llevar un registro de cuantas sedes maneja este contrato
    uint256 public totalSedesRegistradas;

    /**
     * @dev El constructor recibe argumentos durante el despliegue.
     * Si despliegas esto en Remix, veras que te pide un string antes de darle al boton "Deploy".
     */
    constructor(string memory _nombreFacultad) {
        // 1. Definimos al dueño del contrato. 
        // msg.sender aca es quien apreto el boton de 'Deploy' y pago el Gas.
        administrador = msg.sender;

        // 2. Inicializamos variables de estado con los argumentos recibidos
        facultad = _nombreFacultad;

        // 3. Inicializamos variables con datos globales de la EVM
        fechaDeCreacion = block.timestamp;

        // 4. Configuramos el estado inicial de la logica
        mapaActivo = true;
        totalSedesRegistradas = 0; // Aunque esto es redundante porque por defecto los uint inician en 0
    }

    /**
     * @dev Ejemplo de funcion que usa los datos inicializados por el constructor.
     */
    function desactivarMapa() external {
        // Usamos la variable 'administrador' que se configuro para siempre en el despliegue
        require(msg.sender == administrador, "Solo el admin puede desactivar el mapa");
        mapaActivo = false;
    }

    /**
     * @dev Funcion de consulta para ver el estado general.
     */
    function obtenerInfoGeneral() external view returns (string memory, address, bool) {
        return (facultad, administrador, mapaActivo);
    }
}