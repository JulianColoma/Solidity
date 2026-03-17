# ✍️ Firmas Digitales y EIP-712

En Ethereum, usamos el algoritmo **ECDSA** (Elliptic Curve Digital Signature Algorithm) para firmar y verificar mensajes. El estándar **EIP-712** es una forma de estructurar esos mensajes para que sean legibles por humanos al firmar en MetaMask.

---

## 📝 1. El proceso de Firma (Off-chain)
Cuando firmas algo, se combinan tres elementos:
1. **El Mensaje:** (ej: "Autorizo el certificado #123").
2. **Tu Clave Privada:** Que vive en tu wallet.
3. **El Resultado:** Una firma que consta de tres valores: **v, r, s**.



## 📝 2. La Verificación (On-chain)
El contrato inteligente usa una función especial llamada `ecrecover`. 
* se le pasa el **Mensaje** y la **Firma (v, r, s)**.
* La función te devuelve la **Dirección (address)** que creó esa firma.
* Si esa dirección coincide con la de la **autoridad** (aquel autorizado a firmar), ¡entonces la firma es válida!

---

## 🛡️ EIP-712: "Typed Data"
Antes, los usuarios firmaban un chorro de números hex que no entendían. Con **EIP-712**, MetaMask muestra un cartelito lindo con los campos (Nombre, ID, Fecha) antes de firmar.

### Componentes de EIP-712:
1. **Domain Separator:** Un hash que identifica a qué contrato y a qué red pertenece la firma (para que no usen una firma de tu red de prueba en la Mainnet).
2. **Struct Hash:** El contenido del mensaje convertido en un hash único.