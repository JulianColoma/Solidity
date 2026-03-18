// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CalculadoraFacu
 * @dev Una libreria propia para manejar logica matematica de promedios.
 */
library CalculadoraFacu {
    // Las funciones de las librerias suelen ser 'pure' o 'view'
    function calcularPromedio(uint256 _nota1, uint256 _nota2) internal pure returns (uint256) {
        return (_nota1 + _nota2) / 2;
    }

    function esNotaAprobada(uint256 _nota) internal pure returns (bool) {
        return _nota >= 4;
    }
}

/**
 * @title GestionNotas
 * @dev Contrato que utiliza la libreria CalculadoraFacu.
 */
contract GestionNotas {
    // Indicamos que queremos usar la libreria para todos los tipos uint256
    using CalculadoraFacu for uint256;
    

    uint256 public promedioFinal;
    bool public alumnoAprobado;

    /**
     * @dev Ejemplo de uso de la libreria.
     */
    function procesarNotas(uint256 _n1, uint256 _n2) external {
        /* Podemos llamar a la funcion de la libreria directamente sobre el numero
        gracias a la instruccion 'using ... for' _n1 es el dueño 
        y sera pasado como primer parametro a la funcion calcularPromedio 
        y, en caso de querer encadenar otra funcion, el resultado de calcularPromedio sera el nuevo dueño 
        y se pasara como primer parametro a la siguiente funcion*/
        promedioFinal = _n1.calcularPromedio(_n2);

        /* Esto también es válido, pero más largo de escribir:
        promedioFinal = CalculadoraFacu.calcularPromedio(_n1, _n2);
       */ 
       
        // Tambien podemos usarla como validacion
        alumnoAprobado = promedioFinal.esNotaAprobada();
    }
}