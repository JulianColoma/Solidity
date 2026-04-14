// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO: Auditoría y Optimización Pro
 *
 * El siguiente contrato gestiona el inventario de una ferretería, pero fue escrito 
 * sin pensar en los costos de gas. Actualmente es carísimo de desplegar y de ejecutar.
 * * 📝 TAREA: 
 * 1. Identificá los 7 puntos de fuga de gas (Storage, Validaciones, Bucles, Tipos de datos).
 * 2. Creá el contrato 'FerreteriaOptima' aplicando las correcciones técnicas.
 * 3. Usá 'Custom Errors', 'Variable Packing' y las keywords de memoria correctas.
 */

contract FerreteriaSucia {
    string public sucursal = "La Plata - Berisso";
    address public administrador;

    struct Articulo {
        uint256 codigo;
        bool enStock;
        uint128 precio;
        bool importado;
        uint256 estanteria;
    }

    mapping(uint256 => Articulo) public inventario;

    constructor() {
        administrador = msg.sender;
    }

    function registrarLote(uint256[] memory _codigos) public {
        require(msg.sender == administrador, "Solo el administrador oficial de la sucursal puede realizar la carga de stock");
        
        for (uint256 i = 0; i < _codigos.length; i++) {
            uint256 id = _codigos[i];
            inventario[id].enStock = true;
        }
    }

    function consultarSucursal() public view returns (string memory) {
        return sucursal;
    }
}

// 📝 Escribí tu versión optimizada acá abajo
