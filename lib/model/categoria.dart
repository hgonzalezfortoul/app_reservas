import 'package:flutter/material.dart';

class Categoria {
  String _label;
  int _id;

  Categoria({@required id, @required label}) {
    this._label = label;
    this._id = id;
  }

  //Setters
  set label(lbl) {
    this.label = lbl;
  }
  set id(id) {
    this._id = id;
  }

  //Getters
  String get label=>this._label;
  int get id=>this._id;
}
