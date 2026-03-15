# 📚 Capítulo 0: Fundamentos Web3 (Blockchain, Ethereum y Smart Contracts)

Para entender Solidity, primero hay que entender el entorno donde se ejecuta. En el desarrollo tradicional, el código vive en un servidor centralizado. En Web3, el código vive simultáneamente en miles de computadoras alrededor del mundo.

---

## 🔗 1. ¿Qué es la Blockchain?

En términos de sistemas, una blockchain es una **base de datos distribuida** compartida entre los nodos de una red peer-to-peer (P2P).

* **Bloques y Criptografía:** La información se agrupa en "bloques". Cada bloque tiene una capacidad máxima y, una vez lleno, se cierra y se une criptográficamente al bloque anterior, formando una cadena. Esto hace que alterar un dato viejo sea computacionalmente imposible sin alterar todos los bloques que le siguen.
* **Descentralización:** Ninguna entidad tiene el control total. Todos los nodos (computadoras en la red) tienen una copia exacta del historial.
* **Consenso:** Para que un bloque nuevo se agregue, la mayoría de los nodos debe estar de acuerdo en que las transacciones dentro de ese bloque son válidas (mediante mecanismos como *Proof of Work* o *Proof of Stake*).



---

## ⚙️ 2. Ethereum y la EVM

Bitcoin fue la primera blockchain, pero fue diseñada casi exclusivamente como una calculadora de saldos (una red de pagos). **Ethereum** revolucionó el concepto al introducir la programabilidad.

* **La computadora mundial:** Ethereum no solo guarda saldos, sino que guarda **estado computacional**. 
* **EVM (Ethereum Virtual Machine):** Es el motor de Ethereum. Es el entorno de ejecución donde vive tu código. Cualquier blockchain que sea "EVM-compatible" (como Polygon, Binance Smart Chain, o redes permisionadas como la BFA) puede ejecutar contratos escritos en Solidity sin cambiar una sola línea de código.



---

## 📜 3. ¿Qué son los Smart Contracts?

Son simplemente **programas de computadora almacenados en la blockchain**. 
Son el "backend" de una aplicación Web3.

* **Deterministas:** Si les pasás los mismos inputs, siempre, sin excepción, devolverán el mismo output y dejarán el mismo estado.
* **Inmutables:** Una vez desplegados en la red, su código no puede ser modificado ni parcheado. Si encontrás un error fatal, la única solución es desplegar un contrato nuevo y migrar los datos (lo cual es muy complejo).
* **Autoejecutables:** Funcionan bajo la lógica de "Si ocurre X, entonces ejecuta Y". No necesitan intermediarios para validar el acuerdo.



---

## 🧠 4. Conceptos Clave para encarar Solidity

Antes de programar, tenés que dominar este vocabulario:

### A. Tipos de Cuentas
En Ethereum hay dos entidades que pueden interactuar:
1. **EOA (Externally Owned Accounts):** Las billeteras de los usuarios (como MetaMask). Tienen una clave pública (address) y una clave privada. Son las únicas que pueden **iniciar** una transacción.
2. **Contract Accounts:** Los Smart Contracts. Tienen una dirección (address) pero NO tienen clave privada. Se activan solo cuando una EOA u otro contrato interactúa con ellos.

### B. Transacciones vs Llamadas (Calls)
* **Transacción:** Modifica el estado de la blockchain (ej. guardar un nuevo alumno, transferir tokens). Cuesta Gas, requiere firma criptográfica y tarda unos segundos en confirmarse.
* **Call (Llamada):** Solo lee información de la blockchain (ej. consultar el saldo, ver cuántas sedes hay). Es gratis, instantánea y no requiere firma.

### C. Nodos y RPC (Remote Procedure Call)
Tu frontend (React/Next.js) no puede hablar con la blockchain mágicamente. Necesita conectarse a un **Nodo** a través de una URL RPC. Servicios como Alchemy o Infura te prestan acceso a sus nodos para que tu dApp pueda leer y escribir en la red.

### D. Redes (Mainnet vs Testnet)
* **Mainnet:** La red principal donde el Ether cuesta dinero real.
* **Testnets:** Redes de prueba (como Sepolia o Holesky) que son clones exactos de la Mainnet, pero donde el Ether es de mentira (se consigue gratis en "Faucets"). Todo el desarrollo y testing se hace acá antes de salir a producción.