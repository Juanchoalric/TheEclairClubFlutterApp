import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'theme.dart';
class HelpMeGrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(
          "Help Me Grow",
          style: new TextStyle(
              fontFamily: "Shadows Into Light", color: Colors.white),
        )),
      drawer: new DrawerMenu(),
      body: new Container(),
    );
  }
}