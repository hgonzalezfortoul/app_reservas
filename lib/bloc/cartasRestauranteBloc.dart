import 'dart:async';

import 'package:app_reservar_horario/classes/Carta.dart';
import 'package:app_reservar_horario/classes/Plato.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';

class CartasRestauranteBloc {
  List<Restaurante> listaR = new List<Restaurante>();
  static List<Plato> listaPlato = [
    Plato("Plato1", 5.2),
    Plato("Plato2", 5.6),
    Plato("Plato3", 8.5),
    Plato("Plato4", 2.6)
  ];
  static Carta carta1 = Carta("Carta1", listaPlato);
  static List<Plato> listaPlato2 = [
    Plato("Plato1", 5.45),
    Plato("Plato2", 55.6),
    Plato("Plato3", 8.12),
    Plato("Plato4", 42.36)
  ];
  static Carta carta2 = Carta("Carta2", listaPlato2);

  static List<Carta> listaCartas1 = [carta1, carta2];
  List<Restaurante> listaRestaurante = [
    Restaurante(
        nombre: "La Rollerie",
        distancia: 204.56,
        valoracion: 5,
        cartas: listaCartas1,
        categoria: "Internacional"),
    Restaurante(
        nombre: "Mr Lupin",
        distancia: 556.40,
        valoracion: 4,
        cartas: listaCartas1,
        categoria: "Italiana"),
    Restaurante(
        nombre: "Gramabarr",
        distancia: 150.65,
        valoracion: 3,
        cartas: listaCartas1,
        categoria: "Venezolana"),
    Restaurante(
        nombre: "Lara Grilll",
        distancia: 687.78,
        valoracion: 2,
        cartas: listaCartas1,
        categoria: "Venezolana"),
  ];

  //Stream Controller
  StreamController<List<Restaurante>> streamControllerRestaurante =
      StreamController<List<Restaurante>>();

  //Streams y Sinks
  Stream<List<Restaurante>> get streamRestaurante =>
      streamControllerRestaurante.stream;
  StreamSink<List<Restaurante>> get sinkRestaurante =>
      streamControllerRestaurante.sink;

  CartasRestauranteBloc() {
    cambiarCategoria("Mediterraneo");
  }

  void cambiarCategoria(String label) {
    listaR = new List<Restaurante>();
    switch (label) {
      case "Internacional":
        print("Entro Internacional" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Internacional") {
            listaR.add(item);
          }
        }
        break;
      case "Italiana":
        print("Entro Italiana" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Italiana") {
            listaR.add(item);
          }
        }
        break;
      case "Venezolana":
        print("Entro Venezolana" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Venezolana") {
            listaR.add(item);
          }
        }
        break;
      case "Mediterraneo":
        print("Entro Mediterraneo" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Mediterraneo") {
            listaR.add(item);
          }
        }
        break;
      case "Española":
        print("Entro Española" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Española") {
            listaR.add(item);
          }
        }
        break;
      case "Griega":
        print("Entro Griega" + listaRestaurante[0].toString());
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Griega") {
            listaR.add(item);
          }
        }
        break;
    }
    print("Lenght: " + listaR.toString());
    sinkRestaurante.add(listaR);
  }

  bool cargarMas(String categoria) {
    switch (categoria) {
      case "Internacional":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Internacional") {
            listaR.add(item);
          }
        }
        break;
      case "Italiana":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Italiana") {
            listaR.add(item);
          }
        }
        break;
      case "Venezolana":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Venezolana") {
            listaR.add(item);
          }
        }
        break;
      case "Mediterraneo":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Mediterraneo") {
            listaR.add(item);
          }
        }
        break;
      case "Española":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Española") {
            listaR.add(item);
          }
        }
        break;
      case "Griega":
        for (Restaurante item in listaRestaurante) {
          if (item.categoria == "Griega") {
            listaR.add(item);
          }
        }
        break;
    }
    print("Lenght: " + listaR.length.toString());
    sinkRestaurante;
    return false;
  }
}
