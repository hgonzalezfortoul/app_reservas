import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class ReservasPage extends StatelessWidget {
  final Usuario usuario;

  ReservasPage({this.usuario});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 25),
                itemCount: usuario.citas.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Cita c = usuario.citas[index];
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyColors().colorFondo,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0.0,
                            color: Colors.grey,
                            offset: Offset(0.0, 3.0), //(x,y)
                            blurRadius: 3.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 2,
                          height: 90,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(usuario.citas[index].restaurante.nombre),
                            SizedBox(height: 10),
                            Text(c.fecha.day.toString() +
                                '/' +
                                c.fecha.month.toString() +
                                '/' +
                                c.fecha.year.toString()),
                            SizedBox(height: 10),
                            Text(c.hora),
                            SizedBox(height: 10),
                            Text(c.personas.toString())
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
