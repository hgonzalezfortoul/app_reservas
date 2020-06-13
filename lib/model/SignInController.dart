import 'package:app_reservar_horario/classes/usuario.dart';
import 'package:app_reservar_horario/views/homePage.dart';
import 'package:flutter/material.dart';

class SignInController {

  void login(String usr, String pass, BuildContext contexto) {
    if (usr == "hernan" && pass == "1234") {
      Usuario usuario =
          new Usuario(nombre: "Hernan", apellido: "Gonzalez", usuario: usr);
      Navigator.pushReplacement(contexto,
          MaterialPageRoute(builder: (contexto) => HomePage(usr: usuario)));
    } else {
      final snackBar = SnackBar(
        content: Container(
            height: 20, child: Text('Usuario o contraseña incorrectos')),
      );
      Scaffold.of(contexto).showSnackBar(snackBar);
    }
  }
}
