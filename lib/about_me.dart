import 'package:flutter/material.dart';
import 'theme.dart';
import 'drawer_menu.dart';
class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(
          "About Me",
          style: new TextStyle(
              fontFamily: "Shadows Into Light", color: Colors.white),
        )),
      drawer: new DrawerMenu(),
      body: new Container(),
    );
  }
}