import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/product_item.dart';
import '../providers/provider_product.dart';

class HomePage extends StatelessWidget {
  final bool showValue;

  const HomePage(this.showValue);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductData>(context);
    final product = showValue? data.favoriteItems : data.items;
    return GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: product.length,
        itemBuilder: (context, index) => ChangeNotifierProvider(
              create: (c) => product[index],
              child: ProductItem(),
            ));
  }
}
