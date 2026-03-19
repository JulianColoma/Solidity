// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RegistroSistemas
 * @dev Ejemplo practico de Structs para agrupar datos de alumnos.
 */
contract RegistroSistemas {

    // 1. Definicion del Struct
    struct Alumno {
        string nombre;
        uint256 legajo;
        bool estaActivo;
        address billetera;
    }

    // 2. Declarando e inicializando un Struct en una variable de estado
    // Podemos asignar los valores directamente al declarar la variable
    Alumno public alumnoDestacado = Alumno({
        nombre: "Juan Perez",
        legajo: 12345,
        estaActivo: true,
        billetera: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    });

    // O también podemos declararla sin inicializar. 
    // Sus campos tomarán los valores por defecto (0, false, string vacío, etc.)
    Alumno public alumnoNuevo;
}