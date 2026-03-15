# 📚 Solidity Mastery: Bibliotecas (Libraries)

Las **Libraries** son similares a los contratos, pero su propósito es la reutilización de código. Se despliegan una sola vez en la blockchain y su código es utilizado por otros contratos mediante una instrucción especial llamada `DELEGATECALL`.

---

## 📝 Teoría

* **Sin Estado:** Las librerías no pueden tener variables de estado (no pueden guardar datos permanentemente por sí mismas).
* **Sin Ether:** No pueden recibir ni guardar Ether.
* **Funciones Puras/View:** Generalmente contienen funciones matemáticas o de manipulación de datos.
* **Palabra clave `using`:** Se usa para "pegar" las funciones de la librería a un tipo de dato específico (ej. usar funciones de una librería de matemáticas directamente sobre un `uint256`).


---

## 📌 Puntos Clave

1. **Eficiencia:** Si tenés una lógica matemática muy pesada que usan 10 contratos distintos, la ponés en una librería. Solo pagás el despliegue de esa lógica una vez.
2. **SafeMath:** Antes de la versión 0.8 de Solidity, se usaba siempre para evitar que los números "peguen la vuelta" (overflow/underflow). Ahora Solidity ya trae esa protección integrada, pero la librería sigue siendo el ejemplo clásico de uso.
3. **Lógica Pura:** Son ideales para validaciones complejas o formateo de datos que no requieren modificar el balance del contrato.