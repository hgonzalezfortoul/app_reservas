import 'dart:async';

import 'package:app_reservar_horario/model/categoria.dart';

class ChipsBloc {
  List<Categoria> listaCategorias = [
    Categoria(id: 1, label: "Mediterraneo"),
    Categoria(id: 2, label: "Italiano"),
    Categoria(id: 3, label: "Internacional"),
    Categoria(id: 4, label: "Española"),
    Categoria(id: 5, label: "Griega"),
    Categoria(id: 6, label: "Venezolana")
  ];

  //? Declaracion de StreamsController
  StreamController<List<Categoria>> streamController = StreamController();
  StreamController<Categoria> streamControllerCategoria = StreamController();

  //!Stream y Sink controller
  Stream<List<Categoria>> get listaCategoriaStream => streamController.stream;
  StreamSink<List<Categoria>> get listaCategoriaSink => streamController.sink;

  //!Stream y Sink categoria
  Stream<Categoria> get streamCategoria => streamControllerCategoria.stream;
  StreamSink<Categoria> get sinkCategoria => streamControllerCategoria.sink;

  ChipsBloc() {
    streamController.add(listaCategorias);
  }

  void dispose() {
    streamController.close();
    streamControllerCategoria.close();
  }
}
