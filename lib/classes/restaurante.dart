import 'package:app_reservar_horario/classes/Carta.dart';
import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:flutter/material.dart';

class Restaurante {
  double _distancia;
  int _valoracion, _numeroTelefono, _id;
  String _imagen, _nombre, _direccion, _categoria;
  List<Carta> _cartas;
  List<Cita> _citas;
  //Constructor


  Restaurante(
      {@required id,
      @required nombre,
      @required distancia,
      
      @required valoracion,
      @required cartas,
      @required categoria,
      @required imagen,
      citas,
      @required direccion}) {
    this._id = id;
    this._nombre = nombre;
    this._distancia = distancia;
    this._valoracion = valoracion;
    this._cartas = cartas;
    this._categoria = categoria;
    this._imagen = imagen;
    this._citas=citas;
    this._direccion=direccion;
  }

  Restaurante.ini();

  //Getter
  String get nombre => _nombre;
  double get distancia => _distancia;
  int get valoracion => _valoracion;
  int get id => _id;
  List<Carta> get cartas => _cartas;
  String get categoria => _categoria;
  String get imagen => _imagen;
  List<Cita> get citas => _citas;
  String get direccion => _direccion;

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

  set id(id) {
    this._id = id;
  }

  set cartas(carta) {
    this._cartas = carta;
  }

  set categoria(categoria) {
    this._categoria = categoria;
  }

  set imagen(imagen) {
    this._imagen = imagen;
  }

  set cita(cita){
    this._citas=cita;

  }

  set direccion(direccion){
    this._direccion=direccion;
  }

  addCita(valor){
    this._citas.add(valor);
  }
  

  
}
