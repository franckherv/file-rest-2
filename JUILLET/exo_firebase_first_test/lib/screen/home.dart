import 'package:exo_firebase_first_test/model_data.dart';
import 'package:exo_firebase_first_test/screen/profil_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Profil> data = [
    Profil(
        icon: Icons.person,
        title: "Arelie",
        sousbTitle: "J'aime la glace et toi",
        size: 23),
    Profil(
        icon: Icons.person,
        title: "Adou",
        sousbTitle: "J'aime le foutou couché",
        size: 23),
    Profil(
        icon: Icons.person,
        title: "Jean Pierre",
        sousbTitle: "gre tdvdc iodd dvdvdv",
        size: 23),
    Profil(
        icon: Icons.person,
        title: "Arelie",
        sousbTitle: "saim dadadga",
        size: 23),
    Profil(icon: Icons.person, title: "Viviane", sousbTitle: "oui", size: 23),
    Profil(icon: Icons.person, title: "Henry", sousbTitle: "oui", size: 23),
    Profil(icon: Icons.person, title: "Thiery", sousbTitle: "non", size: 23),
    Profil(icon: Icons.person, title: "Joel", sousbTitle: "non", size: 23),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          title: Text("search"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, FormScreen.routeName);
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (cxt, i) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(data[i].icon),
                ),
                title: Text(data[i].title),
                subtitle: Text(data[i].sousbTitle),
                trailing: Text("${data[i].size} KM"),
              );
            }));
  }
}
