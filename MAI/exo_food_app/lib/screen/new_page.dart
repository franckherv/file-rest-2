import 'package:exo_food_app/models/categorie.dart';
import 'package:flutter/material.dart';

import '../dammy_data.dart';

class NewpTitlePage extends StatelessWidget {
  final String title;
  final String userId;
  final Complexity complexity;

  const NewpTitlePage({
    this.title,
    this.userId,
    this.complexity,
  });

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return "Simple";
    }
    if (complexity == Complexity.Hard) {
      return "Difficil";
    }
    if (complexity == Complexity.Challenging) {
      return "Moyen";
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = DUMMY_MEALS.where((element) {
      return element.categories.contains(userId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(data[index].imageUrl),
                        Positioned(
                          child: Container(
                            height: 50,
                            color: Colors.black54,
                            child: Text(
                              "${data[index].title}",
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: Colors.white),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          Icon(Icons.schedule),
                          SizedBox(width: 6),
                          Text("${data[index].duration}")
                        ]),
                        Row(
                          children: [
                            Icon(Icons.restaurant),
                            SizedBox(width: 6),
                            Text("${data[index].complexity}")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
