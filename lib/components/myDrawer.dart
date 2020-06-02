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
      color: _colorPrimario,
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(color: Colors.red),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
                minHeight: MediaQuery.of(context).size.height * 0.3,
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
                },
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
      ),
    ));
  }
}
