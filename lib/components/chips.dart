import 'package:app_reservar_horario/model/categoria.dart';
import 'package:flutter/material.dart';
import 'package:app_reservar_horario/bloc/chipsBloc.dart';

class MisCustomChips extends StatefulWidget {
  MisCustomChips({Key key}) : super(key: key);

  @override
  _MisCustomChipsState createState() => _MisCustomChipsState();
}

class _MisCustomChipsState extends State<MisCustomChips> {
  final chipsBloc = ChipsBloc();
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chipsBloc.listaCategoriaStream,
      builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ChoiceChip(
                pressElevation: 5,
                labelPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                elevation: 3,
                labelStyle: TextStyle(
                    fontSize: 18,
                    color: id == snapshot.data[index].id
                        ? Colors.white
                        : Colors.black87),
                label: Text("${snapshot.data[index].label}"),
                selected: (id == snapshot.data[index].id ? true : false),
                selectedColor: Color.fromARGB(255, 100, 190, 255),
                backgroundColor: Colors.white,
                avatar: null,
                onSelected: (e) {
                  setState(() {
                    id = snapshot.data[index].id;
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}
