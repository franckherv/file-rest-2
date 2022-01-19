import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_providers.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/widgets/cart_basket.dart';
import 'package:shop_app/widgets/cart_screnn_item.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart-screen";
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProviders>(context);
    final ordorD = Provider.of<OrdersProviders>(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Visibility(
          child: FloatingActionButton.extended(
            backgroundColor: const Color(0xFF98DDFF),
            foregroundColor: Colors.white,
            onPressed: (cart.totalArticlePrice <= 0 || _isLoading)
                ? null
                : () {
                    setState(() {
                      _isLoading = true;
                    });

                    ordorD.orderProduct(
                        cart.cartItems.values.toList(), cart.totalArticlePrice);
                    setState(() {
                      _isLoading = false;
                    });
                    cart.delete();
                  },
            label: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const Text('Terminer ma commande', style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: const Color(0xFF98DDFF),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 20,
                      )),
                  const Spacer(),
                  const Text("Mon panier",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  CartBasket(
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart,
                          size: 35, color: Colors.black),
                      onPressed: () {
                        //Navigator.pushNamed(context, CartScreen.routeName);
                      },
                    ),
                    title: cart.cartItems.length.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                //elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Prix Total: ',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "${cart.totalArticlePrice.toString()} CFA",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "si votre commande contient plus d'un (1) article, les frais de livraison des autres articles seront à moitié prix",
                        style: TextStyle(
                          color: Color(0xFFF9051F),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          cartArticle(
                            textwrote: 'Article',
                            pricewrote: '${cart.totalArticlePrice} FCA',
                          ),
                          const cartArticle(
                            textwrote: 'Livraison',
                            pricewrote: '1000F',
                          ),
                          cartArticle(
                            textwrote: 'Nombre',
                            pricewrote: '${cart.cartItems.length}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
            ),
            const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (cxt, i) => CartScreenItem(
                          id: cart.cartItems.values.toList()[i].id,
                          productId: cart.cartItems.keys.toList()[i],
                          title: cart.cartItems.values.toList()[i].title,
                          image: cart.cartItems.values.toList()[i].image,
                          price: cart.cartItems.values.toList()[i].price,
                          qty: cart.cartItems.values.toList()[i].quantity,
                        )))
          ],
        ),
      ),
    );
  }
}

class cartArticle extends StatelessWidget {
  final String textwrote;
  final String pricewrote;

  const cartArticle({@required this.textwrote, @required this.pricewrote});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 70,
          color: Colors.lightBlue.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("$textwrote:", style: const TextStyle(fontSize: 18)),
              const SizedBox(
                height: 5,
              ),
              Text(
                pricewrote,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
