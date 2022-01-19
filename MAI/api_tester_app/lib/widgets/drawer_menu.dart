import 'package:api_tester_app/screen/tabbar_one.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      leading: Icon(icon),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            width: double.infinity,
            child: Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
            ),
          ),
          buildListTile("Setting", Icons.settings, () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return TabOne();
            }));
          }),
          buildListTile("Patner", Icons.person_add, () {}),
        ],
      ),
    );
  }
}
