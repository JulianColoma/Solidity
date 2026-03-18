// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: El Patrón de Bloqueo General
 *
 * Protege tu Smart Contract contra invasores del público en general. 
 * Diseña un mecanismo interceptor de código inyectable y reutilizable que corrobore fuertemente 
 * que la cuenta emitente y llamadora de la transacción coincide de manera estricta y literal 
 * con la billetera que originó, inicializó y desplegó a este contrato en primera instancia. 
 * 
 * Si no coinciden, bloquea el avance impíamente. Por el contrario, permite que retome su curso 
 * original. Adjunta y sella este mecanismo protector al título de una función sensible vacía o 
 * de fantasía que quieras resguardar.
 *
 *
 * 🎓 EJERCICIO 2: Restricciones Dinámicas Parametrizadas
 * 
 * Extrapola tu mecanismo restrictivo anterior. Esta vez, desarrolla un nuevo envoltorio interceptante
 * pero configúralo asimétricamente y dinámico, logrando que sea capaz de aceptar e ingerir inyecciones 
 * paramétricas directas de comprobación que tú mismo le cedas desde la cabecera misma 
 * donde se declaran formalmente los métodos en el contrato matriz.
 * 
 * Verifica que este pre-filtro inyector escanee implacablemente que los fondos reales introducidos 
 * a nivel de transacción económica pura superen una especie de cuota tarifaria mínima paramétrica requerida. 
 * Si falla, recházala devolviendo tus fondos; si la pasa con éxito, déjala permutar sus estragos adentró del servicio comercial ficticio.
 */

contract EjerciciosModifiers {
    // 📝 Escribe tu código aquí debajo

}
