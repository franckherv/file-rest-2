import 'package:flutter/material.dart';
import 'package:state_manage_projet/model/taskClass.dart';

class ShoMyPage extends StatefulWidget {
  @override
  _ShoMyPageState createState() => _ShoMyPageState();
}

class _ShoMyPageState extends State<ShoMyPage> {
  List<Tache> taches = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add Tasks",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent)),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                Tache user = Tache();
                setState(() {
                  taches.add(user);
                });
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
