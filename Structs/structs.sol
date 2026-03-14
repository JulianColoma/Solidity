// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title RegistroSistemas
 * @dev Ejemplo practico de Structs para gestionar alumnos de Ingenieria en Sistemas.
 */
contract RegistroSistemas {

    // 1. Definicion del Struct
    struct Alumno {
        string nombre;
        uint256 legajo;
        bool estaActivo;
        address billetera;
    }

    // Mapping para organizar los alumnos por su numero de legajo
    mapping(uint256 => Alumno) public alumnos;

    /**
     * @dev Diferentes formas de inicializar y guardar un Struct
     */
    function registrarAlumno(uint256 _legajo, string calldata _nombre, address _billetera) external {
        
        // Opcion A: Clave-Valor (Mas segura y clara)
        alumnos[_legajo] = Alumno({
            nombre: _nombre,
            legajo: _legajo,
            estaActivo: true,
            billetera: _billetera
        });

        /* Opcion B: Por posicion (Mas corta)
        alumnos[_legajo] = Alumno(_nombre, _legajo, true, _billetera);
        */

        /* Opcion C: Declarar variable temporal (Mas flexible para modificaciones antes de guardar)
        Alumno memory nuevoAlumno;
        nuevoAlumno.nombre = _nombre;
        nuevoAlumno.legajo = _legajo;
        nuevoAlumno.estaActivo = true;
        nuevoAlumno.billetera = _billetera;
        alumnos[_legajo] = nuevoAlumno;
        */
    }

    /**
     * @dev Muestra como leer y modificar un campo especifico usando 'storage'
     */
    function darDeBaja(uint256 _legajo) external {
        // Usamos storage para crear un puntero y modificar el mapping original
        Alumno storage alumno = alumnos[_legajo];
        require(alumno.legajo != 0, "El alumno no existe");
        
        alumno.estaActivo = false;
    }

    /**
     * @dev Retorna todos los datos de un alumno (Uso de memory para retorno)
     */
    function obtenerAlumno(uint256 _legajo) external view returns (Alumno memory) {
        return alumnos[_legajo];
    }

    /**
     * @dev Actualizar solo el nombre usando asignacion directa
     */
    function cambiarNombre(uint256 _legajo, string calldata _nuevoNombre) external {
        // Acceso directo a traves del mapping
        alumnos[_legajo].nombre = _nuevoNombre;
    }
}