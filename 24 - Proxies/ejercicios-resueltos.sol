// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/*
 * 🎓 EJERCICIO 1: Lógica V1 (El Motor Inicial)
 * 1. Crear el contrato 'MotorV1' que herede de Initializable, UUPS y Ownable.
 * 2. Definir una variable uint256 llamada 'puntaje'.
 * 3. Implementar el 'initialize' para setear el dueño inicial.
 * 4. Implementar '_authorizeUpgrade' para que solo el dueño actualice.
 * 5. Crear una función 'subirPuntaje()' que sume 1 a la variable.
 *
 * 🎓 EJERCICIO 2: Lógica V2 (La Evolución)
 * 1. Crear el contrato 'MotorV2' que herede de 'MotorV1'.
 * 2. ¡REGLA DE ORO!: No puedes cambiar el orden de las variables de la V1.
 * 3. Definir una NUEVA variable: string public version.
 * 4. Crear una función 'setVersion(string _v)' para actualizarla.
 * 5. Modificar 'subirPuntaje()' para que ahora sume de a 10 puntos.
 */

// --- ESCRIBE TUS CONTRATOS AQUÍ ---

contract MotorV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public puntaje;

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }
    function subirPuntaje() public virtual {
        puntaje++;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}

contract MotorV2 is MotorV1 {
    string public version;

    function setVersion(string memory _newVersion) public {
        version = _newVersion;
    }
    function subirPuntaje() public override {
        puntaje += 10;
    }
}
