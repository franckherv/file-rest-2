import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/detail-product";
  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context)!.settings.arguments as String;
    final productData = Provider.of<ProductPro>(context)
        .items
        .firstWhere((prod) => prod.id == routeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
      body: Column(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Image.asset(productData.imageUrl),
          ),
          SizedBox(height: 10,),
          Text("\$${productData.price}"),
          SizedBox(height: 10,),
          Text(productData.description)
        ],
      ),
    );
  }
}
