// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Armado del Paquete Técnico 
 *
 * Tomá un número (uint256) y un texto (string) para unificarlos en un solo bloque. 
 * Usá la herramienta de codificación estándar de Solidity para transformar ambos 
 * datos en una sola tira de bytes que pueda ser enviada o guardada como una 
 * carga única de memoria, manteniendo la estructura necesaria para su posterior lectura.
 *
 *
 * 🎓 EJERCICIO 2: Apertura y Recuperación de Datos 
 * * Tomá la carga de bytes generada en el paso anterior y realizá el proceso inverso. 
 * Debés "abrir" ese paquete de bytes indicándole al sistema exactamente qué tipos 
 * de datos (el uint256 y el string) se encuentran escondidos adentro para 
 * recuperarlos con su valor y formato original de forma limpia.
 */

contract EjerciciosABI {
    // 📝 Escribe tu código aquí debajo
    function armarPaquetito(uint256 _num, string memory _str) external pure returns(bytes memory paquetito){
        return abi.encode(_num, _str);
    }   

    function desarmarPaquetito(bytes memory _paquetito)external pure returns(uint256, string memory){
        (uint256 num, string memory str) = abi.decode(_paquetito,(uint256,string));
        return (num, str);
    }
}