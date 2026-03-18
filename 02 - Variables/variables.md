# 📚 Solidity Mastery: Variables de Estado, Locales y Globales

En Solidity, las variables se clasifican en tres grandes grupos dependiendo de dónde se guardan, cuánto tiempo viven y quién provee su valor. Entender esta diferencia es la base para optimizar el consumo de Gas.

---

## 📝 Teoría

### 1. Variables de Estado (State Variables)
Son las variables que se guardan permanentemente en la blockchain (en el `storage`).
* **Ubicación:** Se declaran a nivel de contrato, fuera de cualquier función.
* **Costo:** Modificarlas es la operación más cara en Ethereum. Leerlas también cuesta gas (aunque menos).
* **Persistencia:** Su valor sobrevive a la finalización de la transacción.

### 2. Variables Locales (Local Variables)
Existen solo temporalmente durante la ejecución de una función.
* **Ubicación:** Se declaran dentro de las funciones.
* **Costo:** Son extremadamente baratas porque se guardan en la memoria RAM (o en el *stack* de la EVM) y no en la blockchain.
* **Persistencia:** Una vez que la función termina su ejecución (ya sea con éxito o por un `revert`), estas variables desaparecen para siempre.

### 3. Variables Globales (Global Variables)
Son variables especiales integradas en Solidity. No las declarás vos; la EVM (Ethereum Virtual Machine) te las provee automáticamente para darte información sobre la transacción, el bloque actual o la red.
* **Las más usadas:**
  * `msg.sender`: La dirección (address) de quien llamó a la función.
  * `msg.value`: La cantidad de wei (Ether) enviada en la transacción.
  * `block.timestamp`: El momento exacto (en formato Unix epoch) en el que el bloque actual está siendo minado.



---

## 📌 Puntos Clave

1. **Sombra de variables (Shadowing):** Evitá nombrar a una variable local igual que a una variable de estado. Solidity lo permite, pero el compilador te va a tirar un *warning* porque es una fuente masiva de bugs lógicos.
2. **Caché local:** Si vas a leer una variable de estado muchas veces dentro de un bucle `for`, es mucho más barato copiarla primero a una variable local, hacer los cálculos ahí, y al final guardar el resultado de nuevo en la variable de estado.
3. **Seguridad del Timestamp:** Los mineros pueden manipular ligeramente el `block.timestamp` (por unos pocos segundos). Nunca lo uses como única fuente de entropía para generar números aleatorios críticos.