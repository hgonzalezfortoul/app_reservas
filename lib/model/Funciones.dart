import 'package:flutter/material.dart';

class Funciones {
  Funciones() {}
  getValoracion(int valoracion) {
    int estrellasRestantes = 5 - valoracion;
    List<Widget> listaEstrellas = List();
    for (var i = 0; i < valoracion; i++) {
      listaEstrellas.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    for (var i = 0; i < estrellasRestantes; i++) {
      listaEstrellas.add(Icon(
        Icons.star,
        color: Colors.grey,
      ));
    }
    return listaEstrellas;
  }
}
