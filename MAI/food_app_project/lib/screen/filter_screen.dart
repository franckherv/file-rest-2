import 'package:flutter/material.dart';
import 'package:food_app_project/screen/drawer_menu.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  Widget _widgetbuildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(title: Text("Filtrer")),
      body: Column(
        children: [
          Container(
            child: Text("Adjuster votre sélection"),
          ),
          Expanded(
              child: ListView(
            children: [
              _widgetbuildSwitchListTile(
                  "Gluteen_free",
                  "Adjuster uniquement vos gluteen",
                  _isGlutenFree, 
                  (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _widgetbuildSwitchListTile(
                  "Lactose_free",
                  "Adjuster uniquement vos lactose",
                  _isLactoseFree, 
                  (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),

              _widgetbuildSwitchListTile(
                  "Vegetarien",
                  "Adjuster uniquement vos Vegetarien",
                  _isVegetarian, 
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _widgetbuildSwitchListTile(
                  "_isVegan",
                  "Adjuster uniquement vos _isVegan",
                  _isVegan, 
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }
}
