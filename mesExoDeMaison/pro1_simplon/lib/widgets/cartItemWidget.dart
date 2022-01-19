import 'package:flutter/material.dart';
import 'package:pro1_simplon/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final int quantity;
  final String title;
  final double price;
  final String imageUrl;

  CartItemWidget({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartPro>(context,listen: false).removeItemtotheCartList(productId);
      },
      //confirmDismiss: (direction){} ,
      key: ValueKey(id),
      background: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, size: 35, color: Colors.white),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
            ),
            title: Text("$title", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Text("$price F", style: TextStyle(color:Theme.of(context).backgroundColor)),
                SizedBox(
                  width: 10,
                ),
                Text("Total: ${price * quantity}, Fcfa"),
              ],
            ),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
