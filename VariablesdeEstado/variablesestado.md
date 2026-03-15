# 📚 Solidity Mastery: Variables Inmutables y Constantes

En Solidity, leer o escribir en el estado de la blockchain (`storage`) es la operación más cara. Para mitigar esto, existen las variables `constant` e `immutable`. Ninguna de las dos ocupa espacio en el `storage`; en su lugar, el compilador inyecta sus valores directamente en el código del contrato (bytecode).

---

## 📝 Teoría

### 1. Variables `constant` (Constantes)
Su valor debe estar definido **antes** de compilar el contrato. No pueden depender de ningún cálculo que ocurra durante el despliegue.
* **Sintaxis:** `uint256 public constant MAXIMO = 100;`
* **Costo de Gas:** Es el más bajo posible.
* **Convención:** Sus nombres suelen escribirse en MAYÚSCULAS_CON_GUIONES_BAJOS (SNAKE_CASE).

### 2. Variables `immutable` (Inmutables)
Son un poco más flexibles. Su valor puede asignarse en el momento en que se despliega el contrato (dentro del `constructor`), pero una vez asignado, **nunca más puede cambiar**.
* **Sintaxis:** `address public immutable owner;`
* **Caso de uso típico:** Guardar la dirección del creador del contrato (`msg.sender`) o parámetros de configuración iniciales.



---

## 📌 Puntos Clave

1. **Ahorro masivo:** Leer una variable normal de estado cuesta unas 2100 unidades de gas. Leer una variable inmutable o constante cuesta alrededor de 3 unidades. ¡Es una diferencia abismal!
2. **Limitaciones de `constant`:** Solo los tipos de valor (como `uint`, `int`, `bool`, `address`) y los `string` pueden ser constantes.
3. **Limitaciones de `immutable`:** Cualquier tipo de valor puede ser inmutable, pero no podés leer su valor dentro del mismo constructor donde lo estás inicializando.