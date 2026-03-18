// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title BaseSeguridad
 * @dev Contrato "Padre" que maneja la propiedad y seguridad basica.
 */
contract BaseSeguridad {
    address public owner;

    event CambioDeDuenio(address indexed anterior, address indexed nuevo);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "No eres el owner");
        _;
    }

    // Marcamos esta funcion como VIRTUAL para que el hijo pueda cambiarla
    function mensajeDeIdentidad() public view virtual returns (string memory) {
        return "Soy el contrato Base de Seguridad";
    }

    function transferirPropiedad(address _nuevoOwner) public onlyOwner {
        require(_nuevoOwner != address(0), "Direccion invalida");
        emit CambioDeDuenio(owner, _nuevoOwner);
        owner = _nuevoOwner;
    }
}

/**
 * @title MapaFacultad
 * @dev Contrato "Hijo" que hereda la seguridad y añade logica de negocio.
 */
contract MapaFacultad is BaseSeguridad {
    string public sede;

    // El constructor del hijo debe inicializar al padre si este tuviera parametros
    // En este caso, BaseSeguridad no los pide, pero MapaFacultad añade los suyos.
    constructor(string memory _sede) {
        sede = _sede;
    }

    /**
     * @dev Usamos OVERRIDE para cambiar el comportamiento de la funcion heredada.
     */
    function mensajeDeIdentidad() public view override returns (string memory) {
        // Podemos llamar a la logica del padre usando 'super'
        string memory mensajePadre = super.mensajeDeIdentidad();
        return string(abi.encodePacked(mensajePadre, " -> Y ahora soy MapaFacultad"));
    }

    /**
     * @dev Esta funcion usa el modificador 'onlyOwner' que fue definido en el padre.
     */
    function cambiarSede(string calldata _nuevaSede) external onlyOwner {
        sede = _nuevaSede;
    }
}