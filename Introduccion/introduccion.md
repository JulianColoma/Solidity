# 📚 Solidity Mastery: Introducción y Tipos de Datos Primitivos

Solidity es un lenguaje de programación de alto nivel, estáticamente tipado y orientado a objetos, diseñado específicamente para escribir **Smart Contracts** (Contratos Inteligentes) que se ejecutan en la **EVM** (Ethereum Virtual Machine). 

Si venís del desarrollo web tradicional (Web2), pensá en un Smart Contract como tu backend y tu base de datos, todo en uno, pero descentralizado, público e inmutable.

---

## 📝 Teoría Fundamental

### 1. Diferencias Críticas con el Backend Tradicional
* **Inmutabilidad:** Una vez desplegado en la blockchain, **no podés modificar el código**. Si hay un bug, tenés que desplegar un contrato nuevo.
* **Costo (Gas):** Guardar datos o hacer cálculos complejos cuesta plata real (Gas). La eficiencia acá es ley.
* **Transparencia:** Todo el estado de un contrato es público. No guardes contraseñas ni datos sensibles en texto plano.

### 2. Tipos de Datos Primitivos
Como Solidity es estáticamente tipado, tenés que definir qué tipo de dato va a guardar cada variable. Los más usados son:

* **`uint` (Unsigned Integer):** Números enteros **positivos** (no acepta negativos). El más común es `uint256` (ocupa 256 bits). Si ponés solo `uint`, es un alias de `uint256`.
* **`int` (Integer):** Números enteros que **sí** aceptan negativos (ej. -10, 0, 42). El estándar es `int256`.
* **`bool` (Boolean):** Clásico `true` o `false`.
* **`address`:** Guarda una dirección de billetera o de otro contrato (ocupa 20 bytes). Ej: `0x123...abc`.
* **`string`:** Cadenas de texto. **Ojo:** Manipular strings en Solidity (como concatenarlos o buscar palabras) es muy costoso en Gas, así que se usan lo menos posible.

[Image of Solidity primitive data types uint int bool address string]

---

## 📌 Anatomía de un Archivo `.sol`

1. **Licencia (SPDX):** Todo archivo debe empezar declarando su licencia open-source.
2. **Pragma:** Define qué versión del compilador de Solidity debe usarse.
3. **Contract:** La palabra clave que envuelve toda la lógica (similar a una `class`).