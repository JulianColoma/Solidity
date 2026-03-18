# 📚 Solidity Mastery: Arrays (Vectores)

Los **Arrays** son colecciones de elementos del mismo tipo. A diferencia de los Mappings, los arrays mantienen un orden secuencial y permiten la iteración de sus elementos.

---

## 📝 Teoría

En Solidity existen dos tipos principales de arrays según su gestión de memoria:

### 1. Arrays de Tamaño Fijo
Su tamaño se define al momento de la declaración y no puede cambiar.
* **Sintaxis:** `uint[5] public miArrayFijo;`
* **Costo:** Más eficientes en gas si conocés de antemano el límite de datos.

### 2. Arrays Dinámicos
Pueden crecer o achicarse durante la ejecución.
* **Sintaxis:** `uint[] public miArrayDinamico;`
* **Operaciones clave:** `.push()` para agregar al final y `.pop()` para eliminar el último elemento.

---

## 📌 Puntos Clave

1. **Costo de Iteración:** Recorrer un array con un bucle `for` consume gas por cada elemento. Si el array crece demasiado (miles de elementos), la transacción puede fallar por exceder el límite de gas del bloque.
2. **Borrado de Elementos:** Usar `delete array[index]` **no reduce el tamaño** del array ni mueve los demás elementos. Simplemente resetea el valor en esa posición al valor por defecto (ej. 0). Para achicar el array, se debe usar `.pop()`.
3. **Arrays en Memoria:** Los arrays creados dentro de funciones usando `memory` **deben** tener un tamaño fijo (ej. `uint[] memory a = new uint[](5);`). No soportan `.push()`.
4. **Almacenamiento:** Los arrays de strings o bytes son técnicamente arrays especiales.
Funcionan como arrays dinámicos, pero con restricciones adicionales.

    | Tipo     | Qué es internamente | Particularidad |
    |----------|---------------------|----------------|
    | `bytes`  | `byte[]` dinámico   | Se puede indexar |
    | `string` | `bytes` dinámico    | No se puede indexar directamente |
