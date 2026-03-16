# 📚 Solidity Mastery: El Estándar ERC-20

Un **ERC-20** es una interfaz técnica que define un conjunto de reglas para que un token sea "fungible". Fungible significa que cada unidad del token es exactamente igual a otra (como un billete de 100 pesos es igual a otro de 100 pesos).

---

## 📝 Teoría

Para que un contrato sea considerado un token ERC-20, **debe** implementar obligatoriamente estas funciones:

1. **`totalSupply()`**: Cantidad total de tokens que existen.
2. **`balanceOf(account)`**: Cuántos tokens tiene una billetera específica.
3. **`transfer(recipient, amount)`**: Enviar tokens de quien llama la función a otro.
4. **`allowance(owner, spender)`**: Cuánta plata le diste permiso de gastar a un tercero (ej. un exchange).
5. **`approve(spender, amount)`**: Dar ese permiso a un tercero.
6. **`transferFrom(sender, recipient, amount)`**: La función que usa el tercero para mover los tokens que le aprobaste.



---

## 📌 Puntos Clave

1. **Decimales:** Los tokens no tienen decimales reales. Si querés 1 token con 18 decimales, el contrato guarda el número `1.000.000.000.000.000.000`. Es igual a lo que vimos de Wei y Ether.
2. **OpenZeppelin:** En la industria no programamos el ERC-20 desde cero por seguridad. Usamos la librería de OpenZeppelin y heredamos su lógica probada.
3. **Eventos:** El estándar exige emitir `Transfer` y `Approval` para que las billeteras muestren las notificaciones.