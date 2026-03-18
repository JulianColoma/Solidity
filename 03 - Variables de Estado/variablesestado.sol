// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title ConfiguracionMap
 * @dev Contrato para entender la diferencia entre variables de estado normales, inmutables y constantes.
 */
contract ConfiguracionMap {

    // 1. CONSTANTE: El valor se define directo en el codigo.
    // Ideal para limites estrictos o valores fijos (ej. limite de aulas a registrar).
    uint256 public constant LIMITE_PUNTOS_MAPA = 500;
    string public constant NOMBRE_PROYECTO = "FacuMapp UTN FRLP";

    // 2. INMUTABLE: El valor se define al momento de desplegar el contrato.
    // Ideal para definir quien es el administrador o el timestamp de creacion.
    address public immutable administrador;
    uint256 public immutable fechaDeDespliegue;

    // 3. VARIABLE NORMAL: Ocupa storage y puede cambiar (muy caro).
    uint256 public puntosRegistrados;

    /**
     * @dev El constructor se ejecuta UNA SOLA VEZ cuando el contrato se sube a la red.
     * Es el unico lugar donde podemos darle valor a las variables 'immutable'.
     */
    constructor() {
        // msg.sender aca es la billetera que esta pagando el despliegue
        administrador = msg.sender;
        
        // block.timestamp es una variable global con la fecha actual
        fechaDeDespliegue = block.timestamp;
    }

    /**
     * @dev Funcion de prueba para ver el uso en conjunto.
     */
    function registrarPunto() external {
        // Leemos la variable 'immutable' (barato)
        require(msg.sender == administrador, "Solo el admin puede registrar");
        
        // Leemos la variable 'constant' (barato) y la normal (caro)
        require(puntosRegistrados < LIMITE_PUNTOS_MAPA, "Se alcanzo el limite del mapa");

        // Modificamos la variable normal (caro)
        puntosRegistrados += 1;
    }

    /*
    Si intentaramos hacer esto, el contrato no compilaria:
    function cambiarAdmin(address _nuevoAdmin) external {
        administrador = _nuevoAdmin; // ERROR: Cannot assign to immutable variable
    }
    */
}