import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_eclair_club/theme.dart';
import 'comment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'comments.dart';

class DetailRecipePage extends StatefulWidget {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;
  final String title;
  final String subTitle;
  final String introductionText;
  final String secondText;
  final String endingText;
  final String ingredients;
  final String stepsToPrepare;
  final int likes;
  final String category;

  DetailRecipePage({
    Key key,
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.fourthImage,
    this.title,
    this.subTitle,
    this.introductionText,
    this.secondText,
    this.endingText,
    this.ingredients,
    this.stepsToPrepare,
    this.likes,
    this.category,
  }) : super(key: key);

  @override
  _DetailRecipePageState createState() => new _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(
          "${widget.title}",
          style: new TextStyle(
              fontFamily: "Shadows Into Light", color: Colors.white),
        ),
        bottom: new TabBar(
          indicatorColor: secondaryColor,
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Description",
            ),
            new Tab(
              text: "Ingredients",
            ),
            new Tab(
              text: "Steps",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new DescriptionRecipe(
            firstImage: widget.firstImage,
            secondImage: widget.secondImage,
            thirdImage: widget.thirdImage,
            introductionText: widget.introductionText,
            secondText: widget.secondText,
            endingText: widget.endingText,
            fourthImage: widget.fourthImage,
            category: widget.category,
          ),
          new IngredientsRecipe(
            ingredientsRecipe: widget.ingredients,
          ),
          new StepsRecipe(
            stepsToPrepare: widget.stepsToPrepare,
          ),
        ],
      ),
    );
  }
}

class DescriptionRecipe extends StatelessWidget {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;
  final String introductionText;
  final String secondText;
  final String endingText;
  final String category;
  final Function persistentBottomSheet;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  DescriptionRecipe(
      {this.firstImage,
      this.secondImage,
      this.thirdImage,
      this.fourthImage,
      this.introductionText,
      this.secondText,
      this.endingText,
      this.category,
      this.persistentBottomSheet});

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
    );
    print("User Name: ${user.displayName}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new Container(
          child: new Image.network(firstImage,
              fit: BoxFit.cover, width: double.infinity, height: 300.0),
        ),
        Container(
          color: primaryColor,
          child: new ListTile(
            leading: new Icon(
              Icons.comment,
              color: Colors.white,
            ),
            title: FlatButton(
              onPressed: () {
                _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e));
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => CommentPage(),
                );
                Navigator.of(context).push(route);
              },
              child: Text(
                "Click here and leave me a comments",
                style: new TextStyle(
                    color: Colors.white, fontFamily: "Handlee", fontSize: 15.0),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        new Container(
            child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Text(
            introductionText,
            style: new TextStyle(
                color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),
          ),
        )),
        new Container(
          child: new Image.network(secondImage,
              fit: BoxFit.cover, width: double.infinity, height: 300.0),
        ),
        new Container(
            child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Text(
            secondText,
            style: new TextStyle(
                color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),
          ),
        )),
        new Container(
          child: new Image.network(thirdImage,
              fit: BoxFit.cover, width: double.infinity, height: 300.0),
        ),
        new Container(
            child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Text(
            endingText,
            style: new TextStyle(
                color: textColor, fontFamily: "Roboto Regular", fontSize: 18.0),
          ),
        )),
        new Container(
          child: new Image.network(fourthImage,
              fit: BoxFit.cover, width: double.infinity, height: 300.0),
        ),
      ],
    );
  }
}

class IngredientsRecipe extends StatelessWidget {
  final String ingredientsRecipe;

  IngredientsRecipe({
    this.ingredientsRecipe,
  });
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
              buildTextView(ingredientsRecipe.split("|").length)),
        ),
      ],
    );
  }

  List buildTextView(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              new CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: new Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
              new Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                child: new Text(
                  "${ingredientsRecipe.split("|")[i]}",
                  style: new TextStyle(color: textColor, fontSize: 20.0),
                ),
              ),
            ],
          )));
    }
    return strings;
  }
}

class StepsRecipe extends StatelessWidget {
  final String stepsToPrepare;

  StepsRecipe({
    this.stepsToPrepare,
  });
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
              buildTextView(stepsToPrepare.split("|").length)),
        ),
      ],
    );
  }

  List buildTextView(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundColor: secondaryColor,
              child: new Text(
                (i + 1).toString(),
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: new Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
              child: new Text(
                "${stepsToPrepare.split("|")[i]}",
                style: new TextStyle(color: textColor, fontSize: 20.0),
              ),
            ),
          )));
    }
    return strings;
  }
}
