import 'package:app_reservar_horario/bloc/cartasRestauranteBloc.dart';
import 'package:app_reservar_horario/bloc/chipsBloc.dart';
import 'package:app_reservar_horario/classes/categoria.dart';
import 'package:app_reservar_horario/classes/restaurante.dart';
import 'package:app_reservar_horario/classes/usuario.dart';
import 'package:app_reservar_horario/components/myCartasRest.dart';
import 'package:app_reservar_horario/components/myChips.dart';
import 'package:app_reservar_horario/components/myDrawer.dart';
import 'package:app_reservar_horario/model/funciones.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'restauranteDetallePage.dart';

class HomePage extends StatefulWidget {
  Usuario usr;
  HomePage({Key key, this.usr}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(usr);
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  CartasRestauranteBloc _cartasRestauranteBloc = CartasRestauranteBloc();
  ChipsBloc _chipsBloc = ChipsBloc();
  double _heightChipsContainer = 60;
  Funciones funciones = new Funciones();
  int _baja = 1, _id = 1;
  Usuario _usuario;

  var _categoria = "Mediterraneo";

  _HomePageState(this._usuario);

  void dispose() {
    ChipsBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyCustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Container(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: double.infinity,
                    height: _heightChipsContainer,
                    child: myChipsCategorias(),
                  ),
                  Flexible(
                    child: NotificationListener(
                      child: ListView(
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              myCardsRestaurante() ??
                                  Container(
                                    child: CircularProgressIndicator(),
                                  ),
                            ],
                          ),
                        ],
                      ),
                      onNotification: (r) {
                        var _direccionScroll =
                            _scrollController.position.userScrollDirection;
                        //Si sube
                        if (_direccionScroll == ScrollDirection.reverse) {
                          //Si sube se coloca la variable baja a 0 para evitar que vuelva a entrar
                          //En el If y evitar que utilice el setState varias veces
                          if (_baja == 1) {
                            _baja = 0;
                            setState(() {
                              _heightChipsContainer = 0;
                            });
                          }
                        }
                        //Si baja
                        else if (_direccionScroll == ScrollDirection.forward) {
                          //Si sube se coloca la variable baja a 1 para evitar que vuelva a entrar
                          //En el If y evitar que utilice el setState varias veces
                          if (_baja == 0) {
                            _baja = 1;
                            setState(() {
                              _heightChipsContainer = 60;
                            });
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  StreamBuilder<List<Restaurante>> myCardsRestaurante() {
    return StreamBuilder(
        stream: _cartasRestauranteBloc.streamRestaurante,
        builder:
            (BuildContext context, AsyncSnapshot<List<Restaurante>> snapshot) {
          if (snapshot.hasData) {
            List<Widget> listaCartas = List();
            print(snapshot.data.length.toString());
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
                              _usuario, snapshot.data[index])));
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

  StreamBuilder<List<Categoria>> myChipsCategorias() {
    return StreamBuilder(
      stream: _chipsBloc.listaCategoriaStream,
      builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ChoiceChip(
                  pressElevation: 5,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 3,
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: _id == snapshot.data[index].id
                          ? Colors.white
                          : Colors.black87),
                  label: Text("${snapshot.data[index].label}"),
                  selected: (_id == snapshot.data[index].id ? true : false),
                  selectedColor: MyColors().colorSecundario,
                  backgroundColor: Colors.white,
                  avatar: null,
                  onSelected: (e) {
                    setState(() {
                      _id = snapshot.data[index].id;
                      _cartasRestauranteBloc.cambiarCategoria(snapshot.data[index].label, );
                    });
                  },
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
