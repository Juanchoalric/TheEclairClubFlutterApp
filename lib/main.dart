import 'package:flutter/material.dart';
import 'theme.dart';
import 'detail_recipe.dart';
import 'drawer_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new DrawerMenu(),
        appBar: new AppBar(
            backgroundColor: primaryColor,
            title: new Text(
              "Home Sweet Home",
              style: new TextStyle(
                  fontFamily: "Shadows Into Light", color: Colors.white),
            )),
        body: new StreamBuilder(
            stream: Firestore.instance.collection('recipes').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              return FirestoreRecipeListView(
                  documents: snapshot.data.documents);
              
            }));
  }
}

class FirestoreRecipeListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  FirestoreRecipeListView({this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        String title = documents[index].data['title'].toString();
        String firstImage = documents[index].data['firstImage'].toString();
        String secondImage = documents[index].data['secondImage'].toString();
        String thirdImage = documents[index].data['thirdImage'].toString();
        String fourthImage = documents[index].data['fourthImage'].toString();
        String likes = documents[index].data['likes'].toString();
        String subtitle = documents[index].data['subtitle'].toString();
        String introductionText =
            documents[index].data['introductionText'].toString();
        String bodyText = documents[index].data['bodyText'].toString();
        String endingText = documents[index].data['endingText'].toString();
        String ingredients = documents[index].data['ingredients'].toString();
        String stepsToPrepare =
            documents[index].data['stepsToPrepare'].toString();
        String category = documents[index].data['category'].toString();
        bool isliked = documents[index].data['isLiked'];

        return new FlatButton(
          padding: new EdgeInsets.all(0.0),
          onPressed: () {
            var route = new MaterialPageRoute(
              builder: (BuildContext context) => new DetailRecipePage(
                    title: title,
                    firstImage: firstImage,
                    secondImage: secondImage,
                    thirdImage: thirdImage,
                    fourthImage: fourthImage,
                    introductionText: introductionText,
                    secondText: bodyText,
                    endingText: endingText,
                    stepsToPrepare: stepsToPrepare,
                    ingredients: ingredients,
                    category: category,
                  ),
            );
            Navigator.of(context).push(route);
          },
          child: new Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: new Card(
              elevation: 10.0,
              child: new Column(
                children: <Widget>[
                  new Image.network(
                    firstImage,
                    width: double.infinity,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(left: 16.0)),
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 25.0, fontFamily: "Handlee"),
                            ),
                            new Text(
                              subtitle,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Varela Round Regular",
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: 2.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                            primaryColor,
                            primaryColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: new Column(
                          children: <Widget>[
                            new IconButton(
                              splashColor: primaryColor,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(bottom: 0.0),
                              onPressed: () {
                                isliked ?
                                Firestore.instance
                                    .runTransaction((transaction) async {
                                  DocumentSnapshot freshSnap = await transaction
                                      .get(documents[index].reference);
                                      await transaction.update(freshSnap.reference, {"isLiked": false});
                                  await transaction.update(freshSnap.reference,
                                  
                                      {'likes': int.parse(likes) - 1});
                                }) : Firestore.instance
                                    .runTransaction((transaction) async {
                                  DocumentSnapshot freshSnap = await transaction
                                      .get(documents[index].reference);
                                  await transaction.update(freshSnap.reference, {"isLiked": true});
                                  await transaction.update(freshSnap.reference,
                                      {'likes': int.parse(likes) + 1});
                                });
                              },
                              icon: isliked ? new Icon(Icons.favorite) : new Icon(Icons.favorite_border),
                              color: primaryDarkColor,
                            ),
                            new Text(
                              likes,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 18.0, color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
