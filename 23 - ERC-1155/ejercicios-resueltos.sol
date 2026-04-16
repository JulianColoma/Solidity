// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

/*
 * 🎓 EJERCICIO 1: Fábrica de Componentes (Estilo Libre)
 * 1. Definir 3 constantes con IDs diferentes:
 * - 'CREDITOS' (La moneda del contrato).
 * - 'CHIP_IA' (Un componente raro).
 * - 'PLACA_MADRE' (Un componente común).
 * 2. En el constructor, mintear al creador:
 * - 10.000 de CREDITOS.
 * - 1 solo CHIP_IA (Supply único).
 * - 50 PLACAS_MADRE.
 *
 * 🎓 EJERCICIO 2: Marketplace Interno (Transferencia por Pago)
 * Implementar una función 'venderNFT' que permita al dueño de un item
 * transferirlo a un comprador a cambio de una cantidad de CREDITOS.
 * * Requisitos de la función:
 * 1. Recibir: address comprador, uint256 idDelNFT, uint256 precioEnCreditos.
 *  ⚠️ Realiza las validaciones correspondientes.
 * 💡 Pista: Usá 'safeTransferFrom' para mover los tokens.
 */

contract CyberMarket is ERC1155 {
    // Definí tus IDs acá:
    uint public constant CREDITOS = 0;

    uint public constant CHIP_IA = 1;
    uint public constant PLACAS_MADRE = 2;

    constructor() ERC1155("https://api.cyberpunk.com/metadata/{id}.json") {
        // Minteo inicial:
        address duenio = msg.sender;
        _mint(duenio, CREDITOS, 10000 * 10 ** 18);
        _mint(duenio, CHIP_IA, 1);
        _mint(duenio, PLACAS_MADRE, 50);
    }

    /**
     * @dev Función de intercambio entre usuarios.
     */
    function venderNFT(
        address comprador,
        uint256 idNFT,
        uint256 precio
    ) public {
        // Tu lógica de intercambio acá:
        require(
            balanceOf(msg.sender, idNFT) >= 1,
            "No eres propietario de ese token"
        );
        require(balanceOf(comprador, CREDITOS) >= precio, "Saldo insuficiente");

        _safeTransferFrom(comprador, msg.sender, CREDITOS, precio);
        _safeTransferFrom(msg.sender, comprador, idNFT, 1);
    }

    // Nota: Para que safeTransferFrom funcione entre terceros,
    // el contrato debe tener permisos o usar lógica interna.
}
