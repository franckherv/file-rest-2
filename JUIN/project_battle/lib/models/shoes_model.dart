import 'package:flutter/foundation.dart';

class Shoes with ChangeNotifier {
  final String id;
  final String name;
  final double price;
  final String image;
  final int size;
  final List<String> detail;
  bool isFavoris = false;
  Shoes({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    required this.detail,
    this.isFavoris = false,
  });


}
