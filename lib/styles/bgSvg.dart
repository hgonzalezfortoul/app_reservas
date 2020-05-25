import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class MySvgBackgrounds {
  static Color _colorPrimario= MyColors().colorPrimario;
  static Color _colorSecundario= MyColors().colorSecundario;
 
  SvgPicture bgTopLeftSignIn = SvgPicture.asset(
    "assets/img/top-left.svg",
    color: _colorPrimario,
  );
  SvgPicture bgBotLeftSignIn = SvgPicture.asset(
    "assets/img/bot-left.svg",
    color: _colorPrimario,
  );
  SvgPicture bgTopRightSignIn = SvgPicture.asset(
    "assets/img/top-right.svg",
    color: _colorSecundario,
  );
  SvgPicture bgBotRightSignIn = SvgPicture.asset(
    "assets/img/bot-right.svg",
    color: _colorSecundario,
  );
}
