import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/registrarIndivualPage.dart';
import 'package:flutter/material.dart';

class RegistrarsePage extends StatelessWidget {
  const RegistrarsePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/bgRegistrarse.png"),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 600,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.55,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: MyColors().colorPrimario,
                            size: 80,
                          ),
                          Text("Empresa", style: TextStyle(fontSize: 24))
                        ],
                      ),
                    ),
                    elevation: 3,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 600,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.55,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(context,
                            SlideRightRoute(page: RegistrarIndividualPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: MyColors().colorPrimario,
                            size: 80,
                          ),
                          Text(
                            "Individual",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),
                    elevation: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
