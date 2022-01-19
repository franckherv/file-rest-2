import 'package:flutter/material.dart';

import 'package:shop_app/screens/accueil.dart';

enum Options {
  Favoris,
  Produits,
}

class ProductsViewScreen extends StatefulWidget {
  @override
  _ProductsViewScreenState createState() => _ProductsViewScreenState();
}

class _ProductsViewScreenState extends State<ProductsViewScreen> {
  var _showFavoris = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: [
          PopupMenuButton(
              onSelected: (Options value) {
                setState(() {
                  if (value == Options.Favoris) {
                  _showFavoris = true;
                  
                } else {
                  _showFavoris = false;
                }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (cxt) => [
                    PopupMenuItem(
                      child: Text("Produits"),
                      value: Options.Produits,
                    ),
                    PopupMenuItem(
                        child: Text("Favoris"), value: Options.Favoris),
                  ])
        ],
      ),
      body: HomePage(_showFavoris),
    );
  }
}
