import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final int price;
  final String image;
  final int quantity;

  Cart(
    { @required this.id,
      @required this.title,
      @required this.price,
      @required this.image,
      @required this.quantity});
}
