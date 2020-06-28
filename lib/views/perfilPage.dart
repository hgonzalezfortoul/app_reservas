import 'package:app_reservar_horario/classes/Restaurante.dart';
import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PerfilPage extends StatelessWidget {
  final Usuario usuario;
  PerfilPage({this.usuario});
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
              Navigator.pop(context);
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
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.0,
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0), //(x,y)
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
                            this.usuario.image,
                          ),
                          radius: 45,
                        ),
                      ),
                      Text(
                        this.usuario.nombre + " " + this.usuario.apellido,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        this.usuario.correo,
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
                    "Reservas",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                ),
                this.usuario.citas != null
                    ? listaReservas(context)
                    : Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "Aun no tienes ninguna reserva",
                          style: TextStyle(
                              color: MyColors().colorGrisNoTanClaro,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HindGuntur'),
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
                this.usuario.favoritos != null
                    ? listaFavoritos(context)
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
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: usuario.favoritos.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            Restaurante restaurante = this.usuario.favoritos[index];
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    width: 230,
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
                          this.usuario.favoritos[index].imagen,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        restaurante.nombre,
                        style: TextStyle(
                            fontFamily: 'HindGuntur',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ))
                ],
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
          itemCount: this.usuario.citas.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            String fecha =
                DateFormat.MMMMd('es_ES').format(this.usuario.citas[0].fecha);
            Restaurante restaurante = this.usuario.citas[0].restaurante;

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