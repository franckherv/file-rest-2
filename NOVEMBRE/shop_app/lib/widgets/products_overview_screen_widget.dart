import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/model_chair.dart';
import 'package:shop_app/providers/cart_providers.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/detail_page.dart';

class ProductsOverviewWidget extends StatefulWidget {
  @override
  State<ProductsOverviewWidget> createState() => _ProductsOverviewWidgetState();
}

class _ProductsOverviewWidgetState extends State<ProductsOverviewWidget> {


  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Chair>(context, listen: false);
    final cartData = Provider.of<CartProviders>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: products.id);
        },
        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(products.imageUrl),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(products.name,
                                    style: const TextStyle(fontSize: 18.0)),
                                const SizedBox(height: 5),
                                Text("${products.price} CFA",
                                    style: const TextStyle(
                                        color: Color(0xFFF9051F),
                                        fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Consumer<Chair>(
                                  builder: (context, product, child) =>
                                      (IconButton(
                                    icon: Icon(
                                        product.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: const Color(0xFFF9051F),
                                        size: 30),
                                    onPressed: () {
                                      product.toggleproductStatus();
                                    },
                                  )),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartData.addInCart(
                                        products.id,
                                        products.name,
                                        products.price,
                                        products.imageUrl);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text('Ajouter au panier!',
                                          textAlign: TextAlign.center),
                                      action: SnackBarAction(
                                        label: 'Annuler',
                                        onPressed: () {
                                          cartData.undoItem(products.id);
                                        },
                                      ),
                                    ));
                                  },
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF98DDFF),
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
