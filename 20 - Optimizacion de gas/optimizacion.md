# ⛽ Solidity Mastery: Optimización de Gas y Errores 

La optimización en Solidity no es un lujo, es una necesidad. Cada unidad de gas ahorrada mejora la experiencia del usuario y la eficiencia del protocolo.

---

## 🛡️ 1. Validaciones: Require vs. Custom Errors

Aunque el `require` es la forma clásica, los **Custom Errors** (introducidos en Solidity 0.8.4) son mucho más baratos porque evitan el uso de strings largos en la blockchain.

### ❌ Forma Costosa (Strings)
Los strings consumen mucho gas al almacenarse y procesarse.
```solidity
require(msg.sender == owner, "Solo el duenio puede ejecutar esta funcion");
```
✅ Forma optima (Custom Errors)
Los errores personalizados se guardan como selectores de 4 bytes, ahorrando gas en el despliegue y en la ejecución.
error NoAutorizado(); // Selector ultra liviano
```solidity
function miFuncion() public view {
    if (msg.sender != owner) {
        revert NoAutorizado();
    }
}
```
###  📦 2. Almacenamiento: Variable Packing
Solidity organiza el almacenamiento en slots de 32 bytes. Si agrupamos variables pequeñas, podemos "empaquetarlas" en un solo slot.

**Importante**: Las variables deben estar declaradas de forma consecutiva para que el compilador las empaquete.
```solidity
// Gasta 3 slots de 32 bytes
struct MalEmpaquetado {
    uint256 id;    // Slot 1
    bool activo;   // Slot 2
    uint256 saldo; // Slot 3
}

// Gasta solo 2 slots de 32 bytes
struct BienEmpaquetado {
    uint128 saldo; // Slot 1 (16 bytes)
    bool activo;   // Slot 1 (1 byte) - Entra en el espacio sobrante
    uint256 id;    // Slot 2
}
```
### ⚡ 3. El Truco del "Cortocircuito" (Short-Circuiting)
En las operaciones lógicas (&& y ||), Solidity evalúa de izquierda a derecha. Si la primera condición define el resultado, la segunda ni siquiera se ejecuta.

**Regla**: Poné siempre la condición más barata (leer una constante o un valor local) o la que más probablemente falle primero.

```solidity
// Si 'valor > 0' es falso, el contrato no gasta gas verificando el 'owner' en Storage.
require(valor > 0 && msg.sender == owner, "Error");
```
### 💎 4. Constantes e Inmutables
Si un valor no cambia, no lo trates como una variable de estado normal.

**constant**: Para valores conocidos antes de compilar.

**immutable**: Para valores que se definen una sola vez en el constructor.

**Ahorro**: No se guardan en los slots de almacenamiento (storage), sino que se incrustan directamente en el código del contrato (bytecode). Leerlos es casi gratis.
## 🚀 5. Tips Rápidos de Ahorro Técnico

- **`++i` en lugar de `i++`**  
  Ahorra una pequeña cantidad de gas al no tener que guardar el valor anterior antes de incrementar.

- **`external` sobre `public`**  
  Si la función solo se llama desde afuera, `external` lee de `calldata` sin copiar a memoria.

- **No inicializar en 0**  
  Las variables ya valen `0` por defecto. Hacer `uint x = 0;` gasta gas innecesariamente.

- **`calldata` para arrays**  
  Al recibir listas o strings en funciones externas, usá `calldata` en vez de `memory` para evitar copias costosas.