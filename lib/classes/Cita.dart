import 'Restaurante.dart';

class Cita {
  Restaurante _restaurante;
  DateTime _fecha;
  int _personas;

  Cita({Restaurante restaurante, DateTime fecha, int personas}) {
    this._restaurante = restaurante;
    this._fecha = fecha;
    this._personas = personas;
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

  get restaurante => this._restaurante;
  get fecha => this._fecha;
  get personas => this._personas;
}
