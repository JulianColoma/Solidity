# ✍️ Generación de Firmas EIP-712 (Frontend)

El estándar EIP-712 permite que el usuario firme datos estructurados que son legibles en la interfaz de su billetera (MetaMask), en lugar de un hash hexadecimal incomprensible.

---

## 📝 1. El Dominio (Domain)
Es el "sello de seguridad". Debe coincidir bit por bit con lo que pusiste en el `constructor` de tu contrato Solidity.
* **name:** El nombre de tu app (ej: "FacuMapp").
* **version:** La versión (ej: "1").
* **chainId:** El ID de la red (ej: 137 para Polygon, 1 para Ethereum). Esto evita que una firma de testnet se use en mainnet.
* **verifyingContract:** La dirección de tu contrato verificador.

## 📝 2. Los Tipos (Types)
Aquí definimos el esquema del mensaje. Es el equivalente al `struct` que el contrato va a decodificar.
Ejemplo: `Certificado(address alumno, bytes32 certificadoHash)`.

## 📝 3. Los Valores (Values)
Son los datos reales: la dirección de la billetera del alumno y el hash del diploma generado previamente.



---

## 🛡️ ¿Por qué usar `_signTypedData`?

Las librerías modernas como **Ethers.js** tienen métodos específicos para esto. Al usarlo:
1. MetaMask detecta el estándar y muestra un formato de "Formulario".
2. Se aplica el hashing automático siguiendo la especificación matemática de Ethereum.
3. El resultado es una firma única que solo la clave privada de la autoridad pudo haber generado para **ese** certificado específico.



---

## 💻 Código de Ejemplo (JavaScript + Ethers.js v6)

Este script simula la acción que realizaría un Profesor en el panel de administración de prueba-alumnos.

```javascript
import { ethers } from "ethers";

async function firmarCertificadoProfesor(alumnoAddress, hashCertificado) {
    // 1. Conexión al Provider y Signer (MetaMask)
    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();

    // 2. Definir el Dominio (DEBE coincidir con el constructor de Solidity)
    const domain = {
        name: "prueba-alumnos",
        version: "1",
        chainId: (await provider.getNetwork()).chainId,
        verifyingContract: "0xTuDireccionDeContratoVerificador" 
    };

    // 3. Definir los Tipos de datos (Esquema)
    const types = {
        Certificado: [
            { name: "alumno", type: "address" },
            { name: "certificadoHash", type: "bytes32" }
        ]
    };

    // 4. Los datos reales que la autoridad está avalando
    const value = {
        alumno: alumnoAddress,
        certificadoHash: hashCertificado
    };

    try {
        console.log("Esperando firma de la autoridad...");
        
        // 5. El método que abre MetaMask
        const signature = await signer.signTypedData(domain, types, value);
        
        console.log("Firma generada con éxito:", signature);
        
        // Esta 'signature' es la que se le pasa luego a la función 
        // validarCertificado(...) del Smart Contract.
        return signature;

    } catch (error) {
        console.error("La autoridad canceló o hubo un error:", error);
    }
}