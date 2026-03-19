// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ConfiguracionMap
 * @dev Contrato para entender la diferencia entre variables de estado normales, inmutables y constantes.
 */
contract ConfiguracionMap {

    // 1. CONSTANTE: El valor se define directo en el codigo.
    // Las variables constantes no cuestan gas despues de ser compiladas.
    // Ideal para limites estrictos o valores fijos (ej. limite de aulas a registrar).
    uint256 public constant LIMITE_PUNTOS_MAPA = 500;
    string public constant NOMBRE_PROYECTO = "FacuMapp UTN FRLP";

    // 2. INMUTABLE: El valor se define al momento de desplegar el contrato.
    // Ideal para definir quien es el administrador o el timestamp de creacion original.
    address public immutable administrador;
    uint256 public immutable fechaDeDespliegue;

    // 3. VARIABLE NORMAL: Ocupa storage de forma regular y puede cambiar (muy caro escribirla).
    uint256 public puntosRegistrados;

    /**
     * @dev El 'constructor' es un bloque especial de codigo que se ejecuta UNA SOLA VEZ 
     * en toda la vida del contrato: en el instante exacto en que se sube a la red.
     * Es el unico lugar donde podemos darle valor dinámico a las variables 'immutable'.
     */
    constructor() {
        // msg.sender aca es la billetera que esta pagando el despliegue del contrato
        administrador = msg.sender;
        
        // block.timestamp es una variable global con la fecha actual del bloque
        fechaDeDespliegue = block.timestamp;
    }

}