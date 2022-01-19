import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_providers.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screnn.dart';
import 'package:shop_app/widgets/cart_basket.dart';
import 'package:shop_app/widgets/drawer_menu.dart';
import 'package:shop_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

    var _initValue = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_initValue) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ChairProvider>(context,listen: false).fetchAndSetData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _initValue = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProviders>(context);
    final cartId = cart.cartItems;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF98DDFF),
          ),
          drawer: const DrawerMenu(),
          body:  _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .14,
                      color: const Color(0xFF98DDFF),
                    ),
                    const Positioned(
                      top: 20,
                      left: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Bonjour ******",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  width:
                                      MediaQuery.of(context).size.width * .97,
                                  color: Colors.transparent,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft: Radius.circular(40.0),
                                              bottomRight:
                                                  Radius.circular(40.0),
                                              topRight: Radius.circular(40.0))),
                                      child: Center(
                                        child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4),
                                            child: CartBasket(
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.shopping_cart,
                                                    size: 35,
                                                    color: Colors.black),
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      CartScreen.routeName);
                                                },
                                              ),
                                              title: cartId.length.toString(),
                                            )),
                                      )),
                                ),
                                Container(
                                  height: 50.0,
                                  width: MediaQuery.of(context).size.width * .5,
                                  color: Colors.transparent,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            // Where the linear gradient begins and ends
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            // Add one stop for each color. Stops should increase from 0 to 1
                                            stops: [0.1, 0.5, 0.7, 0.9],
                                            colors: [
                                              // Colors are easy thanks to Flutter's Colors class.
                                              Color(0xFF98DDFF),
                                              Colors.blue[50],
                                              Colors.red[200],
                                              Colors.red[100],
                                            ],
                                          ),
                                          color: Colors.redAccent[100],
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft: Radius.circular(40.0),
                                              bottomRight:
                                                  Radius.circular(40.0),
                                              topRight: Radius.circular(40.0))),
                                      child: const Center(
                                        child: Text(
                                          "Panier ==>",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  const Expanded(child: ProductsGrid()),
                ])),
    );
  }
}
