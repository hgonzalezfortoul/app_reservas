import 'package:flutter/material.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({Key key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      
      ListTile(title: Text('Item 1'))
    ]));
  }
}
