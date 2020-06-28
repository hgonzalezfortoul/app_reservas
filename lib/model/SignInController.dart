import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/views/homePage.dart';
import 'package:flutter/material.dart';

class SignInController {
  // ignore: missing_required_param
  Restaurante restaurante = Restaurante(
      id: 5,
      nombre: "Lara Grill",
      distancia: 687.78,
      valoracion: 2,
      categoria: "Venezolana",
      imagen: 'assets/img/laragrill.jpg');

  void login(String correo, String pass, BuildContext contexto) {
    if (correo == "hernan" && pass == "1234") {
      Usuario usuario = new Usuario(
          nombre: "Hernan",
          apellido: "Gonzalez",
          correo: correo,
          citas: [Cita(fecha: DateTime.now(), restaurante: restaurante)],
          favoritos: [],
          image: 'assets/img/profile-example.jpg');
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
