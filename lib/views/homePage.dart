import 'package:app_reservar_horario/bloc/cartasRestauranteBloc.dart';
import 'package:app_reservar_horario/bloc/chipsBloc.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/categoria.dart';
import 'package:app_reservar_horario/classes/usuario.dart';
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

  Funciones funciones = new Funciones();
  int _id = 1;
  Usuario _usuario;

  var _categoria = "Mediterraneo";

  var _cargandoMas = false;

  AppBar myApB;
  _HomePageState(this._usuario);

  void dispose() {
    ChipsBloc().dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        setState(() {
          _cargandoMas = true;
        });

        setState(() {
          _cargandoMas = _cartasRestauranteBloc.cargarMas(_categoria);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyCustomDrawer(),
      appBar: myAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /*  Container(
               
                width: double.infinity,
                alignment: Alignment.topCenter,
                height: 60,
                child: myChipsCategorias(),
              ),  */
              Container(
                padding: EdgeInsets.only(bottom: 25),
                height: MediaQuery.of(context).size.height -
                    myAppBar().preferredSize.height,
                child: myCardsRestaurante() ??
                    Container(
                      height: 20,
                      width: 20,
                    ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  AppBar myAppBar() {
    AppBar myApB = AppBar(
      bottom: PreferredSize(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 60,
            child: myChipsCategorias(),
          ),
          preferredSize: Size.fromHeight(60)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black54,
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ],
    );
    return myApB;
  }

  StreamBuilder<List<Restaurante>> myCardsRestaurante() {
    return StreamBuilder(
        stream: _cartasRestauranteBloc.streamRestaurante,
        builder:
            (BuildContext context, AsyncSnapshot<List<Restaurante>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.length.toString());
            //For para añadir cada widget a una lista y devolverlo como una columna
            print("object");
            return Container(
              height: 50,
              child: ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == snapshot.data.length) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Center(
                          
                          child:  CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          height: 290,
                          width: MediaQuery.of(context).size.width,
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
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  children: funciones
                                                      .getValoracion(snapshot
                                                          .data[index]
                                                          .valoracion)),
                                              Container(
                                                child: Text(snapshot.data[index]
                                                            .distancia >=
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
                      );
                    }
                  }),
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  StreamBuilder<List<Categoria>> myChipsCategorias() {
    return StreamBuilder(
      stream: _chipsBloc.listaCategoriaStream,
      builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
        if (snapshot.hasData) {
          print("object");
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
                      _cartasRestauranteBloc.cambiarCategoria(
                        snapshot.data[index].label,
                      );
                      _categoria = snapshot.data[index].label;
                    });
                  },
                ),
              );
            },
          );
        } else {
          return Container(child: CircularProgressIndicator());
        }
      },
    );
  }
}

/*  StreamBuilder<List<Restaurante>> myCardsRestaurante() {
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
            listaCartas.add(Container(
                height: _cargandoMas ? 50.0 : 0.0,
                color: Colors.transparent,
                child: Center(
                  child: new CircularProgressIndicator(),
                )));
            return new Column(
              children: listaCartas,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  } */
