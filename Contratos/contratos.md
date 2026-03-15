# 📚 Solidity Mastery: Contratos y Constructores

En Solidity, un contrato es la unidad fundamental de código. Podés pensarlo como una "Clase" en la Programación Orientada a Objetos (POO), que contiene variables de estado (datos) y funciones (comportamiento). El **Constructor** es la puerta de entrada a la vida de ese contrato.

---

## 📝 Teoría

### 1. El Contrato (`contract`)
Es el contenedor principal. Cuando despliegas un contrato en la red (como Ethereum o la BFA), se le asigna una dirección única (Address) y su código se vuelve inmutable.
* **Sintaxis:** `contract NombreDelContrato { ... }`

### 2. El Constructor (`constructor`)
Es una función especial y opcional que **se ejecuta una única vez** en toda la vida del contrato: en el momento exacto en que se despliega en la blockchain.
* **Sintaxis:** `constructor(tipo parametro) { ... }`
* **Propósito Principal:** Inicializar las variables de estado, definir quién es el administrador (owner) o configurar parámetros base que el contrato necesita para empezar a funcionar.
* **Flexibilidad:** Podés pasarle argumentos al constructor al momento de hacer el despliegue (deploy), lo que te permite usar el mismo código base para crear contratos con diferentes configuraciones iniciales.



---

## 📌 Puntos Clave

1. **Inmutabilidad Post-Despliegue:** Una vez que el constructor termina de ejecutarse, el contrato queda guardado en la blockchain y su código no se puede modificar. Si hay un error, tenés que desplegar un contrato nuevo (con una dirección nueva).
2. **Asignación de Dueño:** Es el estándar de la industria usar el constructor para guardar `msg.sender` en una variable de estado (generalmente `immutable`) llamada `owner` o `admin`. El `msg.sender` en el constructor es la billetera que está pagando el gas para subir el contrato a la red.
3. **Costo de Despliegue:** Subir un contrato a la red es la transacción que más Gas consume, porque estás guardando el bytecode permanentemente en el `storage` global de la blockchain.