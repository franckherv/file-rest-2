import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shop_app/models/model_chair.dart';
import 'package:http/http.dart' as http;

class ChairProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Chair> _items = [
    Chair(
      id: "1",
      name: "Houyunyun",
      imageUrl:
          "https://i.pinimg.com/474x/bf/15/de/bf15ded23d56433893a6c6b885859f5e.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      price: 50000,
    ),
    Chair(
      id: "2",
      name: "Accent chairs",
      imageUrl:
          "https://i.pinimg.com/474x/0c/f4/0f/0cf40f0cc0ba23bf3af4f4c72e32cba9.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      price: 49000,
    ),
    Chair(
      id: "3",
      name: "Christopher Guyu",
      imageUrl:
          "https://i.pinimg.com/474x/de/0e/cd/de0ecdb1cb0aec8dfd6b396e5890e15c.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      price: 52000,
    ),
    Chair(
      id: "4",
      name: "Vintage Hamchairs",
      imageUrl:
          "https://i.pinimg.com/474x/4c/70/27/4c7027fe2c57f02dc292b096d4f1985a.jpg",
      description:
          "Nouveauté Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      price: 47000,
    ),
  ];

  Chair findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  List<Chair> get items {
    return [..._items];
  }

  Future<void> fetchAndSetData() async {
    var url = Uri.parse(
        'https://mobilier-app-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.get(url);
      print(json.decode(response.body));

      final extractData = json.decode(response.body) as Map<String, dynamic>;
      List<Chair> productdata = [];
      extractData.forEach((prodId, prodData) {
        productdata.add(Chair(
          id: prodId,
          name: prodData['name'],
          imageUrl: prodData['imageurl'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: prodData['isFavorite'],
        ));
      });
      _items = productdata;
      notifyListeners();
    } catch (error) {
      throw ("========$error=======");
    }
  }

  Future<void> addProduct(Chair product) async {
    var url = Uri.parse(
        'https://mobilier-app-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'name': product.name,
            'imageurl': product.imageUrl,
            'description': product.description,
            'price': product.price,
            'isFavorite': product.isFavorite
          }));
      final _newProduct = Chair(
        name: product.name,
        imageUrl: product.imageUrl,
        description: product.description,
        price: product.price,
        id: json.decode(response.body)['name'],
      );
      _items.add(_newProduct);

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void deleteProduct(String productId) {
    _items.removeWhere((ii) => ii.id == productId);
    notifyListeners();
  }

  Future<void> updateProduct(String id, Chair products) async {
    final index = _items.indexWhere((e) => e.id == id);

    if (index >= 0) {
      var url = Uri.parse(
          'https://mobilier-app-default-rtdb.firebaseio.com/products/$id.json');
      await http.patch(url,
          body: json.encode({
            'name': products.name,
            'imageUrl': products.imageUrl,
            'description': products.description,
            'price': products.price,
          }));
      _items[index] = products;
    } else {
      print("########");
    }
    notifyListeners();
  }
}
