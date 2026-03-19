// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SistemaPermisos
 * @dev Ejemplo de declaracion de mappings anidados para gestionar accesos.
 */
contract SistemaPermisos {

    // Estructura: ID del Laboratorio => (Direccion del Alumno => Tiene Acceso?)
    // Para consultar necesitas el ID y la direccion: permisosLaboratorio(1, "0x...")
    mapping(uint256 => mapping(address => bool)) public permisosLaboratorio;

    // Estructura: Dueño => (Gasto Autorizado => Cantidad)
    // Muy comun en tokens para delegar gastos
    mapping(address => mapping(address => uint256)) public autorizacionGastos;

}