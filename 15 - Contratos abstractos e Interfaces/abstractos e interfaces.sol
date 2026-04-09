// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 1. LA INTERFACE: Solo dice QUE se puede hacer.
// No tiene codigo, solo los nombres de las funciones.
interface IElectrodomestico {
    function encender() external; // "Cualquier cosa que sea un electrodomestico se debe poder encender"
}

// 2. EL CONTRATO ABSTRACTO: Tiene algo de codigo, pero esta incompleto.
abstract contract CafeteraBase is IElectrodomestico {
    bool public prendida;

    // Esta funcion YA TIENE codigo (es comun para todas las cafeteras)
    function encender() external override {
        prendida = true;
    }

    // Esta funcion NO TIENE codigo. Es un hueco que el hijo debe llenar.
    // Cada cafetera hace el cafe de forma distinta.
    function hacerCafe() public virtual returns (string memory);
}

// 3. EL CONTRATO REAL: El que finalmente desplegas (el "hijo").
contract CafeteraExpress is CafeteraBase {
    
    // Aqui llenamos el hueco que dejo el padre
    function hacerCafe() public pure override returns (string memory) {
        return "Haciendo cafe express con mucha espuma...";
    }
}

contract CafeteraCapsulas is CafeteraBase {
    
    function hacerCafe() public pure override returns (string memory) {
        return "Pinchando capsula y haciendo cafe...";
    }
}