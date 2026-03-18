// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SeguridadMapa
 * @dev Ejemplo profesional de como usar modificadores para gestionar permisos y estados.
 */
contract SeguridadMapa {

    address public owner;
    bool public pausado;
    mapping(address => bool) public esEditor;

    // Error personalizado para mayor eficiencia
    error SoloOwner();
    error SoloEditor();
    error ContratoPausado();

    constructor() {
        owner = msg.sender;
    }

    // 1. MODIFICADOR BASICO: Restriccion de acceso
    modifier onlyOwner() {
        if (msg.sender != owner) revert SoloOwner();
        _; // Aqui se ejecuta el cuerpo de la funcion
    }

    // 2. MODIFICADOR CON PARAMETROS: Verifica si una billetera tiene permisos
    modifier onlyEditor(address _usuario) {
        if (!esEditor[_usuario] && _usuario != owner) revert SoloEditor();
        _;
    }

    // 3. MODIFICADOR DE ESTADO: Verifica si el contrato no esta pausado
    modifier cuandoNoEstePausado() {
        if (pausado) revert ContratoPausado();
        _;
    }

    /**
     * @dev Asignar editores (Solo el owner puede hacerlo)
     */
    function asignarEditor(address _nuevoEditor) external onlyOwner {
        esEditor[_nuevoEditor] = true;
    }

    /**
     * @dev Funcion protegida por dos escudos (encadenamiento)
     */
    function agregarPuntoCritico() external onlyEditor(msg.sender) cuandoNoEstePausado {
        // Logica para agregar punto...
    }

    /**
     * @dev Pausar el contrato en caso de emergencia
     */
    function alternarPausa() external onlyOwner {
        pausado = !pausado;
    }
}