import 'package:app_reservar_horario/classes/Usuario.dart';

import 'Restaurante.dart';

class Cita {
  Restaurante _restaurante;
  DateTime _fecha;
  int _personas;
  String _hora;
  Usuario _usuario;
  String _estado;

  Cita(
      {Restaurante restaurante,
      DateTime fecha,
      int personas,
      String hora,
      Usuario usuario,
      String estado}) {
    this._restaurante = restaurante;
    this._fecha = fecha;
    this._personas = personas;
    this._hora = hora;
    this._usuario = usuario;
    this._estado = estado;
  }

  set restaurante(restaurante) {
    this._restaurante = restaurante;
  }

  set fecha(fecha) {
    this._fecha = fecha;
  }

  set personas(personas) {
    this._personas = personas;
  }

  set hora(hora) {
    this._hora = hora;
  }

  set usuario(usuario) {
    this._usuario = usuario;
  }

  set estado(estado) {
    this._estado = estado;
  }

  get restaurante => this._restaurante;
  get fecha => this._fecha;
  get personas => this._personas;
  get hora => this._hora;
  get usuario => this._usuario;
  get estado => this._estado;
}
