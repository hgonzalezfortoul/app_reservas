import 'package:app_reservar_horario/classes/Plato.dart';
import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/model/funciones.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/homePage.dart';
import 'package:app_reservar_horario/views/reservacionPage.dart';
import 'package:flutter/material.dart';

class RestauranteDetallePage extends StatefulWidget {
  final Usuario _usr;
  final Restaurante _restaurante;

  RestauranteDetallePage(this._usr, this._restaurante);

  @override
  _RestauranteDetallePageState createState() =>
      _RestauranteDetallePageState(this._usr, this._restaurante);
}

class _RestauranteDetallePageState extends State<RestauranteDetallePage> {
  int _posicion = 0;
  final Usuario usr;
  final Restaurante restaurante;
  Funciones funciones = new Funciones();

  _RestauranteDetallePageState(this.usr, this.restaurante);

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
                
               setState(() {
                 Navigator.pop(context, true);
               });
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget._restaurante.nombre,
                    style: TextStyle(
                      color: MyColors().colorGrisOscuro,
                      fontSize: 35,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent imgLoading) {
                      if (imgLoading == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(
                      restaurante.imagen,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: MyColors().colorGris,
                          size: 25,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            "Direccion h h h h hhhhhhhh hhhhhhjhjhj hhhhh hhhhhhhhhhhhhhh",
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 16,
                              color: MyColors().colorGris,
                              fontFamily: "HindGuntur",
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: funciones
                            .getValoracion(widget._restaurante.valoracion),
                      ),
                      Text("(data)",
                          style: TextStyle(
                              fontSize: 16, color: MyColors().colorGris))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use ",
                    style: TextStyle(
                        fontSize: 16, fontFamily: "HindGuntur", height: 1.5),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Carta",
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: "HindGuntur",
                          fontWeight: FontWeight.w500),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                    itemCount: restaurante.cartas.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ChoiceChip(
                          pressElevation: 5,
                          labelPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          elevation: 3,
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: index == _posicion
                                  ? Colors.white
                                  : Colors.black87),
                          label: Text(restaurante.cartas[index].nombre),
                          selected: (index == _posicion ? true : false),
                          selectedColor: MyColors().colorSecundario,
                          backgroundColor: Colors.white,
                          avatar: null,
                          onSelected: (e) {
                            setState(() {
                              _posicion = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: columna(restaurante.cartas[_posicion].platos),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      constraints: BoxConstraints(maxWidth: 60),
                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {
                          setState(() {
                            if (this.usr.favoritos.contains(restaurante)) {
                              this.usr.favoritos.remove(restaurante);
                            } else {
                              this.usr.favoritos.add(restaurante);
                            }
                          });
                        },
                        child: usr.favoritos.contains(restaurante)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      width: MediaQuery.of(context).size.width * 0.7,
                      constraints: BoxConstraints(maxWidth: 600),
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {
                         Navigator.push(
                              context,
                              SlideRightRoute(
                                  page: ReservacionPage(usr: usr,restaurante: restaurante,)));

                          setState(() {
                            
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  columna(platos) {
    devolverFilas(platos) {
      List<Widget> listaP = new List<Widget>();
      for (Plato item in platos) {
        listaP.add(Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: MyColors().colorGrisNoTanClaro))),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.nombre,
                style: TextStyle(fontSize: 18),
              ),
              Text(item.precio.toString() + "€", style: TextStyle(fontSize: 18))
            ],
          ),
        ));
      }
      return listaP;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: devolverFilas(platos),
    );
  }
}
