# 📚 Solidity Mastery: Loops (For y While)

Los bucles permiten ejecutar un bloque de código varias veces. En Solidity, su uso debe ser extremadamente cauteloso debido al costo de **Gas**. Si un bucle itera demasiadas veces, la transacción fallará.

---

## 📝 Teoría

### 1. For Loop
Se utiliza cuando sabés de antemano cuántas veces querés iterar. Es el más común para recorrer arrays.
* **Sintaxis:** `for (inicialización; condición; incremento) { ... }`

### 2. While Loop
Se utiliza cuando querés que el código se ejecute mientras se cumpla una condición específica.
* **Sintaxis:** `while (condición) { ... }`

### 3. Do-While Loop
Similar al while, pero garantiza que el código se ejecute **al menos una vez** antes de evaluar la condición.

---

## 📌 Puntos Clave

1. **Gas Limit:** Evitá bucles que dependan del tamaño de un array que puede crecer indefinidamente. Es una vulnerabilidad común (Denial of Service).
2. **Break y Continue:** - `break`: Sale inmediatamente del bucle.
   - `continue`: Salta a la siguiente iteración.
3. **Costo de Escritura:** Modificar variables de *Storage* dentro de un bucle es extremadamente caro. Es mejor hacer cálculos en variables locales y actualizar el estado al final.
4. **Preferencia:** En la práctica, casi siempre usarás `for` para procesar listas de datos limitadas.