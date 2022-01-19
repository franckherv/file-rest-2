import 'package:flutter/material.dart';

import '../dammy_data.dart';
import '../screen/userdata.dart';
import '../widget/bottom.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview"),
      ),
    
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            maxCrossAxisExtent: 250),
        children: DUMMY_CATEGORIES
            .map((e) => Dummydata(
                  title: e.title,
                  id: e.id,
                ))
            .toList(),
      ),
    );
  }
}
