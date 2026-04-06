// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: El Patrón de Acceso (Owner Only)
 * * Protege las funciones sensibles de tu contrato para que solo el creador pueda usarlas.
 * 1. Crea una variable 'owner' que guarde la dirección de quien despliega el contrato.
 * 2. Diseña un 'modifier' que verifique que quien llama a la función
 * sea estrictamente el 'owner'.
 *
 * 🎓 EJERCICIO 2: Filtro de Pago con Parámetros
 * * Crea un modificador más flexible que sea capaz de recibir un valor por parámetro.
 * 1. Diseña un 'modifier' que acepte un monto (uint256) como requisito de entrada.
 * 2. El modificador debe chequear que el dinero enviado en la transacción
 * sea igual o mayor al monto que le pases por parámetro.
 *
 * 🎓 EJERCICIO 3: Lista Blanca Dinámica (Whitelist)
 * * El Owner debe poder delegar permisos a otros usuarios.
 * 1. Crea un 'mapping' que relacione una dirección (address) con un booleano (bool)
 * para saber si alguien está autorizado o no.
 * 2. Crea una función 'autorizarUsuario' que solo el Owner pueda ejecutar y que
 * marque a una dirección como 'true' en el mapping.
 * 3. Diseña un 'modifier' llamado 'soloAutorizados' que permita la ejecución
 * solo si el usuario que llama está marcado como 'true' en tu lista.
 */

contract Ejercicio1 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    error OnlyOwner();

    modifier checkOwner() {
        if (msg.sender != owner) revert OnlyOwner();
        _;
    }

    function funcionProtegida() external checkOwner {
        // contenido de la funcion, solo accesible por el owner
    }
}

contract Ejercicio2 {
    error InsufficientBalance();
    modifier checkValue(uint256 minimo) {
        if (msg.value < minimo) revert InsufficientBalance();
        _;
    }
    function pagarCuota() external payable checkValue(2000 wei) {}
}

contract Ejercicio3 {
    address public owner;
    mapping(address => bool) public admins;

    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
    }

    error OnlyOwner();
    error OnlyAdmin();

    modifier checkOwner() {
        if (msg.sender != owner) revert OnlyOwner();
        _;
    }
    modifier checkAdmin() {
        if (!admins[msg.sender]) revert OnlyAdmin();
        _;
    }

    function agregarAdmin(address _admin) external checkOwner {
        admins[_admin] = true;
    }

    function funcionParaAdmins() external checkAdmin {}
}
