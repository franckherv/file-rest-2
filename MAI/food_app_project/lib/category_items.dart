import 'package:flutter/material.dart';
import 'screen/categorie_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  CategoryItem(this.title, this.id, this.color);

  void selectedItem(cxt) {
    Navigator.of(cxt).pushNamed(CategoryScreenMeals.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedItem(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
