# 📚 Solidity Mastery: Funciones (Visibilidad y Modificadores)

Las funciones son los bloques de código ejecutables que definen el comportamiento de un Smart Contract. En Solidity, su declaración requiere especificar explícitamente quién puede llamarlas y cómo interactúan con el estado de la blockchain.

---

## 📝 Teoría: Anatomía de una Función

`function nombreFuncion(tipo _parametro) <visibilidad> <mutabilidad> returns (tipo_retorno) { ... }`

### 1. Visibilidad (¿Quién puede llamarla?)
Define el nivel de acceso a la función. Elegir la correcta es vital para la seguridad.
* **`public`:** Puede ser llamada desde cualquier lado (dentro del contrato, contratos heredados, o desde afuera por usuarios u otros contratos).
* **`private`:** SOLO puede ser llamada desde adentro del mismo contrato donde fue definida. Ni siquiera los contratos que la heredan pueden verla.
* **`internal`:** Como `private`, pero SÍ puede ser llamada por contratos que heredan de este (es como el `protected` de otros lenguajes).
* **`external`:** SOLO puede ser llamada desde afuera del contrato. Es más eficiente en Gas que `public` cuando se reciben grandes cantidades de datos (arrays) porque puede leer directamente de `calldata`.



### 2. Mutabilidad de Estado (¿Qué hace con los datos?)
* **(Sin modificador):** La función lee y escribe/modifica el estado de la blockchain. Cuesta Gas.
* **`view`:** Solo LEE el estado de la blockchain, pero no lo modifica. Llamarla desde afuera no cuesta Gas.
* **`pure`:** Ni lee ni modifica el estado de la blockchain. Solo hace cálculos con los parámetros de entrada. No cuesta Gas al llamarla desde afuera.
* **`payable`:** Habilita a la función para recibir Ether (`msg.value`) en la misma transacción.



---

## 📌 Puntos Clave

1. **Por defecto:** Las variables de estado no tienen visibilidad `external` (suelen ser `public` o `private`). Si marcás una variable como `public`, Solidity le crea automáticamente una función `view` (un *getter*) para consultarla.
2. **Retornos múltiples:** Una función en Solidity puede devolver más de un valor a la vez (ej. `returns (uint256, bool)`).
3. **Seguridad:** Minimizá el acceso. Si una función solo se usa internamente como un helper, hacela `private` o `internal`.