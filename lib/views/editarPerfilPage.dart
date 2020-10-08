import 'dart:io';

import 'package:app_reservar_horario/classes/Usuario.dart';
import 'package:app_reservar_horario/components/myTextField.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditarPerfilPage extends StatefulWidget {
  var _usuario;

  EditarPerfilPage(Usuario usuario) {
    _usuario = usuario;
  }

  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState(_usuario);
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  ImagePicker _imagePicker = new ImagePicker();
  MyColors _myColors = new MyColors();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPassword = true;
  Usuario _usuario;
  File _usrImg;
  final TextEditingController _oldPassTextEditingController =
      new TextEditingController();
  final TextEditingController _passTextEditingController =
      new TextEditingController();

  final TextEditingController _apellidoTextEditingController =
      new TextEditingController();

  final TextEditingController _nombreTextEditingController =
      new TextEditingController();

  _EditarPerfilPageState(this._usuario);
var _imagenSeleccionada ;
  @override
  void initState() {
    super.initState();
    _nombreTextEditingController.text = _usuario.nombre;
    _apellidoTextEditingController.text = _usuario.apellido;
    _passTextEditingController.text = '1324';
    _usrImg = File(this.widget._usuario.image);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Editar Perfil',
            style: TextStyle(color: Colors.black87),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(_usrImg.path),
                            radius: 45,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10.0,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 30,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColors().colorPrimario),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: new Wrap(
                                children: <Widget>[
                                  new ListTile(
                                      leading: new Icon(Icons.camera_alt),
                                      title: new Text('Camara'),
                                      onTap: () async {
                                         _imagenSeleccionada =
                                            await _imagePicker.getImage(
                                                source: ImageSource.camera);
                                        setState(() {
                                          if (_imagenSeleccionada != null) {
                                            _usrImg =
                                                File(_imagenSeleccionada.path);
                                          }
                                        });
                                      }),
                                  new ListTile(
                                    leading: new Icon(Icons.image),
                                    title: new Text('Galeria'),
                                    onTap: () async {
                                       _imagenSeleccionada =
                                          await _imagePicker.getImage(
                                              source: ImageSource.gallery);
                                      setState(() {
                                        if (_imagenSeleccionada != null) {
                                          _usrImg =
                                              File(_imagenSeleccionada.path);
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nombre',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: MyColors().colorGris),
                    )),
                MyCustomTextField("Nombre", "texto", "Introduce tu nombre",
                    _nombreTextEditingController),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Apellido',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: MyColors().colorGris),
                    )),
                MyCustomTextField("Apellido", "texto", "Introduce tu apellido",
                    _apellidoTextEditingController),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contraseña',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: MyColors().colorGris),
                    )),
                myCustomNewPassField(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.35,
                      constraints: BoxConstraints(maxWidth: 600),
                      child: OutlineButton(
                        highlightedBorderColor: MyColors().colorPrimario,
                        borderSide: BorderSide(
                            color: MyColors().colorPrimario, width: 2),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          "VOLVER",
                          style: TextStyle(
                              color: MyColors().colorPrimario, fontSize: 20),
                        ),
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.35,
                      constraints: BoxConstraints(maxWidth: 600),
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      '¿Seguro que deseas guardar los cambios?'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[],
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
                                        setState(() {
                                          if (_imagenSeleccionada!=null) {
                                            
                                          _usuario.image=_imagenSeleccionada.path;
                                          }
                                        });
                                        Navigator.of(context).pop(true);
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
                          "GUARDAR",
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

  Theme myCustomNewPassField(BuildContext context) {
    return Theme(
      data: ThemeData(
          accentColor: _myColors.colorPrimario,
          primaryColor: _myColors.colorPrimario),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
            color: _myColors.colorFondo,
            borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          controller: _passTextEditingController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isPassword,
          validator: (value) {
            if (value.isEmpty) {
              return "Introduce la contraseña";
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: _isPassword
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onTap: () {
                setState(() {
                  _isPassword = !_isPassword;
                });
              },
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _myColors.colorPrimario, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black54),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: _myColors.colorSecundario),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: _myColors.colorSecundario),
            ),
          ),
        ),
      ),
    );
  }
}
