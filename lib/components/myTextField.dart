import 'package:app_reservar_horario/styles/color.dart';
import 'package:app_reservar_horario/views/signinPage.dart';
import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final Color _colorPrimario = MyColors().colorPrimario,
      _colorSecundario = MyColors().colorSecundario,
      _colorFondo = MyColors().colorFondo;

  var _placeHolder, _tipoTexto, _mmsgError;
  bool _ocultarTexto = false;
  var _tipoTeclado;
  TextEditingController _textEditingController;
  MyCustomTextField(this._placeHolder, this._tipoTexto, this._mmsgError,
      this._textEditingController) {
    switch (_tipoTexto) {
      case "texto":
        _ocultarTexto = false;
        _tipoTeclado = TextInputType.text;
        break;
      case "contraseña":
        _ocultarTexto = true;
        _tipoTeclado = TextInputType.visiblePassword;
        break;
      case "email":
        _ocultarTexto = false;
        _tipoTeclado = TextInputType.emailAddress;
        break;
      case "phone":
        _ocultarTexto = false;
        _tipoTeclado = TextInputType.phone;
        break;
      case "fecha":
        _ocultarTexto = false;
        _tipoTeclado = TextInputType.datetime;
        break;
    }
  }

  get textEditingController => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _colorFondo, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: _textEditingController,
        keyboardType: _tipoTeclado,
        obscureText: _ocultarTexto,
        validator: (value) {
          if (value.isEmpty) {
            return _mmsgError;
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: _placeHolder,
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
    );
  }
}
