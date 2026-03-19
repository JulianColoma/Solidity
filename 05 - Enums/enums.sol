// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GestionTramites
 * @dev Ejemplo practico de uso de Enums para controlar el ciclo de vida de un tramite.
 */
contract GestionTramites {
    
    // 1. Definicion del Enum
    // Internamente: Pendiente = 0, EnRevision = 1, Aprobado = 2, Rechazado = 3
    enum Estado { 
        Pendiente,     // 0
        EnRevision,    // 1
        Aprobado,      // 2
        Rechazado      // 3
    }

    // 2. Declaración de una variable de estado que usa el Enum
    // Por defecto, se inicializa en el primer valor (Pendiente / 0)
    Estado public estadoActual;
    
    // Podemos inicializar la variable directamente con un valor explícito
    Estado public estadoInicializado = Estado.Aprobado;
    
    // Como son variables públicas, Solidity generará automáticamente 
    // una forma de consultarlas. Al consultarlas, devolverán el número 
    // correspondiente a la opción elegida (0, 1, 2, o 3).
}