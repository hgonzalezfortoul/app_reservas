import 'package:flutter/material.dart';

class Restaurante {
  String _nombre;
  double _distancia;
  int _valoracion;
  String _imagen;

  //Constructor
  Restaurante({@required nombre, @required distancia, @required valoracion}) {
    this._nombre = nombre;
    this._distancia = distancia;
    this._valoracion = valoracion;
  }

  //Getter
  String get nombre => _nombre;
  double get distancia => _distancia;
  int get valoracion => _valoracion;

  //Setter

  set nombre(nombre) {
    this._nombre = nombre;
  }

  set distancia(distancia) {
    this._distancia = distancia;
  }

  set valoracion(valoracion) {
    this._valoracion = valoracion;
  }
}
