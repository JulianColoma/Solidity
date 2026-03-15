# 📚 Solidity Mastery: Eventos (Events)

Los **Eventos** son la forma en que un Smart Contract registra (loguea) información en la blockchain. Son fundamentales para comunicar cambios de estado a aplicaciones externas (como un frontend) de manera eficiente y barata.

---

## 📝 Teoría

* **Declaración (`event`):** Se definen a nivel de contrato, especificando qué datos van a registrar.
* **Emisión (`emit`):** Se disparan dentro de una función usando la palabra clave `emit`.
* **Parámetros `indexed`:** Podés marcar hasta 3 parámetros dentro de un evento como `indexed`. Esto le permite a tu frontend (usando librerías como ethers.js o viem) **filtrar** y buscar eventos específicos (por ejemplo, "buscar todos los eventos creados por la billetera X").
* **Almacenamiento:** Los logs de los eventos se guardan en una estructura de datos especial de la EVM que es mucho más barata que las variables de `storage`, pero con una trampa: **los Smart Contracts no pueden leer sus propios eventos**, solo el mundo exterior puede verlos.



---

## 📌 Puntos Clave

1. **Comunicación asíncrona:** Tu frontend en React/Next.js puede "escuchar" (listen) estos eventos en tiempo real para actualizar la interfaz sin necesidad de recargar la página.
2. **Historial barato:** Si necesitás guardar un registro histórico de acciones (ej. quién modificó qué cosa y cuándo) pero el contrato no necesita usar esos datos para su lógica interna, usá eventos. Es muchísimo más barato que guardarlo en un array de structs.
3. **Nomenclatura:** Por convención, los nombres de los eventos suelen ir en PascalCase y en pasado o presente indicativo (ej. `UbicacionAgregada`, `TransferenciaRealizada`).