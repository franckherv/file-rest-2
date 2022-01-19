import 'package:flutter/material.dart';
import 'package:food_app_project/models/meals.dart';
import 'package:food_app_project/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeItem;

  MealItem({
    @required this.title,
    @required this.id,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    @required this.removeItem,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "challenge";
        break;
      case Complexity.Hard:
        return "Difficile";
        break;
      default:
        return "Inconnu";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Abordable";
        break;
      case Affordability.Pricey:
        return "Moyen";
        break;
      case Affordability.Luxurious:
        return "Luxieux";
        break;
      default:
        return "Inconnu";
    }
  }

  void selectedItems(context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
      if (value != null) {
        removeItem(value);
      }
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedItems(context),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
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
                  bottom: 20,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text("$duration min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
