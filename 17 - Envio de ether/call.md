# 🔗 Interoperabilidad: Llamadas de Bajo Nivel (call)

Cuando usamos `.call`, estamos interactuando con la EVM a su nivel más básico. Esto es útil cuando no tenemos la interfaz del contrato al que llamamos o cuando queremos enviar Ether de forma flexible.

---

## 📝 Capturando el Retorno de Datos

Como vimos, `.call` devuelve un booleano y un conjunto de bytes. Esos bytes representan el valor de retorno de la función llamada.

### El proceso de decodificación
Para transformar esos `bytes` en algo útil (como un `uint`, `address` o `string`), usamos `abi.decode`.



---

## ⚠️ Riesgos de usar `data` de bajo nivel

1. **Falta de Tipado:** El compilador no te va a avisar si estás decodificando mal. Si el contrato devuelve un `bool` y vos intentás decodificar un `uint256`, el contrato puede fallar o darte un número loco.
2. **Consumo de Gas:** Decodificar datos dinámicos grandes (como strings muy largos) puede ser costoso.
3. **Seguridad:** Siempre verificá primero el `success`. Si `success` es falso, la variable `data` podría contener el mensaje de error (revert string), pero decodificarla es más complejo.

---

## 💡 Recomendación Pro
Casi siempre es mejor usar **Interfaces** (lo que vimos antes) porque Solidity se encarga de la decodificación, y además te avisa si tenes errores con los tipos de datos en tiempo de compilación.