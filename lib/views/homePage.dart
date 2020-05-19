
import 'package:app_reservar_horario/bloc/chipsBloc.dart';
import 'package:app_reservar_horario/components/cartasRestaurante.dart';
import 'package:app_reservar_horario/components/chips.dart';
import 'package:app_reservar_horario/components/topBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void dispose() {
    ChipsBloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MyTopBarWidget(),
            Flexible(
              fit: FlexFit.tight,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: MisCustomChips(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Mas cercanos",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  CartasRestaurante(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
