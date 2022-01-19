import 'package:flutter/material.dart';

class CartBasket extends StatelessWidget {
  final Widget child;
  final String title;

 const CartBasket({Key key, @required this.title, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          child,
          Positioned(
            right: 0,
            
            top: 1,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              alignment: Alignment.center,
              child:  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
