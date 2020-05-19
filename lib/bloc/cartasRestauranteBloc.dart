import 'dart:async';
import 'package:app_reservar_horario/model/restaurante.dart';

class CartasRestauranteBloc {
  List<Restaurante> listaRestaurante = [
    Restaurante(nombre: "La Rollerie", distancia: 204.56, valoracion: 5),
    Restaurante(nombre: "Mr Lupin", distancia: 556.40, valoracion: 4),
    Restaurante(nombre: "Gramabar", distancia: 1500.65, valoracion: 3),
    Restaurante(nombre: "Lara Grill", distancia: 6870.78, valoracion: 2),
  ];

  //Stream Controller
  StreamController<List<Restaurante>> streamControllerRestaurante =
      StreamController();

  //Streams y Sinks
  Stream<List<Restaurante>> get streamRestaurante =>
      streamControllerRestaurante.stream;
  StreamSink<List<Restaurante>> get sinkRestaurante =>
      streamControllerRestaurante.sink;

  CartasRestauranteBloc() {
    streamControllerRestaurante.add(listaRestaurante);
  }
}
