import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:flutter/material.dart';

class Usuario {
  String _nombre, _apellido, _correo, _image;
  List<Cita> _citas;
  List<Restaurante> _favoritos;

  Usuario(
      {@required String nombre,
      @required String apellido,
      @required String correo,
      String image,
      List<Cita> citas,
      List<Restaurante> favoritos}) {
    this._nombre = nombre;
    this._apellido = apellido;
    this._correo = correo;
    this._citas = citas;
    this._favoritos = favoritos;
    this._image = image;
  }

  //Getters
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get correo => _correo;
  String get image => _image;
  List<Cita> get citas => _citas;
  List<Restaurante> get favoritos => _favoritos;

  //Setter
  set nombre(nombre) {
    this._nombre = nombre;
  }

  set apellido(apellido) {
    this._apellido = apellido;
  }

  set correo(correo) {
    this._correo = correo;
  }

  set image(image) {
    this._image = image;
  }

  set cita(cita) {
    this._citas = cita;
  }

  set favoritos(favoritos) {
    this._favoritos = favoritos;
  }
}
