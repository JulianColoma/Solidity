# 📚 Solidity Mastery: abi.encodePacked

`abi.encodePacked` es una función especial que se utiliza para **concatenar** y comprimir datos en un formato de bytes. En el desarrollo de Smart Contracts, es la forma estándar de unir strings o preparar datos para generar un Hash.

---

## 📝 Teoría

* **ABI (Application Binary Interface):** Es el formato estándar para interactuar con contratos. `encodePacked` es una forma de codificación "no estándar" que ahorra espacio.
* **Concatenación:** Toma cualquier cantidad de argumentos de cualquier tipo y los pone uno al lado del otro en memoria.
* **Sin Relleno (Packed):** A diferencia de `abi.encode` (que rellena cada dato hasta los 32 bytes para alinearlos), `encodePacked` los comprime. Esto lo hace más barato en Gas pero puede ser peligroso para ciertas operaciones criptográficas.



---

## 📌 Puntos Clave

1. **Unión de Strings:** Es la forma más común de juntar dos o más cadenas de texto: `string(abi.encodePacked(s1, s2))`.
2. **Generación de Hashes:** Se usa casi siempre como paso previo a `keccak256` para crear un identificador único basado en varios datos.
3. **Casting:** El resultado de esta función es siempre de tipo `bytes`. Por eso, para ver un texto, tenés que convertirlo explícitamente usando `string(...)`.
4. **Colisión de Hashes:** ¡Cuidado! Si concatenas dos elementos dinámicos (como dos strings), `abi.encodePacked("a", "bc")` da el mismo resultado que `abi.encodePacked("ab", "c")`. Si necesitas seguridad total en hashes, usá `abi.encode`.