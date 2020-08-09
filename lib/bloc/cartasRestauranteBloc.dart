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
        id: 1,
        nombre: "La Rollerie",
        distancia: 204.56,
        valoracion: 5,
        cartas: listaCartas1,
        categoria: "Internacional",
        imagen: 'assets/img/la-rollerie.jpg', direccion: "Calle nombre de la calle, numero 1"),
    Restaurante(
        id: 2,
        nombre: "El Mediterraneo",
        distancia: 225.26,
        valoracion: 5,
        cartas: listaCartas1,
        categoria: "Mediterraneo",
        imagen: 'assets/img/mediterraneo.jpg', direccion: "Calle nombre de la calle, numero 1"),
    Restaurante(
        id: 3,
        nombre: "Mr Lupin",
        distancia: 556.40,
        valoracion: 4,
        cartas: listaCartas1,
        categoria: "Italiana",
        imagen: 'assets/img/mr-lupin.jpg', direccion: "Calle nombre de la calle, numero 1"),
    Restaurante(
        id: 4,
        nombre: "Gramabar",
        distancia: 150.65,
        valoracion: 3,
        cartas: listaCartas1,
        categoria: "Venezolana",
        imagen: 'assets/img/gramabar.jpg', direccion: "Calle nombre de la calle, numero 1"),
    Restaurante(
        id: 5,
        nombre: "Lara Grill",
        distancia: 687.78,
        valoracion: 2,
        cartas: listaCartas1,
        categoria: "Venezolana",
        imagen: 'assets/img/laragrill.jpg', direccion: "Calle nombre de la calle, numero 1"),
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
    sinkRestaurante;
    return false;
  }

  void dispose() {
    streamControllerRestaurante.close();
  }
}
