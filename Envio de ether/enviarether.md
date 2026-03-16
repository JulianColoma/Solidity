# 📚 Solidity Mastery: Enviar y Recibir Ether

Para que un contrato pueda manejar dinero real (Ether), debe ser capaz de recibirlo, guardarlo y enviarlo. No es solo una función; es un cambio en la lógica de seguridad del contrato.

---

## 📝 1. Recibir Ether
Para que un contrato acepte depósitos sin que llames a una función específica, necesita estas dos funciones especiales:
* **`receive()`**: Se ejecuta cuando envías ETH sin datos (una transferencia simple).
* **`fallback()`**: Se ejecuta cuando envías ETH con datos o llamás a una función que no existe.

## 📝 2. Enviar Ether (Los 3 Métodos)

Existen tres formas de mandar ETH desde un contrato a una billetera, pero **solo una es la recomendada hoy**:

1. **`transfer` (Obsoleto):** Envía 2300 de gas. Si el receptor es un contrato con lógica compleja, falla. Lanza error automáticamente.
2. **`send` (Obsoleto):** Igual que transfer, pero devuelve `false` en lugar de fallar. Muy peligroso si no chequeás el resultado.
3. **`call` (ESTÁNDAR ACTUAL):** Envía todo el gas disponible (o el que vos definas). Es el más flexible y seguro si se usa con las protecciones adecuadas.



---

## 📌 Puntos Clave

1. **Check-Effects-Interactions:** Siempre cambiá los balances en tu contrato **antes** de mandar el dinero afuera para evitar que te roben con ataques de reentrada.
2. **`payable`:** Cualquier dirección o función que deba recibir Ether tiene que tener este modificador. Si no, Solidity rechazará el dinero.
3. **Gas Limits:** `transfer` y `send` quedaron viejos porque el costo del gas en Ethereum cambia. `call` es la forma de "futurizar" tu contrato.