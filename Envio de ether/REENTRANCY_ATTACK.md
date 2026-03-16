# 🛡️ Seguridad: Ataque de Reentrancy (Reentrada)

El ataque de reentrada ocurre cuando un contrato llama a otro contrato externo **antes** de actualizar su propio estado. Esto permite que el atacante "vuelva a entrar" a la función original de forma recursiva y retire fondos varias veces antes de que el contrato se de cuenta de que ya no tiene saldo.

---

## 📝 La Anatomía del Ataque

El flujo del desastre suele ser así:
1. El **Contrato Víctima** tiene 10 ETH.
2. El **Contrato Atacante** pide retirar 1 ETH.
3. El Víctima verifica que el Atacante tiene saldo y le envía el ETH usando `call`.
4. El envío de ETH activa la función `receive()` o `fallback()` del Atacante.
5. **Acá está el truco:** Dentro de su `receive()`, el Atacante vuelve a llamar a la función `withdraw()` del Víctima.
6. Como el Víctima todavía no restó el saldo del Atacante (porque estaba esperando que termine el `call`), vuelve a enviarle dinero.
7. Se repite hasta vaciar el contrato.



---

## 💻 Ejemplo de Código Vulnerable vs Seguro

### ❌ El Código Vulnerable (¡No usar!)
Este contrato sigue el orden: 1. Verificar -> 2. Interactuar -> 3. Actualizar. **Es un error fatal.**

```solidity
function withdraw() public {
    uint256 balance = balances[msg.sender];
    require(balance > 0, "Saldo insuficiente");

    // 1. INTERACCION (Se envia el dinero antes de restar el saldo)
    (bool success, ) = msg.sender.call{value: balance}("");
    require(success, "Fallo el envio");

    // 2. ACTUALIZACION (Demasiado tarde, el atacante ya entro de nuevo)
    balances[msg.sender] = 0;
}
```

### ✅ El Código Seguro (Patrón CEI)
Aplicamos el patrón Checks-Effects-Interactions: Primero verificamos, luego actualizamos el estado interno y al final interactuamos con el exterior.

```function withdraw() public {
    uint256 balance = balances[msg.sender];
    require(balance > 0, "Saldo insuficiente");

    // 1. ACTUALIZACION (Efecto: restamos el saldo primero)
    balances[msg.sender] = 0;

    // 2. INTERACCION (Interaccion: enviamos el dinero)
    (bool success, ) = msg.sender.call{value: balance}("");
    require(success, "Fallo el envio");
}
```

---

### 🛡️ Cómo defenderse (Estrategias Pro)
**Patrón Checks-Effects-Interactions (CEI)**: Siempre modificá tus variables de estado antes de cualquier llamada externa.

**Reentrancy Guard (OpenZeppelin)**: Usar un "cerrojo" (mutex). Es un modificador llamado nonReentrant que impide que una función se llame a sí misma mientras se está ejecutando.

**Evitar call innecesarios**: Si bien call es el estándar, hay que ser extremadamente cuidadoso con quién es el receptor.

📌 Conclusión
**Nunca confíes en una llamada externa**. Siempre asumí que el contrato al que le enviás Ether puede intentar ejecutar código malicioso para volver a entrar en tu función.