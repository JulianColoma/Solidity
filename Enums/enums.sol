// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title GestionTramites
 * @dev Ejemplo practico de uso de Enums para controlar el ciclo de vida de un tramite.
 */
contract GestionTramites {
    
    // 1. Definicion del Enum
    // Internamente: Pendiente = 0, EnRevision = 1, Aprobado = 2, Rechazado = 3
    enum Estado { 
        Pendiente, 
        EnRevision, 
        Aprobado, 
        Rechazado 
    }

    struct Tramite {
        string nombreAlumno;
        Estado estadoActual;
    }

    // Mapping para almacenar tramites por un ID unico
    mapping(uint256 => Tramite) public tramites;

    /**
     * @dev Inicia un tramite. Por defecto queda en 'Estado.Pendiente' (0).
     */
    function iniciarTramite(uint256 _id, string calldata _nombre) external {
        tramites[_id] = Tramite(_nombre, Estado.Pendiente);
    }

    /**
     * @dev Cambia el estado a EnRevision. Valida que el estado anterior sea Pendiente.
     */
    function revisarTramite(uint256 _id) external {
        require(tramites[_id].estadoActual == Estado.Pendiente, "Solo se pueden revisar pendientes");
        
        // Asignacion de valor del Enum
        tramites[_id].estadoActual = Estado.EnRevision;
    }

    /**
     * @dev Finaliza el tramite segun una condicion booleana.
     */
    function finalizarTramite(uint256 _id, bool _aprobado) external {
        require(tramites[_id].estadoActual == Estado.EnRevision, "Debe estar en revision primero");
        
        if (_aprobado) {
            tramites[_id].estadoActual = Estado.Aprobado;
        } else {
            tramites[_id].estadoActual = Estado.Rechazado;
        }
    }

    /**
     * @dev Permite obtener el indice numerico del Enum (util para el Frontend).
     */
    function obtenerEstadoNumerico(uint256 _id) external view returns (uint8) {
        return uint8(tramites[_id].estadoActual);
    }

    /**
     * @dev El uso de 'delete' resetea el Enum al valor por defecto (indice 0).
     */
    function resetearTramite(uint256 _id) external {
        delete tramites[_id];
    }
}