import 'package:flutter/material.dart';
import 'theme.dart';
import 'drawer_menu.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: new ListView(          
          children: <Widget>[
            new Column(
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
                  padding: new EdgeInsets.only(bottom: 20.0),
                  child: new Text(
                    "Jacinta Beccar Varela",
                    style: new TextStyle(
                        fontFamily: "Handlee",
                        color: primaryDarkColor,
                        fontSize: 24.0),
                  ),
                ),
              ],
            ),
             new Container(
              color: primaryLightColor,
                          child: new Row(
                children: <Widget>[
                  new Expanded(
                        child: new Container(),
                      ),
                  new RawMaterialButton(
                    onPressed: () {
                      launch('http://www.instagram.com');
                    },
                    padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new Image.asset("assets/instagram.png", width: 35.0,)
                    ),
                  new Expanded(
                        child: new Container(),
                      ),
                  new RawMaterialButton(
                    padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    onPressed: () {
                      launch('http://www.instagram.com');
                    },
                    child: new Image.asset("assets/facebook.png", width: 40.0,)
                    ),
                  new Expanded(
                        child: new Container(),
                      ),
                  new RawMaterialButton(
                    padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    onPressed: () {
                      launch('http://www.twitter.com');
                    },
                    child: new Image.asset("assets/twitter.png", width: 30.0,)
                    ),
                  new Expanded(
                        child: new Container(),
                      ),
                        
                      
                ],
              ),
            ),
            new ListTile(
               contentPadding: new EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
              leading: new Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                            boxShadow: <BoxShadow>[
                              
                            ],
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image: new AssetImage("assets/aboutme1.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      title: new Text("The easiest way to stand out to students is to use their names and other personal information. By addressing your message personally, you’re letting them know that this message really is directed just to them and that it’s important that they take a good look.", style: new TextStyle(
                        fontFamily: "Roboto Regular", color: textColor
                      ),),
            ),
            new Divider(),
            new ListTile(
              contentPadding: new EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
              trailing: new Container(
                        width: 100.0,
                        height: 100.0,
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
                                image: new AssetImage("assets/aboutme2.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      title: new Text("The easiest way to stand out to students is to use their names and other personal information. By addressing your message personally, you’re letting them know that this message really is directed just to them and that it’s important that they take a good look.", style: new TextStyle(
                        fontFamily: "Roboto Regular", color: textColor
                      ),),
            ),
            new Divider(),
            new ListTile(
              contentPadding: new EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 20.0),
              leading: new Container(
                        width: 100.0,
                        height: 100.0,
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
                                image: new AssetImage("assets/aboutme3.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      title: new Text("The easiest way to stand out to students is to use their names and other personal information. By addressing your message personally, you’re letting them know that this message really is directed just to them and that it’s important that they take a good look.", style: new TextStyle(
                        fontFamily: "Roboto Regular", color: textColor
                      ),),
            ),
           
          ],
        ),
        
      ),
    );
  }
}
