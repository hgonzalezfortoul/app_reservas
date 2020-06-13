import 'package:app_reservar_horario/classes/Carta.dart';
import 'package:flutter/material.dart';

class Restaurante {
  double _distancia;
  int _valoracion, _numeroTelefono;
  String _imagen, _nombre, _direccion, _categoria;
  List<Carta> _cartas;

  //Constructor
  Restaurante({
    @required nombre,
    @required distancia,
    @required valoracion,
    @required cartas,
    @required categoria,
  }) {
    this._nombre = nombre;
    this._distancia = distancia;
    this._valoracion = valoracion;
    this._cartas = cartas;
    this._categoria = categoria;
  }

  //Getter
  String get nombre => _nombre;
  double get distancia => _distancia;
  int get valoracion => _valoracion;
  List<Carta> get cartas => _cartas;
  String get categoria => _categoria;

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

  set cartas(carta) {
    this._cartas = carta;
  }

  set categoria(categoria) {
    this._categoria = categoria;
  }
}
