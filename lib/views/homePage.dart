import 'package:app_reservar_horario/bloc/chipsBloc.dart';
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
                  Container(
                    padding: EdgeInsets.only(bottom: 10, top: 10 ),
                    height: 290,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 220,
                          color: Colors.blue,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nombre del Restaurante",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.grey,),
                                            Icon(Icons.star, color: Colors.grey,)
                                          ],
                                        ),
                                        Container(
                                          child: Text("750 m"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          right: 50,
                          child: MaterialButton(
                            height: 55,
                            minWidth: 10,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Icon(
                              Icons.label_outline,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),Container(
                    padding: EdgeInsets.only(bottom: 10, top: 10 ),
                    height: 290,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 220,
                          color: Colors.blue,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nombre del Restaurante",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.yellow,),
                                            Icon(Icons.star, color: Colors.grey,),
                                            Icon(Icons.star, color: Colors.grey,)
                                          ],
                                        ),
                                        Container(
                                          child: Text("750 m"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          right: 50,
                          child: MaterialButton(
                            height: 55,
                            minWidth: 10,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Icon(
                              Icons.label_outline,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
