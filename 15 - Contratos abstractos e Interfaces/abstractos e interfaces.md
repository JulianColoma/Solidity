# 📚 Solidity Mastery: Contratos Abstractos e Interfaces

Para que un sistema de Smart Contracts sea profesional, no podés programar todo en un solo lugar. Los Contratos Abstractos y las Interfaces definen **qué** debe hacer un contrato sin especificar **cómo** hacerlo, permitiendo la estandarización y la comunicación entre diferentes protocolos.

---

## 📝 Teoría

### 1. Contratos Abstractos (`abstract`)
Es un contrato que tiene al menos una función sin implementar (solo declarada).
* **Propósito:** Sirve como base o "molde" para otros contratos.
* **No se pueden desplegar:** Un contrato abstracto no puede existir por sí solo en la blockchain; debe ser heredado por un contrato "concreto" que implemente lo que falta.

### 2. Interfaces (`interface`)
Son incluso más restrictivas que los contratos abstractos. Solo definen las funciones que un contrato **debe** tener para que otros puedan interactuar con él.
* **Reglas:** * No pueden tener variables de estado.
  * No pueden tener constructores.
  * Todas sus funciones deben ser `external`.
  * Solo declaran el encabezado de la función: `function nombre() external;`.



---

## 📌 Puntos Clave

1. **Estandarización:** Las interfaces son la base de los estándares como **ERC-20** o **ERC-721**. Permiten que tu billetera sepa cómo pedir el saldo de cualquier token sin conocer el código de cada uno.
2. **Interoperabilidad:** Si querés que tu contrato interactúe con un contrato de otra persona, solo necesitás la **Interface** de su contrato para llamarlo.
3. **Contrato Abstracto vs Interface:** Usá `abstract` cuando quieras proveer algo de código base (como un `mapping` o un `owner`) y una `interface` cuando solo quieras definir un canal de comunicación puro.