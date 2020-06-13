import 'Plato.dart';

class Carta {
  String _nombre;
  List<Plato> _platos;

  Carta(nombre, platos) {
    this._platos = platos;
    this._nombre = nombre;
  }

  get platos => _platos;
  get nombre => _nombre;
  
  set platos(platos) {
    this._platos = platos;
  }

  set nombre(nombre) {
    this._nombre = nombre;
  }
}
