import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class MyCustomButtonOutline extends StatelessWidget {
  const MyCustomButtonOutline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: BoxConstraints(maxWidth: 600),
      child: OutlineButton(
        highlightedBorderColor: MyColors().colorPrimario,
        borderSide: BorderSide(color: MyColors().colorPrimario, width: 2),
        onPressed: () {},
        child: Text(
          "VOLVER",
          style: TextStyle(color: MyColors().colorPrimario, fontSize: 20),
        ),
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
