# 📚 Solidity Mastery: Structs (Estructuras)

Los **Structs** son tipos de datos personalizados que permiten agrupar variables de diferentes tipos bajo un mismo nombre. Son la base para crear modelos de datos complejos y organizados dentro de un Smart Contract.

---

## 📝 Teoría

* **Agrupación Lógica:** Permiten representar objetos de la vida real (ej. un `Alumno` con nombre, legajo y promedio).
* **Flexibilidad:** Dentro de un struct podés incluir `uint`, `bool`, `string`, `address` e incluso otros `structs` o `enums`.
* **Costo de Gas:** Crear y modificar structs en *Storage* es costoso, por lo que es vital usarlos con sabiduría y aprovechar las *Data Locations* (`memory` vs `storage`) al manipularlos.
* **Ubicación:** Se pueden definir tanto fuera como dentro del contrato.

### Formas de inicializar un Struct:
1. **Por posición:** `MiStruct(val1, val2);` (Rápido pero propenso a errores si cambias el orden).
2. **Por clave-valor:** `MiStruct({campo1: val1, campo2: val2});` (**Recomendado** por legibilidad).
3. **Por asignación directa:** Creando la variable y asignando campo por campo.



---

## 📌 Puntos Clave 

1.  **Agrupación Pura:** Es el patrón más común en Solidity para entidades: `struct MiStruct { ... }`.
2.  **No son Clases:** A diferencia de la POO tradicional, los structs en Solidity no tienen métodos (funciones propias); son puramente contenedores de datos.
3.  **Límites:** Si un struct es demasiado grande (muchos campos), podés encontrarte con el error "Stack too deep" limitando compilaciones grandes. En ese caso, conviene dividirlo.