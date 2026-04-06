// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * Todos los ejercicios deben resolverse dentro del contrato 'FacultadesUTN'
 * 🎓 EJERCICIO 1: El Acta de Nacimiento
 * * Queremos que nuestro contrato sepa exactamente quién lo creó y en qué momento.
 * 1. Definí una variable de estado 'owner' (address) y una variable 'fechaLanzamiento' (uint256).
 * 2. En el constructor, asigná a 'owner' la billetera que despliega el contrato.
 * 3. En el mismo constructor, asigná a 'fechaLanzamiento' el tiempo actual del bloque.
 *
 * 🎓 EJERCICIO 2: Configuración Personalizada
 * * No todos los contratos son iguales. Queremos elegir el nombre y la capacidad al desplegar.
 * 1. Definí las variables 'nombreSede' (string) y 'capacidadMaxima' (uint256).
 * 2. Modificá el constructor para que reciba estos dos valores como parámetros.
 * 3. Inicializá las variables de estado con los valores que el usuario ingrese al hacer el "Deploy".
 *
 * 🎓 EJERCICIO 3: Estado Operativo Inicial
 * * Todo sistema debe empezar con un interruptor de "encendido".
 * 1. Definí una variable booleana 'sistemaHabilitado'.
 * 2. Crea una funcion para cambiar inhabilitar el sistema y que sea solo accesible por el owner
 */

contract FacultadesUTN {
    // 📝 Escribe tu código aquí debajo
    address public owner;
    uint256 public fechaLanzamiento;
    string public nombreSede;
    uint256 public capacidadMaxima;
    bool public sistemaHabilitado;

    constructor(string memory _nombre, uint _capacidad) {
        owner = msg.sender;
        fechaLanzamiento = block.timestamp;
        nombreSede = _nombre;
        capacidadMaxima = _capacidad;
        sistemaHabilitado = true;
    }
    error OnlyOwner();

    modifier onlyOwner() {
        if (msg.sender != owner) revert OnlyOwner();
        _;
    }
    function cambiarEstado(bool _estado) external onlyOwner {
        sistemaHabilitado = _estado;
    }
}
