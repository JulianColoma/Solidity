// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title SistemaPermisos
 * @dev Ejemplo de mappings anidados para gestionar acceso a laboratorios de la facultad.
 */
contract SistemaPermisos {

    // Estructura: ID del Laboratorio => (Direccion del Alumno => Tiene Acceso?)
    mapping(uint256 => mapping(address => bool)) public permisosLaboratorio;

    // Estructura: Dueño => (Gasto Autorizado => Cantidad)
    // Muy comun en tokens para delegar gastos
    mapping(address => mapping(address => uint256)) public autorizacionGastos;

    /**
     * @dev Asigna permiso a un alumno para un laboratorio especifico.
     */
    function otorgarAcceso(uint256 _labId, address _alumno) external {
        // En un contrato real, aqui habria un require para que solo un admin ejecute esto
        permisosLaboratorio[_labId][_alumno] = true;
    }

    /**
     * @dev Revoca el acceso de un alumno.
     */
    function revocarAcceso(uint256 _labId, address _alumno) external {
        permisosLaboratorio[_labId][_alumno] = false;
    }

    /**
     * @dev Verifica si un alumno tiene permiso usando ambas claves.
     */
    function tienePermiso(uint256 _labId, address _alumno) external view returns (bool) {
        return permisosLaboratorio[_labId][_alumno];
    }

    /**
     * @dev Ejemplo de autorizacion de gastos (Estilo ERC-20).
     * El 'msg.sender' autoriza a un 'spendeer' a gastar una 'cantidad'.
     */
    function autorizarGasto(address _spender, uint256 _cantidad) external {
        autorizacionGastos[msg.sender][_spender] = _cantidad;
    }

    /**
     * @dev Consulta cuanto puede gastar una direccion en nombre de otra.
     */
    function consultarCuota(address _propietario, address _delegado) external view returns (uint256) {
        return autorizacionGastos[_propietario][_delegado];
    }
}