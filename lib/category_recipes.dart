import 'package:flutter/material.dart';
import 'recipe_category_selected_list.dart';
import 'theme.dart';
import 'drawer_menu.dart';

class CategoryRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(
          "Home Sweet Home",
          style: new TextStyle(
              fontFamily: "Shadows Into Light", color: Colors.white),
        )
      ),
      drawer: new DrawerMenu(),
      body: new GridView.count(
          crossAxisCount: 2,
          children: new List.generate(categoryList.categories.length, (index) {
            return new MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new CategoryRecipeList(
                        textCategory: categoryList.categories[index].text,
                      ),
                );
                Navigator.of(context).push(route);
              },
              child: new Container(
                child: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Image(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150.0,
                          image: new AssetImage(
                              categoryList.categories[index].image)),
                      new Center(
                        child: new Text(categoryList.categories[index].text, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: "Roboto Regular", fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      )
                    ],
                  ),
              ),
            );
          })),
    );
  }
}

final categoryList = new Categories(categories: [
  new Category(text: "Cakes & Cupcakes", image: "assets/cupcakes&cakes.jpg"),
  new Category(text: "Desserts", image: "assets/dessert.jpg"),
  new Category(text: "Entrees", image: "assets/entrees.jpg"),
  new Category(text: "Sides", image: "assets/sides.jpeg"),
  new Category(text: "One Pot Meals", image: "assets/onepotmeals.jpg"),
  new Category(text: "Slow Cooker", image: "assets/slowcooker.jpg"),
]);

class Categories {
  final List<Category> categories;

  Categories({
    this.categories,
  });
}

class Category {
  final String text;
  final String image;

  Category({
    this.text,
    this.image,
  });
}
