// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * 🎓 EJERCICIO 1: Modelando un Libro (Datos Estructurados)
 *
 * Diseña un esquema de datos personalizado para un "Libro" usando `struct`.
 * 
 * Debe contener los siguientes campos (en este orden):
 * - El texto de su título (string)
 * - El identificador numérico de su autor (uint)
 * - Su año de publicación (uint)
 * - Un banderín de comprobación (bool) indicando si está disponible.
 * 
 * Luego de declarar el struct `Libro`, declara una variable de 
 * estado pública llamada `miLibroFavorito` de ese tipo.
 */

contract EjerciciosStructs {
    // 📝 Escribe tu código aquí debajo
    struct Libro {
        string titulo;
        uint autorId;
        uint anioPublicacion;
        bool disponible;
    }

    Libro public miLibroFavorito = Libro({
        titulo: "libro 0",
        autorId: 0,
        anioPublicacion: 1999,
        disponible: false
    });
}
