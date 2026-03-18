// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// IMPORTANTE: Para contratos actualizables, usamos la versión "-upgradeable" de las librerías.
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/**
 * @title CertificadosUTNV1
 * @dev Este contrato será nuestra "Lógica". 
 * Hereda de UUPSUpgradeable para permitir que el Proxy cambie de motor.
 */
contract CertificadosUTNV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    
    mapping(bytes32 => bool) public certificados;
    uint256 public totalCertificados;

    /// @custom:oz-upgrades-unsafe-allow constructor
    // En proxies, el constructor debe estar vacío y deshabilitado.
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev Reemplaza al constructor. Se llama una sola vez al desplegar el Proxy.
     */
    function initialize() public initializer {
        // Inicializamos las librerías de OpenZeppelin manualmente
        __Ownable_init(msg.sender); 
        __UUPSUpgradeable_init();
    }

    function registrarCertificado(bytes32 _hash) public onlyOwner {
        certificados[_hash] = true;
        totalCertificados++;
    }

    /**
     * @dev FUNCIÓN OBLIGATORIA: Define quién tiene el poder de actualizar el contrato.
     * Si no incluís esto, el contrato queda congelado para siempre.
     */
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}

/*
¿Cómo se ve esto en un flujo de trabajo?
Programás esto: Lo guardás como CertificadosV1.sol.

Usás un Plugin: Usás el plugin de OpenZeppelin para Hardhat o Foundry.

Despliegue: El plugin detecta que es UUPS, despliega este código, despliega un Proxy estándar (que vos no tenés que escribir) y los conecta.
*/