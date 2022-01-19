// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:nan_info/screens/new_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  
  const CategoryItem({this.id, this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(NewScreen.routeName,
            arguments: {'id': id, 'name': name});
      },
      child: Stack(
        children: [
          Card(
            
            elevation: 5,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.indigo),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
