# 🔄 Contratos Actualizables (Proxies)

Un Proxy es un contrato que delega todas sus llamadas a otro contrato, pero ejecuta el código en su propio contexto.

---

## 📝 1. ¿Cómo funciona `delegatecall`?
Es la clave de todo. Cuando el Contrato A le hace un `delegatecall` al Contrato B:
* Se ejecuta el código que está en el **Contrato B**.
* Pero se usan las variables de estado (el almacenamiento) del **Contrato A**.
* El `msg.sender` y el `msg.value` siguen siendo los originales del usuario.



## 📝 2. Arquitectura de un Proxy
1. **Proxy Contract:** Recibe las llamadas. No tiene lógica, solo una función `fallback` que redirige todo vía `delegatecall`.
2. **Implementation Contract (V1):** Tiene las funciones originales.
3. **Implementation Contract (V2):** Tiene las funciones nuevas o corregidas.

Al actualizar, solo cambiamos la dirección de la implementación en el almacenamiento del Proxy.



---

## ⚠️ Los Peligros

1. **Storage Collisions (Colisiones de Almacenamiento):** Si el Proxy guarda la dirección del motor en el slot 0, y el motor también quiere guardar una variable en el slot 0, se pisan y el contrato explota. 
   * *Solución:* Usar slots ultra lejanos y aleatorios (EIP-1967).
2. **Constructor:** Los contratos de implementación **no pueden usar constructor**. Si inicializás algo ahí, se guarda en el motor y no en el proxy.
   * *Solución:* Usar una función `initialize()` que se llame una sola vez.