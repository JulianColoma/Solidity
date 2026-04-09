// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Generar Huella
 * 1. Implementá la función que recibe un string y devuelve un hash a partir de ese string
 *    y la wallet que lo envio.
 *
 * 🎓 EJERCICIO 2: El Acertijo Criptográfico
 * 1. Guardá el hash de una palabra secreta al desplegar el contrato.
 * 2. Creá el comparador para verificar si alguien adivina la palabra.
 */

contract EjerciciosHashing {
    bytes32 public hashSecreto;

    constructor(string memory _palabraInicial) {
        // Guardamos el hash para que la palabra real nunca toque el storage
        hashSecreto = keccak256(abi.encodePacked(_palabraInicial));
    }

    // Paso 1: Generar huella única 
    // Es 'view' porque lee msg.sender, si no usaras msg.sender podría ser 'pure'
    function generarHuella(string memory _frase) external view returns(bytes32) {
        return keccak256(abi.encodePacked(_frase, msg.sender));
    }
    
    // Paso 2: El comparador criptográfico
    function adivinar(string memory _palabra) external view returns(bool) {
        // Comparamos los hashes
        return hashSecreto == keccak256(abi.encodePacked(_palabra));
    }
}