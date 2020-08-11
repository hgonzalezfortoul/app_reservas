import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservasPage extends StatelessWidget {
  final Usuario usuario;

  ReservasPage({this.usuario});
  @override
  Widget build(BuildContext context) {
    String _strFecha = DateFormat('d MMM y').format(new DateTime.now());
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
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                padding: EdgeInsets.all(0),
                child: Text(
                  'Reservas',
                  style: TextStyle(fontSize: 35, fontFamily: 'Poppins', ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                padding: EdgeInsets.all(0),
                child: Text(
                  _strFecha,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'HindGuntur',
                      fontWeight: FontWeight.w500,
                      color: MyColors().colorGris),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    24 -
                    95,
                width: MediaQuery.of(context).size.width,
                child: usuario.citas.length > 0
                    ? ListView.builder(
                        padding: EdgeInsets.only(bottom: 25),
                        itemCount: usuario.citas.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Cita c = usuario.citas[index];
                          return Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
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
                                    Text(usuario
                                        .citas[index].restaurante.nombre),
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
                        })
                    : Center(
                        child: Text('Aun no tienes reservas'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
