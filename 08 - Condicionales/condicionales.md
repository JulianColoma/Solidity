# 📚 Solidity Mastery: Condicionales

Los condicionales permiten ejecutar diferentes bloques de código según se cumplan o no ciertas condiciones. Son la base de la toma de decisiones en un Smart Contract.

---

> ⚠️ **Aclaración Importante:**
> En Solidity, los bloques de lógica y control de flujo como los *Condicionales* no pueden existir sueltos dentro del Contrato Inteligente. Siempre deben residir dentro de un bloque especial llamado `Función`.
> Aún no hemos visto en detalle qué son las Funciones (lo veremos pronto). Por el momento, concéntrate estrictamente en la sintaxis del `if` y no te preocupes por todo lo que lo rodea en los ejemplos y ejercicios.

## 📝 Teoría

### 1. Estructura If-Else
Es la forma más común de control de flujo.
* **if:** Evalúa una condición booleana.
* **else if:** Permite evaluar múltiples condiciones en cadena.
* **else:** Se ejecuta si ninguna de las condiciones anteriores fue verdadera.

### 2. Operador Ternario
Es una forma compacta de escribir un `if-else` en una sola línea. Muy útil para asignaciones simples.
* **Sintaxis:** `condicion ? valor_si_es_true : valor_si_es_false;`

---

## 📌 Puntos Clave

1. **Gas:** Las comparaciones básicas (`==`, `!=`, `>`, `<`, etc.) son baratas, pero encadenar demasiados `else if` puede aumentar ligeramente el costo de ejecución.
2. **Require vs If:** Para validar condiciones de seguridad (como si un usuario tiene saldo), se prefiere usar `require`. El `if` se usa para lógica de negocio donde ambas ramas son posibles resultados válidos.
3. **Short-Circuiting:** Solidity evalúa las condiciones de izquierda a derecha. En un `if (A || B)`, si A es verdadero, B no se evalúa. En un `if (A && B)`, si A es falso, B no se evalúa. Poné siempre la condición más barata o más probable primero para ahorrar gas.