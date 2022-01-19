import 'package:flutter/material.dart';
import 'package:nan_info/providers/new_provider.dart';
import 'package:nan_info/providers/new_provider.dart';
import 'package:nan_info/widgets/new_screen_widget.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatefulWidget {
  static const routeName = "/category";

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  
  @override
  Widget build(BuildContext context) {
    final dummyData = Provider.of<NewProvider>(context).items;
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg["id"];
    final categoryTitle = routeArg["name"];
    final infoNew = dummyData.where((item) {
      return item.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
            itemCount: infoNew.length,
            itemBuilder: (cxt, index) {
              return NewScreenWidget(id: infoNew[index].id, imageUrl: infoNew[index].picture, title: infoNew[index].title,);
            }));
  }
}
