import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/model_chair.dart';
import 'package:shop_app/providers/cart_providers.dart';

class CartScreenItem extends StatelessWidget {
  final Chair products;
  final String id;
  final String productId;
  final String title;
  final String image;
  final int price;
  final int qty;
  const CartScreenItem({
    this.products,
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.image,
    @required this.price,
    @required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<Chair>(context, listen: false);
    final cartData = Provider.of<CartProviders>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.all(8),
        alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
              confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Avertissement"),
                content: const Text("Voulez-vous vraiment rétirer cet article du panier ?"),
                actions: [
                  TextButton(
                    child: const Text("NON", style: TextStyle(color: Colors.black),),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  TextButton(
                    child: const Text("OUI", style: TextStyle(color: Color(0xFF98DDFF),),),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              );
            });
      },
        onDismissed: (DismissDirection direction) {
          cartData.removeItem(productId);
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(0),
          child: Row(children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(image),
                    )),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 14,
              child: Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(title,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Row(
                      children: <Widget>[
                        const Text(
                          'Qte : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          qty.toString(),
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Text("${price.toString()} FCA"),
  
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
