// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title FacultadNFT
 * @dev Un ejemplo de como crear certificados unicos para la facultad.
 */
contract FacultadNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    // El constructor recibe el nombre de la coleccion y el simbolo
    constructor() ERC721("Certificados UTN", "CUTN") Ownable(msg.sender) {}

    /**
     * @dev Funcion para crear (mint) un nuevo NFT.
     * @param student Direccion del alumno que recibe el certificado.
     * @param metadataURI Enlace al JSON con los datos del certificado.
     */
    function emitirCertificado(address student, string memory metadataURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds++; // Incrementamos el contador para generar un ID unico
        uint256 newItemId = _tokenIds;

        _mint(student, newItemId);          // Creamos el token para el alumno
        _setTokenURI(newItemId, metadataURI); // Asociamos los metadatos (el diploma)

        return newItemId;
    }
}