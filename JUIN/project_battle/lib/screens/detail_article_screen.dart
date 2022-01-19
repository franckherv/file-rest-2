import 'package:flutter/material.dart';
import 'package:project_battle/providers/shoes_provider.dart';
import 'package:project_battle/widgets/detail_screen_widget.dart';
import 'package:provider/provider.dart';

class DetailArticleScreen extends StatelessWidget {
  static const routeName = "/-detail";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final shoes = Provider.of<ShoesProvider>(context)
        .items
        .firstWhere((element) => element.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(shoes.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset(shoes.image),
            ),
          ),
          
          Text("Prix: ${shoes.price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: shoes.detail.length,
                itemBuilder: (cxt, i) => DetailWidgetPage(
                      detail: shoes.detail[i],
                      
                    )),
          ),
          
        ],
      ),
    );
  }
}
