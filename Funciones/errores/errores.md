# 📚 Solidity Mastery: Manejo de Errores

En Solidity, cuando ocurre un error, la transacción se revierte (Revert). Esto significa que **todos los cambios de estado realizados hasta ese punto se deshacen**, como si la transacción nunca hubiera existido, pero el usuario paga el costo de Gas por el cómputo realizado hasta el momento del fallo.

---

## 📝 Teoría

Existen 4 formas principales de manejar errores:

### 1. `require(condición, "Mensaje")`
Es el más utilizado. Se usa para validar datos de entrada (`inputs`), condiciones previas a la ejecución o retornos de llamadas a otros contratos.
* Si la condición es `false`, revierte la transacción.
* Devuelve el Gas no consumido.

### 2. `revert("Mensaje")`
Hace exactamente lo mismo que `require`, pero se usa de forma imperativa. Es ideal para lógicas complejas donde un `require` quedaría muy largo o confuso (por ejemplo, dentro de varios `if-else`).

### 3. Custom Errors (Errores Personalizados)
Introducidos en Solidity 0.8.4, son **la forma más eficiente y barata (en Gas)** de manejar errores. En lugar de guardar un mensaje de texto largo (string) en la blockchain, definís un error personalizado.
* Se definen con `error NombreDelError(parametros);`.
* Se ejecutan combinando `revert` con el error: `revert NombreDelError();`.

### 4. `assert(condición)`
Se usa para comprobar **invariantes** (cosas que nunca, bajo ninguna circunstancia, deberían ser falsas). Si un `assert` falla, significa que hay un **bug grave** en la lógica de tu contrato. 



---

## 📌 Puntos Clave

1. **Eficiencia:** Usá siempre **Custom Errors** en lugar de `require` con strings largos si querés optimizar el costo de despliegue y ejecución.
2. **Reversión Segura:** Cuando una transacción se revierte, los saldos de Ether enviados en esa transacción también vuelven a su dueño original.
3. **Orden de validación:** Siempre poné tus `require` o `revert` al principio de la función, antes de hacer cálculos costosos o modificar el estado. Esto se conoce como el patrón **Check-Effects-Interactions**.