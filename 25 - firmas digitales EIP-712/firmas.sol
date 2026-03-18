// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract VerificadorCertificados is EIP712 {
    using ECDSA for bytes32;

    address public profesorAutorizado;

   // declaramos la autoridad
    constructor(address _profesor) EIP712("FacuMapp", "1") {
        profesorAutorizado = _profesor;
    }

    function validarCertificado(
        address _alumno, 
        bytes32 _certificadoHash, 
        bytes memory _signature
    ) public view returns (bool) {
        
        // 1. Creamos el digest (hash estructurado)
        bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
            keccak256("Certificado(address alumno,bytes32 certificadoHash)"),
            _alumno,
            _certificadoHash
        )));

        // 2. Recuperamos la dirección del firmante
        address firmante = digest.recover(_signature);

        // 3. Comparamos directamente con la variable de storage
        return firmante == profesorAutorizado;
    }
}