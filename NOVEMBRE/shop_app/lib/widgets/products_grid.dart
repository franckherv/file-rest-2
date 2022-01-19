import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../widgets/products_overview_screen_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ChairProvider>(context);
    final productData = products.items;
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ListView.builder(
            //shrinkWrap: true,
            itemCount: productData.length,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: productData[index],
                child: ProductsOverviewWidget(),
              );
              // return ProductsOverviewWidget(id: productData[index].id, name: productData[index].name, imageUrl: productData[index].imageUrl);
            }));
  }
}
