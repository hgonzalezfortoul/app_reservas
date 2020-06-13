class Plato {
  String _nombre;
  double _precio;

  Plato(nomb, prec) {
    this._nombre = nomb;
    this._precio = prec;
  }

  get nombre => this._nombre;
  get precio => this._precio;

  set nombre(nombre) {
    this._nombre = nombre;
  }

  set precio(precio) {
    this._precio = precio;
  }
}
