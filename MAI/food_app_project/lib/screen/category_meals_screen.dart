import 'package:flutter/material.dart';

import 'package:food_app_project/dummy_data.dart';

import '../category_items.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(5),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.title,e.id,e.color,)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      
    );
  }
}
