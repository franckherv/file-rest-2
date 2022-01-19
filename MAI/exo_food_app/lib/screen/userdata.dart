import 'package:flutter/material.dart';
import '../screen/new_page.dart';


class Dummydata extends StatelessWidget {
  final String title;
  final String id;
  Dummydata({this.title, this.id});

      void selectedValue(context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => NewpTitlePage(
            title: title,
            userId: id,
          )));
    }
  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () => selectedValue(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.amber
          ],begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10), color: Colors.indigo),
      ),
    );
  }
}
