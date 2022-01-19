import 'package:api_tester_app/screen/new_item_page.dart';

import '../screen/damyItem.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories de repas"),
      ),
      body: GridView(
        padding: EdgeInsets.all(9),
        children: data.map((e) => DummyData(
          titre: e.title,
          color: e.color,
          id: e.id,
        )).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2),
      ),
    );
  }
}




