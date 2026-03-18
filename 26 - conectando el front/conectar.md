# 🌐 Conectando el Frontend con la Blockchain

Un Smart Contract por sí solo es solo código en un nodo. Para que el usuario interactúe, necesitamos un "puente" que traduzca las acciones del navegador a transacciones de la red.

---

## 📝 1. Los 3 Pilares del Frontend Web3

1. **Provider (El Oído):** Es la conexión a la blockchain. Puede ser MetaMask o un nodo (RPC) como Infura o Alchemy. Permite **leer** datos gratis.
2. **Signer (La Voz):** Es la clave privada del usuario. Permite **firmar** y enviar transacciones (pagando gas).
3. **Contract (El Interfaz):** Es un objeto en JS que representa tu contrato. Para crearlo necesitás:
   * **Dirección:** ¿Dónde está el contrato?
   * **ABI:** ¿Qué funciones tiene? (Es un JSON que genera el compilador).
   * **Provider/Signer:** ¿Con qué cuenta vamos a hablar?



---

## 📝 2. El flujo de una transacción

1. El usuario hace clic dispara un evento en la web (ej: click en el boton "generar certificado").
2. JS prepara la transacción usando la **ABI** y los parámetros.
3. El **Signer** (MetaMask) abre una ventanita pidiendo permiso.
4. El usuario acepta, la transacción se envía al **Provider**.
5. Esperamos a que la red confirme el bloque.



---

## 🛠️ Herramientas Esenciales

* **Ethers.js / Viem:** Librerías para interactuar con Ethereum.
* **Metamask:** La billetera (wallet) que guarda las llaves del usuario.
* **ABI (Application Binary Interface):** El "manual de instrucciones" de tu contrato en formato JSON.