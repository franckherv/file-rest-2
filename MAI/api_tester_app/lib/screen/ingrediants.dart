import 'package:flutter/material.dart';

import '../dummy_data.dart';

class Ingredient extends StatelessWidget {
  final String titre;
  final String itemId;
  final String images;

  const Ingredient({this.titre, this.itemId, this.images});
  @override
  Widget build(BuildContext context) {
    final ingredient = DUMMY_MEALS.map((e) => e.id).toList();

    print(ingredient);

    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              child: Image.network(images),
            ),
            Text(
              "Ingredients",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
               shrinkWrap: true,
               //physics: ,
                itemCount: ingredient.length,
                itemBuilder: (cxt, index) {
                  return Text("${ingredient[index]}");
                })
          ],
        ),
      ),
    );
  }
}
