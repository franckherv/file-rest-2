import 'package:fake_data/apiHelper/api_simulator.dart';
import 'package:fake_data/models/cart_screen.dart';
import 'package:fake_data/models/model_api.dart';
import 'package:fake_data/widget/home_widget.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SmulatorApi> _userData = [];

  Map<String, Cart> _cartItems = {};

  int get totalArticlePrice {
    var total = 00;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void addInCart({
    String productId,
    String title,
    int price,
    String image,
  }) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (value) => Cart(
                id: value.id,
                title: value.title,
                price: value.price,
                image: value.image,
                quantity: value.quantity + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              image: image,
              quantity: 1));
    }
  }

  ApiSimulator api = ApiSimulator();
  @override
  void initState() {
    _userData = api.getItemData(fake: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
          actions: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(totalArticlePrice.toString()),
            ),
          ],
        ),
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: _userData.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GridTile(
              child: Image.network(_userData[index].image),
              header: GridTileBar(
                  title: const Text(""),
                  leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, color: Colors.red))),
              footer: GridTileBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    _userData[index].name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          addInCart(
                          productId: _userData[index].id,
                          title: _userData[index].name,
                          price: _userData[index].prix,
                          image: _userData[index].image,
                        );
                          print( _userData.length);
                        });
                      },
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.red))),
            );
          },
        ));
  }
}
