import 'package:api_tester_app/models/meals.dart';
import 'package:api_tester_app/screen/ingrediants.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class NewItemPage extends StatelessWidget {
  final String categorieTitle;
  final String categoieId;

  NewItemPage({this.categorieTitle, this.categoieId});

  @override
  Widget build(BuildContext context) {
    final categorieName = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoieId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categorieTitle),
        ),
        body: ListView.builder(
            itemCount: categorieName.length,
            itemBuilder: (context, index) {
              return ImageData(
                imageUrl: categorieName[index].imageUrl,
                title: categorieName[index].title,
                duration: categorieName[index].duration,
                complexity: categorieName[index].complexity,
                affordability: categorieName[index].affordability,
                
              );
            }));
  }
}

class ImageData extends StatelessWidget {
  final String imageUrl;
  final int duration;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  
  const ImageData(
      {this.imageUrl,
      this.duration,
      this.title,
      this.complexity,
      this.affordability,
      
      });

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return "Simple";
    }
    if (complexity == Complexity.Challenging) {
      return "Moyen";
    }
    if (complexity == Complexity.Hard) {
      return "Difficile";
    } else {
      return "Aucune valeur";
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return "moins cher";
    }
    if (affordability == Affordability.Pricey) {
      return "Abordable";
    }
    if (affordability == Affordability.Luxurious) {
      return "Luxieux";
    } else {
      return "Aucune valeur";
    }
  }

  void mealsItem(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return Ingredient(
        titre: title,
        images: imageUrl,
       
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealsItem(context),
      child: Card(
        margin: EdgeInsets.all(15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
