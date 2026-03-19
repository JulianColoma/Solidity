// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RegistroFacuMapp
 * @dev Contrato para el mapa interactivo demostrando el uso de eventos para el frontend.
 */
contract RegistroFacuMapp {

    struct PuntoDeInteres {
        string nombre;
        string categoria;
        address creador;
    }

    mapping(uint256 => PuntoDeInteres) public mapa;
    uint256 public contadorPuntos;

    // 1. Declaracion de Eventos
    // Usamos 'indexed' en la categoria y el creador para que el frontend pueda filtrar
    // Ej: "Traeme todos los puntos creados por Julian" o "Traeme todos los de categoria 'Laboratorio'"
    event NuevaUbicacionAgregada(
        uint256 indexed idUbicacion, 
        string nombre, 
        string indexed categoria, 
        address indexed creador
    );

    event UbicacionEliminada(uint256 idUbicacion, address adminQueElimino);

    /**
     * @dev Funcion para agregar un punto al mapa y avisarle al frontend.
     */
    function agregarPunto(string calldata _nombre, string calldata _categoria) external {
        // Incrementamos el ID
        contadorPuntos += 1;
        uint256 nuevoId = contadorPuntos;

        // Guardamos en el Storage (caro, pero necesario para la logica del contrato)
        mapa[nuevoId] = PuntoDeInteres({
            nombre: _nombre,
            categoria: _categoria,
            creador: msg.sender
        });

        // 2. Emision del Evento (barato, informa al exterior)
        // Aca la App se entera que la transaccion termino y que datos se guardaron
        emit NuevaUbicacionAgregada(nuevoId, _nombre, _categoria, msg.sender);
    }

    /**
     * @dev Funcion para eliminar un punto simulada.
     */
    function eliminarPunto(uint256 _id) external {
        // (Aca iria la logica de require para ver si existe o si tiene permisos)
        
        delete mapa[_id];

        // Emitimos el evento de eliminacion
        emit UbicacionEliminada(_id, msg.sender);
    }
}