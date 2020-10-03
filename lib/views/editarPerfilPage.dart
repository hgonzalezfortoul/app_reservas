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
  MyColors _myColors = new MyColors();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPassword = true;
  Usuario _usuario;
  ImagePicker _imagePicker = new ImagePicker();
  final TextEditingController _oldPassTextEditingController =
      new TextEditingController();
  final TextEditingController _passTextEditingController =
      new TextEditingController();

  final TextEditingController _apellidoTextEditingController =
      new TextEditingController();

  final TextEditingController _nombreTextEditingController =
      new TextEditingController();

  _EditarPerfilPageState(this._usuario);

  @override
  void initState() {
    super.initState();
    _nombreTextEditingController.text = _usuario.nombre;
    _apellidoTextEditingController.text = _usuario.apellido;
    _oldPassTextEditingController.text = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
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
            padding: EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Perfil',
                      style: TextStyle(fontSize: 35, fontFamily: 'Poppins'),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        this.widget._usuario.image,
                      ),
                      radius: 45,
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
                                      onTap: () => {}),
                                  new ListTile(
                                    leading: new Icon(Icons.image),
                                    title: new Text('Galeria'),
                                    onTap: () => {},
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
                MyCustomTextField("Nombre", "texto", "Introduce tu nombre",
                    _nombreTextEditingController),
                MyCustomTextField("Apellido", "texto", "Introduce tu apellido",
                    _apellidoTextEditingController),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Contraseña',
                      style: TextStyle(fontSize: 35, fontFamily: 'Poppins'),
                    )),
                myCustomPassField(context),
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
                        onPressed: () {},
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
                        onPressed: () {},
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

  Theme myCustomPassField(BuildContext context) {
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
          controller: _oldPassTextEditingController,
          readOnly: true,
          enableInteractiveSelection: false,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isPassword,
          validator: (value) {
            if (value.isEmpty) {
              return "Introduce la contraseña";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintText: "Actual contraseña",
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
            hintText: "Nueva contraseña",
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
