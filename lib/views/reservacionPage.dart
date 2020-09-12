import 'dart:ui';

import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservacionPage extends StatefulWidget {
  Usuario usr;
  Restaurante restaurante;
  ReservacionPage({this.usr, this.restaurante});

  @override
  _ReservacionPageState createState() =>
      _ReservacionPageState(this.usr, this.restaurante);
}

class _ReservacionPageState extends State<ReservacionPage> {
  var _diaHoy = new DateTime.now();
  Usuario _usr;
  Restaurante _restaurante;
  var _personasSeleccionadas = '1';
  var _horaSeleccionada;
  CalendarController _calendarioController = CalendarController();
  var _horaInicio = 6;
  var _horaFin = 13;
  var _horasTotal = 1;
  List<String> listaHoras = new List<String>();

  _ReservacionPageState(usr, restaurante) {
    this._usr = usr;
    this._restaurante = restaurante;
    this._horasTotal = this._horaFin - this._horaInicio;
    for (var i = 0; i <= _horasTotal; i++) {
      listaHoras.add((_horaInicio + i).toString() + ":00");
      listaHoras.add((_horaInicio + i).toString() + ":30");
    }
  }

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
            physics: BouncingScrollPhysics(),
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
                        value: _personasSeleccionadas,
                        iconEnabledColor: MyColors().colorPrimario,
                        iconSize: 24,
                        style: TextStyle(
                            fontSize: 18, color: MyColors().colorGrisOscuro),
                        onChanged: (String newValue) {
                          setState(() {
                            _personasSeleccionadas = newValue;
                          });
                        },
                        items: <String>[
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                _calendario(),
                _diaHoy.weekday != 8 && _diaHoy.weekday != 7
                    ? Container(
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15.0,
                                    mainAxisSpacing: 15.0,
                                    childAspectRatio: 1.8),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 20),
                            itemCount: (_horasTotal) * 2,
                            itemBuilder: (context, index) {
                              _horaInicio++;
                              return MaterialButton(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                height: 10,
                                onPressed: () {
                                  setState(() {
                                    _horaSeleccionada = index;
                                  });
                                },
                                child: Text(listaHoras[index],
                                    style: TextStyle(
                                      color: _horaSeleccionada == index
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                color: _horaSeleccionada == index
                                    ? MyColors().colorPrimario
                                    : MyColors().colorFondo,
                              );
                            }),
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  constraints: BoxConstraints(maxWidth: 600),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      var hora = listaHoras[_horaSeleccionada].split(':');
                      DateTime fecha = new DateTime(
                          _calendarioController.selectedDay.year,
                          _calendarioController.selectedDay.month,
                          _calendarioController.selectedDay.day,
                          int.parse(hora[0]),
                          int.parse(hora[1]));

                      Cita cita = new Cita();
                      cita.fecha = fecha;
                      cita.personas = int.parse(_personasSeleccionadas);
                      cita.restaurante = _restaurante;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  Text('¿Desea realizar la siguiente reserva?'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Personas: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(cita.personas.toString())
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Fecha: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(_calendarioController
                                              .selectedDay.day
                                              .toString() +
                                          '/' +
                                          _calendarioController
                                              .selectedDay.month
                                              .toString() +
                                          '/' +
                                          _calendarioController.selectedDay.year
                                              .toString())
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Hora: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(hora[0] + ':' + hora[1])
                                    ],
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "CANCELAR",
                                    style: TextStyle(
                                        color: MyColors().colorGris),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    var cita = new Cita();
                                    cita.fecha =
                                        _calendarioController.selectedDay;
                                    cita.personas =
                                        int.parse(_personasSeleccionadas);
                                    cita.hora = hora[0] + ':' + hora[1];
                                    cita.usuario = _usr;
                                    cita.restaurante = _restaurante;
                                    cita.estado = 'Pendiente';
                                    _usr.addCita(cita);
                                    Navigator.of(context).pop();
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            actionsOverflowButtonSpacing: 0,
                                            title: Text(
                                                'Su reserva se ha enviado correctamente'),
                                            content: Text(
                                                'El restaurante confirmará su reserva lo antes posible'),
                                            actions: <Widget>[
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'ACEPTAR',
                                                    style: TextStyle(
                                                        color: MyColors()
                                                            .colorPrimario,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ))
                                            ],
                                          );
                                        });
                                  },
                                  child: Text(
                                    "ACEPTAR",
                                    style: TextStyle(
                                        color: MyColors().colorPrimario,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                
                              ],
                            );
                          });
                    },
                    child: Text(
                      "HACER RESERVA",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: MyColors().colorPrimario,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _calendario() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      color: MyColors().colorGrisClaro,
      child: TableCalendar(
        onDaySelected: (dia, events) {
          setState(() {
            print(dia.day.toString() +
                '/' +
                dia.month.toString() +
                '/' +
                dia.year.toString());
            _diaHoy = dia;
          });
        },
        calendarController: _calendarioController,
        startDay: DateTime.now(),
        calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            weekendStyle: TextStyle().copyWith(
              color: MyColors().colorSecundario,
            ),
            selectedColor: MyColors().colorPrimario,
            todayColor: Colors.red[200]),
        initialCalendarFormat: CalendarFormat.week,
        availableCalendarFormats: const {
          CalendarFormat.week: 'Semana',
          CalendarFormat.twoWeeks: '2 Semanas',
          CalendarFormat.month: 'Mes'
        },
      ),
    );
  }
}
