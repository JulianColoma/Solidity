// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Estados de un Pedido E-Commerce
 *
 * Modela un ciclo restrictivo para un pedido en línea. Los estados permitidos y 
 * prefijados en sistema deben ser exclusivamente: "Creado", "Pagado", "En Camino" y "Entregado". 
 * que el contrato tenga un struct pedido con dni, comprador, monto y estado (un enum) 
 * defini un mapping de pedido por dni (simple, un pedido por dni) y las siguientes funciones:
 * crearPedido, pagarPedido, enviarPedido, recibioPedido 
 */

contract EjerciciosEnums {
    // 📝 Escribe tu código aquí debajo
    enum estadoPedido {
        Creado,
        Pagado,
        EnCamino,
        Entregado
    }
    struct pedido{
        uint dni;
        string comprador;
        uint monto;
        estadoPedido estado;
    }
    mapping (uint => pedido) listaPedidos; 
    function crearPedido(string calldata _nombre, uint _dni)external {
        listaPedidos[_dni] = pedido({
            dni: _dni,
            comprador: _nombre,
            monto: 0,
            estado: estadoPedido.Creado
        }
        );
    }

    function pagarPedido(uint _dni, uint _pago) external {
        pedido memory p1 = listaPedidos[_dni];
        p1.monto = _pago;
        p1.estado = estadoPedido.Pagado;
        listaPedidos[_dni] = p1;
    }

    function enviarPedido(uint _dni) external{
        pedido memory p1 = listaPedidos[_dni];
        p1.estado = estadoPedido.EnCamino;
        listaPedidos[_dni] = p1;
    }

    function recibioPedido(uint _dni) external{
        pedido memory p1 = listaPedidos[_dni];
        p1.estado = estadoPedido.Entregado;
        listaPedidos[_dni] = p1;
    }


}
