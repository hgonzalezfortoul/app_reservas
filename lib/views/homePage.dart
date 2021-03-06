import 'package:app_reservar_horario/bloc/cartasRestauranteBloc.dart';
import 'package:app_reservar_horario/bloc/chipsBloc.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/classes/categoria.dart';
import 'package:app_reservar_horario/components/myDrawer.dart';
import 'package:app_reservar_horario/model/funciones.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';
import 'perfilPage.dart';
import 'reservasPage.dart';
import 'restauranteDetallePage.dart';

class HomePage extends StatefulWidget {
  final Usuario usr;
  HomePage({Key key, this.usr}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(usr);

  void cambios() {
    _HomePageState.noParametros().setState(() {});
  }
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  CartasRestauranteBloc _cartasRestauranteBloc = CartasRestauranteBloc();
  ChipsBloc _chipsBloc = ChipsBloc();
  Funciones funciones = new Funciones();
  int _id = 1;
  Usuario _usuario;
  Color _colorPrimario = MyColors().colorPrimario;

  var _categoria = "Mediterraneo";

  AppBar myApB;
  _HomePageState(this._usuario);
  _HomePageState.noParametros();
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
        setState(() {});

        setState(() {
          _cartasRestauranteBloc.cargarMas(_categoria);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Entro home");
    return Scaffold(
      drawer: myDrawer(context),
      appBar: myAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
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

  Drawer myDrawer(BuildContext context) {
    return Drawer(
        child: Container(
      color: _colorPrimario,
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      _usuario.image,
                    ),
                    radius: 45,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      _usuario.nombre + " " + _usuario.apellido,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: _colorPrimario,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/img/DrawerBg.png",
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.pop(context, true);
                Navigator.push(
                        context,
                        SlideRightRoute(
                            page: PerfilPage(usuario: this._usuario)))
                    .then((value) {
                  setState(() {});
                });
              },
              title: Text(
                "Perfil",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              leading: Container(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 22,
                ),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.pop(context, true);

                Navigator.push(
                    context,
                    SlideRightRoute(
                        page: ReservasPage(usuario: this._usuario)));
              },
              title: Text(
                "Reservas",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              leading: Container(
                child: Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                  size: 22,
                ),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.4,
              minHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            child: SizedBox(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.white70,
              thickness: 1,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              title: Text(
                "Cerrar sesion",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              leading: Container(
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 22,
                ),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
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
            //For para añadir cada widget a una lista y devolverlo como una columna

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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Center(
                          child: CircularProgressIndicator(),
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
                              Image(
                                loadingBuilder: (BuildContext context,
                                    Widget child, ImageChunkEvent imgLoading) {
                                  if (imgLoading == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                                height: 220,
                                width: MediaQuery.of(context).size.width,
                                image: AssetImage(
                                  "${snapshot.data[index].imagen}",
                                ),
                                fit: BoxFit.cover,
                              ),
                              //INFO RESTAURANTE
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
                                  onPressed: () {
                                    setState(() {
                                      if (this
                                          ._usuario
                                          .favoritos
                                          .contains(snapshot.data[index])) {
                                        this
                                            ._usuario
                                            .favoritos
                                            .remove(snapshot.data[index]);
                                      } else {
                                        this
                                            ._usuario
                                            .favoritos
                                            .add(snapshot.data[index]);
                                      }
                                    });
                                  },
                                  child: _usuario.favoritos
                                          .contains(snapshot.data[index])
                                      ? Icon(
                                          Icons.bookmark,
                                          size: 30,
                                          color: MyColors().colorPrimario,
                                        )
                                      : Icon(
                                          Icons.bookmark_border,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await Navigator.push(
                              context,
                              SlideRightRoute(
                                  page: RestauranteDetallePage(
                                      _usuario, snapshot.data[index])));

                          setState(() {});
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
