# 📚 Solidity Mastery: Mappings Anidados (Nested Mappings)

La anidación de mappings ocurre cuando el valor (`value`) de un mapping es, a su vez, otro mapping. Es una estructura fundamental para gestionar permisos, autorizaciones y relaciones complejas entre entidades.

---

## 📝 Teoría

* **Sintaxis:** `mapping(Key1 => mapping(Key2 => Value)) public nombre;`
* **Concepto:** Podés imaginarlo como una tabla de doble entrada o coordenadas. Para llegar al valor final, necesitás proveer dos claves en orden.
* **Uso Típico:** El estándar ERC-20 lo usa para la función `allowance` (permitir que alguien gaste tus tokens).



---

## 📌 Puntos Clave

1. **Eficiencia:** Al igual que los mappings simples, el acceso es instantáneo (O(1)). No importa qué tan profunda sea la anidación, el costo de gas es predecible.
2. **Jerarquía:** La primera clave suele representar al "dueño" o la entidad principal, y la segunda al "objeto" o la entidad secundaria.
3. **Escalabilidad:** Podés anidar más de dos niveles (ej. mapping de mapping de mapping), aunque rara vez se necesita más de dos para la mayoría de los casos de uso.
4. **Reseteo:** Al usar `delete` sobre el primer nivel (ej. `delete miMapping[key1]`), se resetean **todas** las relaciones internas vinculadas a esa primera clave.

---