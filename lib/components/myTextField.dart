import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomTextField extends StatelessWidget {
  final Color _colorPrimario = MyColors().colorPrimario,
      _colorSecundario = MyColors().colorSecundario,
      _colorFondo = MyColors().colorFondo;

  var _placeHolder, _tipoTexto, _mmsgError;
  var _tipoTeclado;
  TextEditingController _textEditingController;
  MyCustomTextField(this._placeHolder, this._tipoTexto, this._mmsgError,
      this._textEditingController) {
    switch (_tipoTexto) {
      case "texto":
        _tipoTeclado = TextInputType.text;
        break;
      case "email":
        _tipoTeclado = TextInputType.emailAddress;
        break;
      case "phone":
        _tipoTeclado = TextInputType.phone;
        break;
      case "fecha":
        _tipoTeclado = TextInputType.datetime;
        break;
    }
  }

  get textEditingController => null;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(cursorColor: _colorPrimario),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
            color: _colorFondo, borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          controller: _textEditingController,
          keyboardType: _tipoTeclado,
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
      ),
    );
  }
}
