import 'package:app_reservar_horario/bloc/cartasRestauranteBloc.dart';
import 'package:app_reservar_horario/classes/restaurante.dart';
import 'package:app_reservar_horario/classes/usuario.dart';
import 'package:app_reservar_horario/model/funciones.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/views/restauranteDetallePage.dart';
import 'package:flutter/material.dart';

class CartasRestaurante extends StatelessWidget {
  Usuario usuario;
  String categoria;
  Funciones funciones;
  CartasRestauranteBloc cartasRestauranteBloc;
  CartasRestaurante({Key key, this.usuario, this.categoria, this.cartasRestauranteBloc, this.funciones}) : super(key: key);

  Usuario usr;

  

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
                                          children: funciones.getValoracion(
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
                            Icons.favorite,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      SlideRightRoute(
                          page: RestauranteDetallePage(
                              usr, snapshot.data[index])));
                },
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
}
