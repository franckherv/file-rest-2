import 'package:flutter/material.dart';
import 'package:sport/model/apiData.dart';
import 'package:sport/screen/dataKeep.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       
        title: Text("Football"),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: data
            .map((e) => DataKeep(
                  id: e.id,
                  leageName: e.league,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}

