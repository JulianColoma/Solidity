# 📚 Solidity Mastery: Enums (Enumeraciones)

Los **Enums** son un tipo de dato personalizado que permite definir un conjunto de constantes con nombres descriptivos. Son la herramienta ideal para manejar **Máquinas de Estado** y procesos lógicos, haciendo que el código sea legible y eficiente.

---

## 📝 Teoría

* **Representación Interna:** Solidity almacena los Enums como números enteros (`uint8`). El primer valor de la lista corresponde al `0`, el segundo al `1`, y así sucesivamente.
* **Eficiencia de Gas:** Al ser representados como enteros pequeños, ocupan muy poco espacio en la blockchain.
* **Valor por Defecto:** Si una variable de tipo Enum no se inicializa, tomará automáticamente el **primer valor** definido en la lista (índice 0).
* **Ubicación:** Se definen a nivel de contrato o de archivo, pero **nunca** dentro de una función.

### ¿Por qué usarlos?
Evitan el uso de "números mágicos" (ej. usar `0` para "Activo" o `1` para "Inactivo"). Es mucho más seguro y profesional escribir `Estado.Activo`.

[Image of state machine diagram using enums in smart contracts]

---

## 📌 Puntos Clave

1.  **Seguridad:** Al usar Enums, Solidity valida automáticamente que el valor asignado esté dentro del rango definido.
2.  **Reset:** Si usas `delete` sobre una variable de tipo Enum, esta volverá a su estado inicial (índice 0).
3.  **Integración:** En aplicaciones (Frontend), los Enums suelen recibirse como números, por lo que es vital documentar qué número corresponde a qué estado en el mapping.