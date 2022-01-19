import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/provider_product.dart';

class DetailScreenPage extends StatefulWidget {
  static const routeName = "/detail-screen";

  @override
  _DetailScreenPageState createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
    int _itemCount = 0;

  // void addFunction() {
  //   setState(() {
  //     counter++;
  //   });
  // }

  //   void removeFunction() {
  //   setState(() {
  //    if(!counter){} 
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    final dataFound = Provider.of<ProductProviders>(context).items;

    final data = dataFound.firstWhere((element) => element.id == productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(data.imageUrl),
              ),
            ),
            Card(
              
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(data.title,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )),
                  Chip(
                      backgroundColor: Colors.orange,
                      label: Text(
                        "${data.price} Fcfa",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
