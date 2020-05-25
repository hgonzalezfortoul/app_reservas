import 'package:app_reservar_horario/bloc/cartasRestauranteBloc.dart';
import 'package:app_reservar_horario/classes/restaurante.dart';
import 'package:flutter/material.dart';

class CartasRestaurante extends StatefulWidget {
  CartasRestaurante({Key key}) : super(key: key);

  @override
  _CartasRestauranteState createState() => _CartasRestauranteState();
}

class _CartasRestauranteState extends State<CartasRestaurante> {
  CartasRestauranteBloc cartasRestauranteBloc = CartasRestauranteBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cartasRestauranteBloc.streamRestaurante,
        builder:
            (BuildContext context, AsyncSnapshot<List<Restaurante>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> listaCartas = List();
            //For para añadir cada widget a una lista y devolverlo como una columna
            for (var index = 0; index < snapshot.data.length; index++) {
              listaCartas.add(GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  height: 290,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 220,
                        color: Colors.blue,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        right: 20,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${snapshot.data[index].nombre}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 22),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                          children: getValoracion(
                                              snapshot.data[index].valoracion)),
                                      Container(
                                        child: Text(snapshot
                                                    .data[index].distancia >=
                                                1000
                                            ? "${(snapshot.data[index].distancia / 1000).toStringAsFixed(2)} km"
                                            : "${snapshot.data[index].distancia} m"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        right: 50,
                        child: MaterialButton(
                          height: 55,
                          minWidth: 10,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Icon(
                            Icons.label_outline,
                            size: 30,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            }
            return new Column(
              children: listaCartas,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  getValoracion(int valoracion) {
    int estrellasRestantes = 5 - valoracion;
    List<Widget> listaEstrellas = List();
    for (var i = 0; i < valoracion; i++) {
      listaEstrellas.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    for (var i = 0; i < estrellasRestantes; i++) {
      listaEstrellas.add(Icon(
        Icons.star,
        color: Colors.grey,
      ));
    }
    return listaEstrellas;
  }
}
