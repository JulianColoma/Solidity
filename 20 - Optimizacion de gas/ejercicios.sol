// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Caching de Variables de Estado en Memoria
 *
 * Posees un arreglo global inmenso en el disco duro del contrato del cual debes extraer 
 * y sumar sus registros uno a uno mediante ciclos repetitivos en una función. 
 * Identifica el punto crítico de lectura costosa transaccional y rediséñalo alterando el entorno 
 * temporal donde se solicita momentáneamente dicho valor global, para abaratar el peso logístico 
 * subyacente de todo el proceso reiterativo drásticamente a lo largo de los giros del bucle.
 *
 *
 * 🎓 EJERCICIO 2: Empaquetamiento de Structs (Variable Packing)
 * 
 * Acomoda y agrupa las propiedades de un "Struct Ineficiente" compuesto por dos enteros chicos de 
 * 128 bytes y un entero gigante divisorio de 256 metido en el medio de ellos. 
 * Declara tú mismo un nuevo `Struct Optimo` reacomodando sus variables lógicamente 
 * para que los datos subyacentes logren compartir las mismas particiones físicas estáticas, reduciendo 
 * intrínsecamente el encarecimiento general del despliegue del contrato y lectura.
 */

contract EjerciciosOptimizacionGas {
    // 📝 Escribe tu código aquí debajo

}
