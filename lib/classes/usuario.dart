import 'package:flutter/material.dart';

class Usuario {
  String _nombre, _apellido, _usuario;

  Usuario({@required nombre, @required apellido, @required usuario}){
    this._nombre=nombre;
    this._apellido=apellido;
    this._usuario=usuario;
  }
  //Getters
   String get nombre=>_nombre;
   String get apellido=>_apellido;
   String get nomUsuario=>_usuario;

   //Setter
   set nombre(nombre){
     this._nombre=nombre;
   }

   set apellido(apellido){
     this._apellido=apellido;
   }

   set nomUsuario(nomUsuario){
     this._usuario=nomUsuario;
   }
}
