import 'package:app_reservar_horario/main.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/signinPage.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({Key key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  Color _colorPrimario = MyColors().colorPrimario;
  @override
  Widget build(BuildContext context) {
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
                      'assets/img/profile-example.jpg',
                    ),
                    radius: 45,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Nombre Apellido",
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
          Container(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                "Favoritos",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              leading: Container(
                child: Icon(
                  Icons.favorite,
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
}
