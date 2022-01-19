import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/detail-page";

  @override
  Widget build(BuildContext context) {
    final detailId = ModalRoute.of(context).settings.arguments as String;

    final selecteId =
        DUMMY_MEALS.firstWhere((element) => element.id == detailId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(detailId);
          }),
      appBar: AppBar(
        title: Text("${selecteId.title}"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                selecteId.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: ListView.builder(
                        itemCount: selecteId.ingredients.length,
                        itemBuilder: (cxt, index) => Card(
                              child: Text("${selecteId.ingredients[index]}",
                                  style: TextStyle(fontSize: 18)),
                            )),
                  ),

                  // steps
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "préparation",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: ListView.builder(
                        itemCount: selecteId.steps.length,
                        itemBuilder: (cxt, index) => Card(
                              child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text("#${index + 1}"),
                                  ),
                                  title: Text(
                                    "${selecteId.steps[index]}",
                                    style: TextStyle(fontSize: 18),
                                  )),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
