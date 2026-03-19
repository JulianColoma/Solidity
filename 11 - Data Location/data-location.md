# 📚 Apunte: Data Locations en Solidity (v0.8.20)

En Solidity, las variables de tipo referencia (arrays, structs y strings) requieren que especifiquemos dónde se almacenan. Elegir la ubicación correcta es vital para la **eficiencia del Gas** y la **lógica del contrato**.

---

## 🏗️ Los 3 Tipos de Ubicaciones

### 1. Storage (El "Disco Rígido")
Es el almacenamiento persistente. Los datos se guardan en la Blockchain para siempre (o hasta que se eliminen).
* **Persistencia:** Sí, entre llamadas a funciones.
* **Costo:** Muy caro en términos de Gas.
* **Comportamiento:** Si declaras una variable local como `storage`, esta actúa como un **puntero** (referencia) al estado del contrato. Cualquier cambio aquí modifica el mapping o array original.

### 2. Memory (La "RAM")
Es un espacio de almacenamiento temporal que se borra al finalizar la ejecución de la función.
* **Persistencia:** No.
* **Costo:** Barato.
* **Comportamiento:** Al traer datos de *Storage* a *Memory*, se crea una **copia**. Si modificas la variable en memoria, los datos en la blockchain **no cambian**.

### 3. Calldata (Los "Argumentos de Entrada")
Es una ubicación especial, no modificable, donde se guardan los argumentos de las funciones.
* **Persistencia:** No.
* **Costo:** Es la opción más barata de todas.
* **Comportamiento:** Es **solo de lectura (read-only)**. Se recomienda usar siempre para parámetros de funciones `external` si no necesitas modificar los datos recibidos.

---

## 🧪 Laboratorio de Código
