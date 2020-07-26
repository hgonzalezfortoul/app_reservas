import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class ReservacionPage extends StatefulWidget {
  Usuario usr;
  Restaurante restaurante;
  ReservacionPage({this.usr, this.restaurante});

  @override
  _ReservacionPageState createState() =>
      _ReservacionPageState(this.usr, this.restaurante);
}

class _ReservacionPageState extends State<ReservacionPage> {
  Usuario _usr;
  Restaurante _restaurante;
  _ReservacionPageState(this._usr, this._restaurante);
  var _selectedLocation = 'One';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(_restaurante.nombre,
                style: TextStyle(
                  color: Colors.black,
                )),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, true);
                });
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Personas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                Container(
                  height: 50,
                  child: InputDecorator(
                    expands: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors().colorPrimario, width: 2),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedLocation,
                        iconEnabledColor: MyColors().colorPrimario,
                        iconSize: 24,
                        style: TextStyle(
                            fontSize: 18, color: MyColors().colorGrisOscuro),
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Tree', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
