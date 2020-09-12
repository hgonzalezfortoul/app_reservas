import 'package:app_reservar_horario/classes/Cita.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/restauranteDetallePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservasPage extends StatefulWidget {
  final Usuario usuario;

  ReservasPage({this.usuario});

  @override
  _ReservasPageState createState() => _ReservasPageState(this.usuario);
}

class _ReservasPageState extends State<ReservasPage> {
  var _usuario;
  var _diaHoy;
  var _calendarioController = CalendarController();
  List<Cita> listaCitas;
  List<dynamic> _selectedEvents;
  Map<DateTime, List<dynamic>> _eventos;
  GlobalKey _calendarKey;
  _ReservasPageState(Usuario usuario) {
    this._usuario = usuario;
    listaCitas = _usuario.citas;

    _calendarKey = new GlobalKey();
  }

  @override
  Future<void> initState() {
    super.initState();
    _eventos = {};

    initEventos();
  }

  initEventos() async {
    var fecha;
    var fechaInicio = new DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12);
    for (Cita item in _usuario.citas) {
      //En el if se recoge todos los elementos de una fecha, solo entra si la fecha es diferente
      if (fecha != item.fecha) {
        fecha = item.fecha;
        //Fecha - Lista de elementos filtrado por fecha
        print(fecha == fechaInicio);
        _eventos[item.fecha] =
            _usuario.citas.where((element) => element.fecha == fecha).toList();
      }
    }
    _selectedEvents = _usuario.citas
        .where((element) => element.fecha == fechaInicio)
        .toList();
  }

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
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                /*  Container(
                                   width: double.maxFinite,
                                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                   padding: EdgeInsets.all(0),
                                   child: Text(
                                     'Reservas',
                                     style: TextStyle(
                                       fontSize: 35,
                                       fontFamily: 'Poppins',
                                     ),
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
                                 ), */
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  color: MyColors().colorGrisClaro,
                  child: TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    formatAnimation: FormatAnimation.slide,
                    events: _eventos,
                    availableGestures: AvailableGestures.horizontalSwipe,
                    
                    onDaySelected: (dia, events) {
                      setState(() {
                        print(events.toList());
                        _selectedEvents = events;
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
                      CalendarFormat.week: 'Semana'
                    },
                  ),
                ),
                //Imprime los elementos
                ..._selectedEvents.map((event) => GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              color: _estadoColores(event.estado),
                              margin: EdgeInsets.only(right: 20),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(event.restaurante.nombre),
                                SizedBox(height: 10),
                                Text(event.fecha.day.toString() +
                                    '/' +
                                    event.fecha.month.toString() +
                                    '/' +
                                    event.fecha.year.toString()),
                                SizedBox(height: 10),
                                Text(event.hora),
                                SizedBox(height: 10),
                                Text(event.personas.toString())
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Datos de la reserva'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                actionsOverflowButtonSpacing: 0,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Restaurante: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(event.restaurante.nombre)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Fecha: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(event.fecha.day.toString() +
                                            '/' +
                                            event.fecha.month.toString() +
                                            '/' +
                                            event.fecha.year.toString())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Hora: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(event.hora)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Estado: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(event.estado + " "),
                                        Container(
                                          width: 5,
                                          height: 15,
                                          color: _estadoColores(event.estado),
                                          margin: EdgeInsets.only(right: 20),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'VOLVER',
                                        style: TextStyle(
                                          color: MyColors().colorGris,
                                        ),
                                      )),
                                  FlatButton(
                                      onPressed: () {
                                         setState(() {
                                                        });
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                title: Text(
                                                    '¿Seguro que quieres anular esta reserva?'),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'NO',
                                                        style: TextStyle(
                                                            color: MyColors()
                                                                .colorPrimario),
                                                      )),
                                                  FlatButton(
                                                      onPressed: () async {
                                                        _usuario.citas
                                                            .removeWhere(
                                                                (item) =>
                                                                    item ==
                                                                    event);
                                                        _selectedEvents
                                                            .removeWhere(
                                                                (element) =>
                                                                    element ==
                                                                    event);

                                                         _eventos.removeWhere(
                                                              (key, value) =>
                                                                  value ==
                                                                  event);
                                                        setState(() {
                                                        });
                                                        
                                                        Navigator.pop(context, true);
                                                      },
                                                      child: Text(
                                                        'SI',
                                                        style: TextStyle(
                                                            color: MyColors()
                                                                .colorPrimario),
                                                      ))
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'ANULAR CITA',
                                        style: TextStyle(
                                            color: MyColors().colorPrimario,
                                            fontWeight: FontWeight.w900),
                                      ))
                                ],
                              );
                            });
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _estadoColores(estado) {
    switch (estado) {
      case 'Pendiente':
        return Colors.yellow[600];
        break;
      case 'Confirmado':
        return Colors.green;
        break;

      case 'Rechazado':
        return Colors.red;
        break;
    }
  }
}
