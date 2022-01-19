import 'package:flutter/material.dart';

class CartBadgeWidget extends StatelessWidget {
  final Widget child;
  final String text;

   CartBadgeWidget({required this.text, required this.child}) ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          right: 2,
          child: Container(
            alignment: Alignment.center,
            child: Text(text, style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.red,
              ),
          ),
          ),
      ],
    );
  }
}
