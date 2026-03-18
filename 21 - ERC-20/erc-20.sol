// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @dev Importamos el estandar de OpenZeppelin. 
 * En un entorno local (Hardhat/Foundry) esto se instala via npm.
 * En Remix se puede importar directamente de GitHub.
 */
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title JulianCoin
 * @dev Crear un token hoy es tan simple como heredar y llamar al constructor.
 */
contract JulianCoin is ERC20, Ownable {

    // El constructor de ERC20 recibe (Nombre, Simbolo)
    // El constructor de Ownable define al msg.sender como duenio inicial
    constructor(uint256 _initialSupply) ERC20("Julian Coin", "JCOIN") Ownable(msg.sender) {
        // Los tokens se crean (mint) y se asignan a una billetera inicial.
        // Multiplicamos por 10**18 para manejar los 18 decimales estandar.
        _mint(msg.sender, _initialSupply * 10 ** decimals());
    }

    /**
     * @dev Solo el duenio puede crear mas tokens si hiciera falta.
     * Usamos el modificador 'onlyOwner' que viene de la herencia de Ownable.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}