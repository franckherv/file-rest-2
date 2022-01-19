import 'package:flutter/material.dart';
import 'package:state_manage_projet/model/taskClass.dart';
import 'package:state_manage_projet/widget/add_tile.dart';

class ListViewName extends StatefulWidget {
  @override
  _ListViewNameState createState() => _ListViewNameState();
}

class _ListViewNameState extends State<ListViewName> {
  List<Tache> taches = [
    Tache(name: "Achat de pain"),
    Tache(name: "Achat de riz"),
    Tache(name: "Achat de vêtements"),
    Tache(name: "Achat de Livres"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taches.length,
      itemBuilder: (context, index) {
        return ListTileName(
            checkValue: taches[index].isDone,
            stileOftext: taches[index].name,
            checkBoxCallBack: (checbox) {
              setState(() {
                taches[index].tasksFon();
              });
            });
      },
    );
  }
}
