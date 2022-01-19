import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "detail-page";
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final productID = ModalRoute.of(context).settings.arguments as String;
    final meubleProvide = Provider.of<ChairProvider>(context).findById(productID);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
                )
              ],),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.network(meubleProvide.imageUrl),
            ),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(meubleProvide.description)),
            ),
          ],
        ),
      ),
    );
  }
}
