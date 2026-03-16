# 🛡️ Funciones Especiales: receive() y fallback()

En Solidity, existen dos funciones que no tienen nombre (`anonymous functions`). No se llaman directamente, sino que se disparan solas ante ciertos eventos. Son los mecanismos de seguridad para que tu contrato no rechace dinero o llamadas por error.

---

## 📝 1. receive()
Es la función que se ejecuta cuando alguien envía **Ether puro** al contrato (sin datos/calldata). 
* **Requisito:** Debe ser `external` y `payable`.
* **Uso:** Es el buzón de entrada de depósitos simple.
* **Gas:** Tiene un límite de 2300 de gas si se usa con `transfer` o `send`, así que solo debe usarse para emitir un evento simple.

## 📝 2. fallback()
Es el "Plan B". Se ejecuta cuando:
1. Alguien envía Ether pero la función `receive()` no existe.
2. Alguien llama a una función que **no existe** en tu contrato.
3. Se envía Ether junto con datos que no coinciden con ninguna función.



---

## 📌 Diferencia Visual (Decision Tree)

¿La llamada tiene datos (`msg.data`)?
* **SÍ** ➔ Se ejecuta `fallback()`.
* **NO** ➔ ¿Existe `receive()`?
    * **SÍ** ➔ Se ejecuta `receive()`.
    * **NO** ➔ Se ejecuta `fallback()`.

---

## ⚠️ Reglas de Oro
1. Un contrato puede tener **máximo una** de cada una.
2. Si no definís ninguna de las dos, tu contrato **rechazará** cualquier Ether que se le envíe directamente (revert).
3. Mantenelas simples. Si metés mucha lógica acá, las transacciones de los usuarios van a fallar por falta de gas.