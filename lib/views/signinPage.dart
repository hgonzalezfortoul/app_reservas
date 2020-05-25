import 'package:app_reservar_horario/model/SignInController.dart';
import 'package:flutter/material.dart';
import 'package:app_reservar_horario/styles/color.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _formKey;
  double _heightAnimatedContainer = 0;
  SignInController _signInController = SignInController();
  KeyboardVisibilityNotification _keyboardVisibility =
      new KeyboardVisibilityNotification();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _keyboardVisibility.addNewListener(onChange: (bool v) {
      setState(() {
        v
            ? _heightAnimatedContainer =
                MediaQuery.of(context).size.height * 0.1
            : _heightAnimatedContainer =
                MediaQuery.of(context).size.height * 0.3;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _colorPrimario = MyColors().colorPrimario;
    Color _colorSecundario = MyColors().colorSecundario;
    Color _colorFondo = MyColors().colorFondo;

    String _nombre = "";
    String _pass = "";

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/bg.png"), fit: BoxFit.fill)),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    height: _heightAnimatedContainer == 0
                        ? MediaQuery.of(context).size.height * 0.3
                        : _heightAnimatedContainer,
                    duration: Duration(seconds: 0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "¡Bienvenido!",
                      style: TextStyle(fontSize: 45),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _colorFondo,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Introduce el nombre de usuario";
                          }
                          return null;
                        },
                        onSaved: (String nombre) {
                          _nombre = nombre;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Nombre de usuario",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _colorPrimario, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black54),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: _colorSecundario),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: _colorSecundario),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _colorFondo,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Introduce la contraseña";
                          }
                          return null;
                        },
                        onSaved: (String pass) {
                          _pass = pass;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Contraseña",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: _colorPrimario, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black54),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: _colorSecundario),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: _colorSecundario),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(maxWidth: 600),
                    child: InkWell(
                        child: Text(
                      "¿Has olvidado tu contraseña?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: MyColors().colorPrimario),
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(maxWidth: 600),
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: MyColors().colorPrimario,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(
                      maxWidth: 600,
                    ),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: "Has click aquí para "),
                            TextSpan(
                                text: "Registrarte",
                                style: TextStyle(
                                    color: _colorPrimario,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
