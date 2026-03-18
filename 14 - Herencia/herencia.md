# 📚 Solidity Mastery: Herencia (Inheritance)

La **Herencia** permite que un contrato (llamado hijo) adquiera todas las variables de estado y funciones de otro contrato (llamado padre). Es fundamental para la reutilización de código y para mantener una arquitectura limpia y modular.

---

## 📝 Teoría

* **Palabra clave `is`:** Se usa para declarar la herencia. Ejemplo: `contract Hijo is Padre { ... }`.
* **Visibilidad:** * El hijo hereda todo lo que sea `public` e `internal`.
    * Las funciones/variables `private` **no** son accesibles por el hijo.
* **Polimorfismo (Overriding):** Un contrato hijo puede cambiar el comportamiento de una función heredada.
    * `virtual`: Se pone en la función del padre para indicar que puede ser modificada.
    * `override`: Se pone en la función del hijo para indicar que está modificando la del padre.
* **Herencia Múltiple:** Solidity permite heredar de varios contratos: `contract C is A, B`. El orden importa (de lo más general a lo más específico).



---

## 📌 Puntos Clave

1. **Jerarquía:** El contrato hijo tiene acceso a las variables de `storage` del padre.
2. **Llamadas al padre:** Podés llamar a una función del padre usando la palabra clave `super` o el nombre del contrato directamente.
3. **Constructores:** Si el contrato padre tiene un constructor con parámetros, el hijo **debe** pasarle esos parámetros al momento del despliegue.
4. **Shadowing:** Evitá declarar variables con el mismo nombre que las del padre, ya que esto genera confusión y posibles bugs.