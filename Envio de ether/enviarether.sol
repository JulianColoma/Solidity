// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract ManejoDinero {
    
    // Eventos para trackear los movimientos en el explorador de bloques
    event Deposito(address indexed quien, uint256 cuanto);
    event Retiro(address indexed a_donde, uint256 cuanto);

    /**
     * @dev Permite que el contrato reciba ETH directamente.
     */
    receive() external payable {
        emit Deposito(msg.sender, msg.value);
    }

    /**
     * @dev Funcion para consultar cuanto ETH tiene este contrato acumulado.
     */
    function consultarBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @dev EL METODO RECOMENDADO (call).
     * Retira todo el dinero del contrato y lo manda al owner.
     */
    function retirarTodo(address payable _destino) external {
        uint256 cantidad = address(this).balance;
        require(cantidad > 0, "No hay fondos");

        // call devuelve un booleano (exito) y los datos de retorno (aca no los usamos)
        // La sintaxis es: (bool success, ) = destino.call{value: cantidad}("");
        (bool exito, ) = _destino.call{value: cantidad}("");
        
        require(exito, "La transferencia fallo");
        
        emit Retiro(_destino, cantidad);
    }

    /**
     * @dev Ejemplo de funcion de pago. 
     * Imagina que esto es para "comprar" algo en tu juego.
     */
    function comprarAlgo() external payable {
        require(msg.value >= 0.01 ether, "Precio minimo es 0.01 ETH");
        // El ETH ya queda guardado en el contrato automaticamente al ser 'payable'
    }
}