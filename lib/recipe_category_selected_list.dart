import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:the_eclair_club/theme.dart';
import 'detail_recipe.dart';

class CategoryRecipeList extends StatefulWidget {
  final String textCategory;

  CategoryRecipeList({
    this.textCategory,
  });

  @override
  _CategoryRecipeListState createState() => new _CategoryRecipeListState();
}

class _CategoryRecipeListState extends State<CategoryRecipeList> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: primaryColor,
          title: new Text(
            "Categorias",
            style: new TextStyle(
                fontFamily: "Shadows Into Light", color: Colors.white),
          )),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('recipes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          return ListViewCategoryRecipeSelected(
            textCategory: widget.textCategory,
            documents: snapshot.data.documents,
          );
        },
      ),
    );
  }
}

class ListViewCategoryRecipeSelected extends StatelessWidget {
  final String textCategory;
  final List<DocumentSnapshot> documents;
  const ListViewCategoryRecipeSelected({
    this.textCategory,
    this.documents,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverList(
          delegate: new SliverChildListDelegate(
              buildListCategoryRecipe(textCategory, context)),
        )
      ],
    );
  }

  List buildListCategoryRecipe(String textCategory, BuildContext context) {
    List<Widget> newRecipeList = List();

    for (int index = 0; index < documents.length; index++) {
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
      if (category == textCategory) {
        newRecipeList.add(new FlatButton(
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
        ));
      }
    }
    return newRecipeList;
  }
}