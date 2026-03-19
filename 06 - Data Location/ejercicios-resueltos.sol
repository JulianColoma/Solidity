// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: El efecto "RAM" vs "Disco Rígido"
 * * Crea una variable de estado: string public texto = "Original";
 * - Función 1 (Temporal): Crea una función que use 'memory' para copiar
 * la variable 'texto' y cambiarle el valor a "Cambiado".
 * (Al probarla en Remix, verás que la variable global NO cambia).
 * - Función 2 (Permanente): Crea una función que use 'storage' para
 *  cambiar el valor de la variable en storage a "Cambiado".
 * (Al probarla, verás que el cambio SÍ persiste en el contrato).
 *
 * 🎓 EJERCICIO 2: Ahorro máximo (Calldata)
 * * Crea una función 'external' llamada 'leerMensajePesado'.
 * * Debe recibir un string como parámetro.
 * * Como solo queremos recibirlo y no modificarlo, aplicá la ubicación
 * 'calldata' para que sea lo más barato posible en gas.
 */

contract EjerciciosDataLocation {
    // 📝 Escribe tu código aquí debajo

    string public texto = "Original";

    function temporal() public view returns (string memory textoCambiado) {
        string memory textoCopy = texto;
        textoCopy = "Cambiado";
        return textoCopy;
    }

    function permanente() public {
        texto = "Cambiado";
    }

    function leerMensajePesado(
        string calldata _textito
    ) external pure returns (string calldata _text) {
        return _textito;
    }
}
