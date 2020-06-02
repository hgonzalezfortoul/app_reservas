import 'package:app_reservar_horario/styles/color.dart';
import 'package:flutter/material.dart';

class MyCustomButtonFilled extends StatelessWidget {
  const MyCustomButtonFilled({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: BoxConstraints(maxWidth: 600),
      child: MaterialButton(
        height: 50,
        onPressed: () {},
        child: Text(
          "ENTRAR",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: MyColors().colorPrimario,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
