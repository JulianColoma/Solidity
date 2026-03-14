// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title EvaluadorNotas
 * @dev Ejemplo practico de condicionales y operador ternario.
 */
contract EvaluadorNotas {

    /**
     * @dev Determina el estado de un alumno segun su nota usando if-else.
     */
    function obtenerCalificacion(uint256 _nota) external pure returns (string memory) {
        require(_nota <= 10, "La nota no puede ser mayor a 10");

        if (_nota >= 6) {
            return "Promocionado";
        } else if (_nota >= 4) {
            return "Final";
        } else {
            return "Recursa";
        }
    }

    /**
     * @dev Ejemplo de operador ternario para una decision simple.
     * Retorna true si es par, false si es impar.
     */
    function esPar(uint256 _n) external pure returns (bool) {
        // condicion ? valor_si_true : valor_si_false
        return (_n % 2 == 0) ? true : false;
    }

    /**
     * @dev Uso de condicionales para determinar el mayor de tres numeros.
     */
    function encontrarMayor(uint256 _a, uint256 _b, uint256 _c) external pure returns (uint256) {
        if (_a >= _b && _a >= _c) {
            return _a;
        } else if (_b >= _a && _b >= _c) {
            return _b;
        } else {
            return _c;
        }
    }
}