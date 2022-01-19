import 'package:flutter/material.dart';
import 'package:project_battle/providers/cart_provider.dart';
import 'package:project_battle/screens/product_cart_screen.dart';
import 'package:provider/provider.dart';

class StackPanier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoes = Provider.of<CartProvider>(context).cartItem;
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ProductCartScreen.routeName);
          },
        ),
        Positioned(
          right: 3,
          //top: 2,
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Text(
              "${shoes.length}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
