import 'Restaurante.dart';

class Cita {
  Restaurante _restaurante;
  DateTime _fecha;

  Cita({Restaurante restaurante, DateTime fecha}) {
    this._restaurante = restaurante;
    this._fecha = fecha;
  }

  set restaurante(restaurante) {
    this._restaurante = restaurante;
  }


  set fecha(fecha) {
    this._fecha = fecha;
  }

  get restaurante => this._restaurante;
  get fecha => this._fecha;
}
