import 'package:app_reservar_horario/components/myTextField.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class RegistrarIndividualPage extends StatefulWidget {
  RegistrarIndividualPage({Key key}) : super(key: key);

  @override
  _RegistrarIndividualPageState createState() =>
      _RegistrarIndividualPageState();
}

class _RegistrarIndividualPageState extends State<RegistrarIndividualPage> {
  GlobalKey<FormState> _formKey;
  FocusNode _textFocus = new FocusNode();
  final Color _colorPrimario = MyColors().colorPrimario,
      _colorSecundario = MyColors().colorSecundario,
      _colorFondo = MyColors().colorFondo;
  String _nombre = "";
  
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _nombTextEditingController =
      new TextEditingController();
  TextEditingController _passTextEditingController =
      new TextEditingController();

  bool _isPassword = true;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Un placer",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _nombre,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                      
                        MyCustomTextField(
                            "Correo electronico",
                            "email",
                            "Introduce el correo electronico",
                            _emailTextEditingController),
                        myCustomNameTextField(context),
                        myCustomPassField(context),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          constraints: BoxConstraints(maxWidth: 600),
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {}
                            },
                            child: Text(
                              "REGISTRAR",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            color: MyColors().colorPrimario,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          constraints: BoxConstraints(maxWidth: 600),
                          child: OutlineButton(
                            highlightedBorderColor: MyColors().colorPrimario,
                            borderSide: BorderSide(
                                color: MyColors().colorPrimario, width: 2),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "VOLVER",
                              style: TextStyle(
                                  color: MyColors().colorPrimario,
                                  fontSize: 20),
                            ),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Theme myCustomNameTextField(BuildContext context) {
    return Theme(
      data: ThemeData(cursorColor: _colorPrimario),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
            color: _colorFondo, borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          onChanged: (text) {
            setState(() {
              _nombre = text;
            });
          },
          controller: _nombTextEditingController,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value.isEmpty) {
              return "Inserta el nombre y apellido";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintText: "Nombre y apellido",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _colorPrimario, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black54),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: _colorSecundario),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: _colorSecundario),
            ),
          ),
        ),
      ),
    );
  }

  Theme myCustomPassField(BuildContext context) {
    return Theme(
      data:
          ThemeData(accentColor: _colorPrimario, primaryColor: _colorPrimario),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
            color: _colorFondo, borderRadius: BorderRadius.circular(5)),
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
            hintText: "Contraseña",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _colorPrimario, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black54),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: _colorSecundario),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: _colorSecundario),
            ),
          ),
        ),
      ),
    );
  }
}
