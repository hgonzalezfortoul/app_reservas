import 'package:flutter/material.dart';

class MyTopBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return topbar();
  }

  Widget topbar() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
    );
  }
}
