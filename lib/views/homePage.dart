import 'package:app_reservar_horario/bloc/chipsBloc.dart';
import 'package:app_reservar_horario/classes/usuario.dart';
import 'package:app_reservar_horario/components/myCartasRest.dart';
import 'package:app_reservar_horario/components/myChips.dart';
import 'package:app_reservar_horario/components/myDrawer.dart';
import 'package:app_reservar_horario/components/myTopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  Usuario usr;
  HomePage({Key key, this.usr}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(usr);
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _heightChipsContainer = 60;
  int _baja = 0;
  Usuario _usuario;

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
        title: Text(
          _usuario.nombre + " " + _usuario.apellido,
          style: TextStyle(color: Colors.black54),
        ),
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
                    child: MisCustomChips(),
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
                              CartasRestaurante(),
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
                            print("Prueba");
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
                            print("Prueba 2");
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
}
