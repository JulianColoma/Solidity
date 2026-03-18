# 📚 Solidity Mastery: Modifiers (Modificadores)

Los **Modifiers** son piezas de código reutilizables que se ejecutan antes o después del cuerpo de una función. Se utilizan principalmente para realizar validaciones de seguridad, verificar permisos o comprobar estados antes de permitir que una función continúe.

---

## 📝 Teoría

* **Propósito:** Evitar la duplicación de código (DRY - Don't Repeat Yourself). Si varias funciones requieren que solo el dueño las ejecute, usás un modificador en lugar de escribir el mismo `require` varias veces.
* **El símbolo clave `_;` (Underscore):** Es obligatorio en todo modificador. Indica a Solidity: "ahora ejecutá el resto de la función". 
  * Si el `_;` está al final, el modificador actúa como una **pre-condición**.
  * Si el `_;` está al principio, el modificador actúa como una **post-condición** (poco común).
* **Parámetros:** Los modificadores pueden recibir argumentos, al igual que las funciones.



---

## 📌 Puntos Clave

1. **Encadenamiento:** Podés aplicar varios modificadores a una misma función separándolos por espacios. Se ejecutarán en el orden en que los escribas.
2. **Seguridad:** El patrón más común es el `onlyOwner`, que restringe el acceso a funciones críticas (como retirar fondos o pausar el contrato).
3. **Ahorro de Gas:** Si usas un modificador que revierte la transacción al principio, ahorrás gas al usuario evitándole ejecutar lógica innecesaria si no tiene los permisos.