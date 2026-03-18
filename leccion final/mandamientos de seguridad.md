# 🛡️ Los 10 Mandamientos del Auditor 

Este documento establece las reglas de oro de seguridad que deben seguir todos los contratos de este repositorio.

---

### 1. 🔄 Patrón "Checks-Effects-Interactions" (CEI)
**Mandamiento:** Validarás antes de actuar y actualizarás antes de enviar.
- **Por qué:** Evita la **Reentrancy**. Si enviás Ether (`interaction`) antes de restar el balance (`effect`), un atacante puede volver a llamar a la función antes de que el balance baje, vaciando el contrato.

### 2. 🚫 Jamás usarás `tx.origin` para autorizar
**Mandamiento:** Usarás `msg.sender` para identificar quién llama.
- **Por qué:** `tx.origin` identifica al dueño original de la billetera. Si el dueño interactúa con un contrato malicioso, ese contrato puede "suplantar" su identidad ante tu contrato si usás `tx.origin`.

### 3. 👁️ Honrarás la Visibilidad Mínima
**Mandamiento:** Todo es `private` o `internal` hasta que se demuestre lo contrario.
- **Por qué:** Reduce la superficie de ataque. Usar `external` para funciones que solo se llaman desde afuera no solo es más seguro, sino que ahorra gas al leer de `calldata`.

### 4. 🎲 No usarás datos del bloque para el azar
**Mandamiento:** No confiarás en `block.timestamp` ni `block.difficulty` para sorteos.
- **Por qué:** Los mineros/validadores tienen cierto control sobre estos valores. Para azar real y auditable, se debe integrar un Oráculo (ej: Chainlink VRF).

### 5. 🌊 El Ether puede entrar "por la fuerza"
**Mandamiento:** No basarás tu lógica en `address(this).balance`.
- **Por qué:** Mediante `selfdestruct` o minería forzada, alguien puede enviar Ether a tu contrato sin disparar ninguna función `payable`. Si tu contrato espera un balance exacto, se romperá.

### 6. 📚 Santificarás las Librerías Estándar
**Mandamiento:** No reinventarás la rueda (usa OpenZeppelin).
- **Por qué:** Los contratos de la comunidad han sido auditados por miles de expertos. Tu implementación propia de un ERC-20 o de un sistema de permisos probablemente tenga fallas que ya fueron resueltas.

### 7. 👶 No dejarás Contratos "Motor" Huérfanos
**Mandamiento:** Inicializarás la lógica (Implementation) de tus Proxies.
- **Por qué:** Si dejás el contrato de lógica sin inicializar, un atacante puede tomar control de él y ejecutar un `selfdestruct`, dejando tu Proxy (y todos los fondos) inservibles ("ladrillo").

### 8. ⏳ Evitarás bucles sobre Arrays ilimitados
**Mandamiento:** No iterarás sobre listas que crecen sin control.
- **Por qué:** Si la lista de alumnos o usuarios es muy larga, la transacción superará el límite de gas del bloque y fallará siempre. Es un ataque de **Denial of Service (DoS)** por agotamiento de gas.

### 9. 📥 Preferirás el "Pull" sobre el "Push"
**Mandamiento:** El usuario debe reclamar sus fondos, el contrato no debe enviarlos.
- **Por qué:** Si enviás fondos a 10 personas y una es un contrato que rechaza el pago, la transacción entera falla para todos. Si cada uno reclama su parte por separado, el error de uno no afecta al resto.

### 10. 📝 Documentarás con NatSpec (Ethereum Natural Specification)
**Mandamiento:** Explicarás la *intención* de cada función.
- **Por qué:** El código dice *qué* hace, NatSpec dice *por qué* lo hace. Ayuda a auditores (humanos e IA) a detectar si hay una discrepancia entre la lógica y el objetivo del contrato.