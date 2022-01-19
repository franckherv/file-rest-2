import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/provider_product.dart';

class DetailShoping extends StatelessWidget {
  static const routeName = "/detail-shop";

  @override
  Widget build(BuildContext context) {
    final dataID = ModalRoute.of(context).settings.arguments as String;
    final dataItem = Provider.of<ProductData>(context).items;

    final producID = dataItem.firstWhere((element) => element.id == dataID);

    return Scaffold(
      appBar: AppBar(
        title: Text(producID.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height/3,
            child: Image.asset(producID.imageUrl),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text("Nom"),
                  SizedBox(width: 6),
                  Text(producID.title),
                ],
              ),
               Row(
                children: [
                  Text("Prix"),
                  SizedBox(width: 6),
                  Text("${producID.price} Fcfa"),
                ],
              )
            ],
          ),
          Text(producID.description)
        ],
      ),
    );
  }
}
