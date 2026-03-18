# 📚 Solidity Mastery: Mappings (Tablas Hash)

Los **Mappings** son la estructura de almacenamiento más eficiente en la EVM. Funcionan como una tabla de búsqueda o un diccionario donde a una clave (`key`) le corresponde un único valor (`value`).

---

## 📝 Teoría

* **Sintaxis:** `mapping(KeyType => ValueType) public nombreMapping;`
* **Acceso Directo:** A diferencia de los arrays, no necesitás recorrer nada. Si tenés la clave, vas directamente al dato.
* **Costo de Gas:** Es **O(1)**. Buscar un dato en un mapping de 10 elementos cuesta lo mismo que en uno de 10 millones.
* **Valores por Defecto:** En Solidity, todas las claves posibles existen técnicamente desde el inicio. Si consultás una clave que nunca fue usada, el contrato devolverá el valor por defecto del tipo de dato (ej. `0` para uint, `false` para bool).

---

## 📌 Puntos Clave

1. **No son iterables:** No podés preguntar "cuántas claves hay" o "cuáles son". Si necesitás listar los datos, debés combinar el mapping con un array de IDs.
2. **Tipos de Clave:** Pueden ser tipos básicos (uint, address, bytes, string, etc.). **No** pueden ser otros mappings o structs como claves.
3. **Privacidad:** Aunque los declares como `private`, cualquier dato en un mapping es legible desde fuera de la blockchain (viendo el estado del contrato), pero no se pueden "listar" de forma nativa en el código.
4. **Almacenamiento:** Los mappings solo pueden existir en `storage`. No pueden ser declarados dentro de funciones en `memory`.