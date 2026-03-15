# 📚 Solidity Mastery: Hashing con Keccak256

El hashing es una función criptográfica que toma cualquier cantidad de datos y los transforma en un valor de 32 bytes (una "huella digital"). En Solidity, se usa el algoritmo **Keccak256** (que es el estándar de Ethereum, muy similar al SHA-3).

---

## 📝 Teoría

* **Determinista:** La misma entrada siempre producirá el mismo hash.
* **Unidireccional:** No podés "desencriptar" un hash para obtener los datos originales.
* **Resistente a colisiones:** Es matemáticamente improbable que dos entradas diferentes generen el mismo hash.

### ¿Para qué se usa en Solidity?
1. **Generar IDs únicos:** Para usuarios, objetos o transacciones.
2. **Comparar Strings:** Como en Solidity no podés comparar strings directamente con `==`, comparamos sus hashes.
3. **Firmas y Seguridad:** Para verificar que un dato no fue alterado.



---

## 📌 Puntos Clave

1. **Entrada en Bytes:** `keccak256` no acepta strings o números directamente; requiere datos de tipo `bytes`. Por eso siempre usamos `abi.encodePacked` o `abi.encode` antes.
2. **Comparación de Strings:** Para saber si `string A == string B`, hacemos: 
   `keccak256(abi.encodePacked(A)) == keccak256(abi.encodePacked(B))`.
3. **Costo de Gas:** Es una operación barata pero debe usarse con conciencia dentro de bucles.