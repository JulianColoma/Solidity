// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/*
 * 🎓 EJERCICIO 1: Mi Primer NFT
 * 1. Heredar de ERC721URIStorage.
 * 2. Crear un constructor que defina nombre y símbolo (ej: "Mi Coleccion", "MC").
 * 3. Crear una función 'mintear' que reciba una dirección y un tokenId.
 * 4. Dentro de la función, usar _safeMint para crear el token.
 *
 * 🎓 EJERCICIO 2: Base URI (El "Folder" de los NFTs)
 * En lugar de setear el link completo para cada NFT, los contratos suelen 
 * tener una base común (ej: https://api.miweb.com/token/).
 * 1. Sobreescribir la función interna '_baseURI()'.
 * 2. Debe retornar el string: "ipfs://QmYourHash/".
 * 💡 Pista: _baseURI no recibe parámetros y es internal view.
 */

contract MiColeccionNFT is ERC721URIStorage {
    
    constructor() ERC721("Mastery NFT", "MNFT") {}

  
    function _baseURI() internal view override returns(string memory) {
        return "ipfs://QmYourHash/";
    }

    function mintear(address to, uint256 id, string memory uri) public {
        _safeMint(to, id);
        _setTokenURI(id, uri);
    }
}