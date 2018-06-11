import 'package:flutter/material.dart';
import 'theme.dart';
import 'main.dart';
import 'category_recipes.dart';
import 'about_me.dart';
import 'help_me_grow.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("E", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: primaryDarkColor),),
              ),
            ),
            accountName: new Text("User"),
            accountEmail: new Text("The Eclair club"),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage("assets/light-pink-solid-color-background.jpg")
              )
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.home, color: secondaryColor, size: 30.0,),
            title: new Text("Home Recipe", style: new TextStyle(color: textColor),),
            onTap: (){
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new MyHomePage(),
                );
                Navigator.of(context).pop();
                Navigator.of(context).push(route);
            },
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.category, color: secondaryColor,size: 30.0,),
            title: new Text("Category Recipe"),
            onTap: (){
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new CategoryRecipes(),
                );
                Navigator.of(context).pop();
                Navigator.of(context).push(route);
            },
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.people, color: secondaryColor,size: 30.0,),
            title: new Text("About Me"),
            onTap: (){
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new AboutMe(),
                );
                Navigator.of(context).pop();
                Navigator.of(context).push(route);
            },
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.help, color: secondaryColor,size: 30.0,),
            title: new Text("Help Me Grow"),
            onTap: (){
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new HelpMeGrow(),
                );
                Navigator.of(context).pop();
                Navigator.of(context).push(route);
            },
          )
        ],
      ),
    );
  }
}