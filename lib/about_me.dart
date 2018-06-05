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
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Padding(
                padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: new Align(
                  alignment: Alignment.topCenter,
                  child: new Container(
                    width: 180.0,
                    height: 180.0,
                    decoration: new BoxDecoration(
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: const Color(0xcc000000),
                            offset: new Offset(0.0, 3.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            image: new AssetImage("assets/jaci.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            new Container(
              child: new Text(
                "Jacinta Beccar Varela",
                style: new TextStyle(fontFamily: "Handlee", color: primaryDarkColor, fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
