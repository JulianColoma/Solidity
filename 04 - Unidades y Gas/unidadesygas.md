# 📚 Solidity Mastery: Unidades de Ether y Gas

En Ethereum, el manejo de valores monetarios y el costo de ejecución son conceptos fundamentales. Solidity **no soporta números decimales**, por lo que todo se maneja en números enteros utilizando subunidades, siendo el **Wei** la unidad base.

---

## 📝 Teoría

### 1. Unidades de Ether
Como no existen los decimales (no podés escribir `0.5` en el código), usamos sufijos que Solidity convierte automáticamente.
* **1 wei:** La unidad mínima absoluta.
* **1 gwei:** Equivalente a 1.000.000.000 de wei (1e9). Es la unidad que se usa típicamente para expresar el precio del Gas.
* **1 ether:** Equivalente a 1.000.000.000.000.000.000 de wei (1e18). 

### 2. Gas y Gas Limit
El **Gas** es la unidad de medida del esfuerzo computacional necesario para ejecutar operaciones en la red. Guardar un dato en `storage` cuesta gas, hacer una suma cuesta gas.
* **Gas:** La cantidad de "combustible" computacional que requiere tu código.
* **Gas Price (Precio del Gas):** Lo que estás dispuesto a pagar (generalmente en Gwei) por cada unidad de Gas. Fluctúa según la congestión de la red.
* **Gas Limit:** La cantidad **máxima** de unidades de Gas que permitís que consuma una transacción. Si el código necesita más gas que el límite fijado, la transacción falla con el error **"Out of Gas"** y perdés el Ether gastado hasta ese punto. Si consume menos, la red te devuelve la diferencia sobrante.



---

## 📌 Puntos Clave

1. **La regla de Oro:** Internamente, las funciones siempre reciben y manejan los valores en **Wei**. Cuando consultás un saldo o enviás dinero (`msg.value`), ese número gigante está en Wei.
2. **Sin decimales matemáticos:** Si querés calcular la mitad de 1 Ether en tu lógica, no podés hacer `0.5 ether`. Tenés que hacer la división: `1 ether / 2`.
3. **Costo de Transacción Total:** Se calcula multiplicando el **Gas Consumido** por el **Precio del Gas**.
4. **Prevención de colapsos:** El sistema de Gas existe para evitar problemas como el *Problema de la Parada* de Turing. Si alguien sube un contrato con un bucle infinito, eventualmente se quedará sin gas, la ejecución se cortará y la red seguirá funcionando.