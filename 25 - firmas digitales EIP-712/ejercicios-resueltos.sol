// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

/*
 * 🎓 EJERCICIO 1: Recuperación del Firmante (v, r, s)
 * 1. Crear una función 'recuperarManual' que reciba:
 * - bytes32 _hash (el mensaje original).
 * - uint8 _v, bytes32 _r, bytes32 _s (las partes de la firma).
 * 2. Utilizar la función 'ecrecover' nativa de Solidity para obtener la dirección.
 * 3. Retornar el address resultante.
 *
 * 🎓 EJERCICIO 2: El Prefijo de Seguridad de Ethereum
 * Para evitar ataques, Ethereum añade un prefijo a los mensajes antes de firmar:
 * "\x19Ethereum Signed Message:\n32" + hash.
 * 1. Crear una función 'recuperarSeguro' que reciba:
 * - bytes32 _hash.
 * - bytes memory _signature (la firma completa en un solo campo).
 * 2. Usar la librería ECDSA de OpenZeppelin para:
 * - Convertir el hash original en un "Eth Signed Message Hash" (con el metodo toEthSignedMessageHash()).
 * - Recuperar el address usando '.recover(_signature)'.
 */

contract VerificadorMastery {
    using ECDSA for bytes32;

    function recuperarManual(
        bytes32 _hash,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) public pure returns (address) {
        return ecrecover(_hash, _v, _r, _s);
    }

    function recuperarSeguro(
        bytes32 _hash,
        bytes memory _signature
    ) public pure returns (address) {
        // Envolvemos el hash original con el prefijo: "\x19Ethereum Signed Message:\n32"
        bytes32 ethSignedHash = _hash.toEthSignedMessageHash();

        // Recuperamos la dirección del firmante usando la firma completa (65 bytes)
        return ethSignedHash.recover(_signature);
    }
}
