import 'package:flutter/material.dart';

import '../screen/new_item_page.dart';

class DummyData extends StatelessWidget {
  final String titre;
  final Color color;
  final String id;

  DummyData({this.titre,this.color,this.id,});

  void selectedItem(cxt) {
    Navigator.push(cxt, MaterialPageRoute(builder: (_) {
      return NewItemPage(
        categorieTitle: titre,
        categoieId: id,
      );
    }));
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedItem(context),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(titre, style: TextStyle(fontSize: 21)),
      ),
    );
  }
}