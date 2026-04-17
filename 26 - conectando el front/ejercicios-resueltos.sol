// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Notificaciones para el Frontend (Eventos)
 * Emitir eventos es fundamental para que el frontend sepa que algo ocurrió sin
 * tener que estar preguntando (polling) constantemente a la red.
 * * 1. Definir un evento llamado 'CertificadoEmitido'.
 * 2. Debe contener: address del alumno (indexado), bytes32 del hash y un timestamp.
 * 3. Crear una función 'emitir' que reciba address y hash, y dispare el evento.
 *
 * 🎓 EJERCICIO 2: La Escucha Asincrónica (JS)
 * Imagina que estás en tu archivo 'App.js'. Debes dejar un comentario con el
 * esquema de código (usando ethers.js) para "escuchar" este evento.
 * 1. escucha el evento 'CertificadoEmitido'
 * 2. mostra un alert cuando se emita un evento
 */

contract EjerciciosConexionFront {
    event CertificadoEmitido(
        address indexed alumno,
        bytes32 hashCertificado,
        uint256 fecha
    );

    function emitir(address _alumno, bytes32 _hash) public {
        emit CertificadoEmitido(_alumno, _hash, block.timestamp);
    }

    /*

     const contrato = new ethers.Contract(address, abi, provider);
     contrato.on("NombreDelEvento", (alumno, hash, fecha) => {
     alert(`¡Nuevo certificado para ${alumno}!`);
     });

     */
}
