import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/model/Funciones.dart';
import 'package:app_reservar_horario/pageTransactions/slideRight.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/restauranteDetallePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PerfilPage extends StatefulWidget {
  final Usuario usuario;
  PerfilPage({this.usuario});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              setState(() {
                Navigator.pop(context, true);
              });
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black87,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black87,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 8.0, top: 10, left: 20, right: 20),
                  padding: EdgeInsets.only(bottom: 30, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.0,
                        color: Colors.grey,
                        offset: Offset(0.0, 3.0), //(x,y)
                        blurRadius: 3.0,
                      )
                    ],
                    color: MyColors().colorFondo,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 10,
                                style: BorderStyle.solid,
                                color: Colors.white),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  spreadRadius: 0,
                                  blurRadius: 3.0)
                            ]),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            this.widget.usuario.image,
                          ),
                          radius: 45,
                        ),
                      ),
                      Text(
                        this.widget.usuario.nombre +
                            " " +
                            this.widget.usuario.apellido,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        this.widget.usuario.correo,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'HindGuntur',
                            color: MyColors().colorGris),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "Restaurantes Favoritos",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                ),
                this.widget.usuario.favoritos != null
                    ? listaFavoritos(
                        context,
                      )
                    : Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Aun no tienes ningun favorito",
                          style: TextStyle(
                              color: MyColors().colorGrisNoTanClaro,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HindGuntur'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container listaFavoritos(BuildContext context) {
    Funciones funciones = new Funciones();
    return Container(
      height: 420,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: widget.usuario.favoritos.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            Restaurante restaurante = this.widget.usuario.favoritos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    SlideRightRoute(
                        page: RestauranteDetallePage(
                            this.widget.usuario, restaurante)));
              },
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors().colorFondo,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.0,
                      color: Colors.grey,
                      offset: Offset(0.0, 3.0), //(x,y)
                      blurRadius: 3.0,
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 230,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 0),
                      child: Text(
                        restaurante.nombre,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 210,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                          children:
                              funciones.getValoracion(restaurante.valoracion)),
                    ),
                    Container(
                      width: 210,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.location_on,
                              color: MyColors().colorGris,
                              size: 25,
                            ),
                          ),
                          Container(
                              width: 180,
                              child: Text(
                                widget.usuario.favoritos[index].direccion,
                                style: TextStyle(
                                  height: 1.2,
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
                      height: 180,
                      width: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.0,
                              color: Colors.grey,
                              offset: Offset(0.0, 2.0), //(x,y)
                              blurRadius: 6.0,
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(
                            this.widget.usuario.favoritos[index].imagen,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 210,
                      margin: EdgeInsets.only(top: 10),
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: MyColors().colorPrimario,
                          onPressed: () {
                            setState(() {
                              widget.usuario.favoritos.removeAt(index);
                            });
                          },
                          child: Text(
                            'ELIMINAR',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container listaReservas(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: this.widget.usuario.citas.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            String fecha = DateFormat.MMMMd('es_ES')
                .format(this.widget.usuario.citas[index].fecha);
            Restaurante restaurante =
                this.widget.usuario.citas[index].restaurante;

            return Container(
              width: 170,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyColors().colorFondo,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.0,
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 6.0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text(
                      fecha,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'HindGuntur',
                          height: 0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: MyColors().colorGrisNoTanClaro,
                    endIndent: 20,
                    indent: 20,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      restaurante.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'HindGuntur',
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
