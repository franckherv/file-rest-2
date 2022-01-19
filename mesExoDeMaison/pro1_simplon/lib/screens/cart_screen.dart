import 'package:flutter/material.dart';
import '../providers/order_provider.dart';
import '../widgets/cartItemWidget.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final panier = Provider.of<CartPro>(context);
    final ordersData = Provider.of<OrdersPro>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de commande"),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  child: Chip(
                    backgroundColor: Theme.of(context).backgroundColor,
                    label: Text(
                      "TOTAL : ${panier.totalPrice.toStringAsFixed(2)} Fcfa",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      
                      ordersData.addInTheOrdersScreen(
                          panier.cartItem.values.toList(), panier.totalPrice);
                          panier.cleanCart();
                    },
                    child: Text("COMMANDER",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)))
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: panier.cartItem.length,
                itemBuilder: (cxt, i) => CartItemWidget(
                      id: panier.cartItem.values.toList()[i].id,
                      productId: panier.cartItem.keys.toList()[i],
                      quantity: panier.cartItem.values.toList()[i].quantity,
                      title: panier.cartItem.values.toList()[i].title,
                      price: panier.cartItem.values.toList()[i].price,
                      imageUrl: panier.cartItem.values.toList()[i].imageUrl,
                    )))
      ]),
    );
  }
}
