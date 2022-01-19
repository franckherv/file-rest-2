import 'package:flutter/material.dart';
import 'package:project_battle/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartDataPast extends StatelessWidget {
  final String id;
  final String productID;
  final String title;
  final double price;
  final int quantity;

  const CartDataPast({
    required this.id,
    required this.productID,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final shoes = Provider.of<CartProvider>(context);
    return Dismissible(
      onDismissed: (direction) {
        shoes.removeItem(productID);
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        color: Colors.teal,
        child: Icon(Icons.delete, size: 40, color: Colors.black),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: FittedBox(
                    child: Text(
                  "$title",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
                backgroundColor: Colors.teal,
              ),
              Spacer(),
              Text(
                "${(price * quantity)} F",
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              Text("$quantity x", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
