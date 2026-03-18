// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/**
 * @title MundoCriptoGame
 * @dev Contrato hibrido: Maneja moneda (fungible) e items (NFTs).
 */
contract MundoCriptoGame is ERC1155, Ownable {
    
    // --- Identificadores de Items ---
    // Moneda del juego (Fungible)
    uint256 public constant ORO = 0;
    
    // Items del juego (NFTs si el supply es 1, o semi-fungibles si hay varios)
    uint256 public constant ESPADA_LEGENDARIA = 1;
    uint256 public constant ESCUDO_MADERA = 2;
    uint256 public constant POCION_VIDA = 3;

    // Precios en ORO para la tienda interna
    mapping(uint256 => uint256) public precios;

    constructor() ERC1155("https://api.mi-juego.com/metadata/{id}.json") Ownable(msg.sender) {
        // Definimos precios iniciales en la tienda
        precios[ESPADA_LEGENDARIA] = 500 * 10**18; // Cuesta 500 Oro
        precios[POCION_VIDA] = 50 * 10**18;        // Cuesta 50 Oro
    }

    /**
     * @dev El admin reparte oro inicial o premios por misiones.
     */
    function premiarJugador(address _jugador, uint256 _cantidadOro) external onlyOwner {
        _mint(_jugador, ORO, _cantidadOro, "");
    }

    /**
     * @dev Sistema de crafteo o compra interna.
     * El jugador quema (gasta) su ORO para recibir un item.
     */
    function comprarItem(uint256 _itemId, uint256 _cantidad) external {
        uint256 costoTotal = precios[_itemId] * _cantidad;
        
        // Verificamos que el item exista en la tienda y el jugador tenga oro
        require(costoTotal > 0, "Item no disponible en la tienda");
        require(balanceOf(msg.sender, ORO) >= costoTotal, "No tienes suficiente Oro");

        // 1. Quemamos el oro del jugador (sacarlo de circulacion o mandarlo al tesoro)
        _burn(msg.sender, ORO, costoTotal);

        // 2. Le entregamos el item (NFT o item consumible)
        _mint(msg.sender, _itemId, _cantidad, "");
    }

    /**
     * @dev Permite al admin crear nuevos tipos de items en el futuro.
     */
    function setPrecio(uint256 _id, uint256 _precio) external onlyOwner {
        precios[_id] = _precio;
    }
}