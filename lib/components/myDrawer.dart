import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({Key key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  Color _colorPrimario = MyColors().colorPrimario;
  Color _colorSecundario = MyColors().colorSecundario;
  Color _colorFondo = MyColors().colorFondo;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.all(20),
      color: _colorPrimario,
      child: Expanded(
              child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            height: 100,
            child: Icon(Icons.https),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
          ),
          ListTile(
            title: Text(
              "Perfil",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Container(
              child: Icon(Icons.person, color: Colors.white),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Reservas",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Container(
              child: Icon(Icons.restaurant_menu, color: Colors.white),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Favoritos",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            leading: Container(
              child: Icon(Icons.favorite, color: Colors.white),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
          Container(color: Colors.white,
            child: ListTile(
              title: Text(
                "Cerrar sesion",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              leading: Container(
                child: Icon(Icons.exit_to_app, color: Colors.white),
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
}
