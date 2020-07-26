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
  Usuario _usr;
  Restaurante _restaurante;
  var _selectedLocation = '1';
  var _horaSeleccionada;
  CalendarController _calendarioController = CalendarController();

  _ReservacionPageState(this._usr, this._restaurante);

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
                Container(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 1.8),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: 20,
                      itemBuilder: (context, index) {
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
                          child: Text("00:00", style: TextStyle(color: _horaSeleccionada == index?Colors.white:Colors.black,)),
                          color: _horaSeleccionada == index
                              ? MyColors().colorPrimario
                              : MyColors().colorFondo,
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  constraints: BoxConstraints(maxWidth: 600),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
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
          print(dia.day.toString() +
              '/' +
              dia.month.toString() +
              '/' +
              dia.year.toString());
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
