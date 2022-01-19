import 'package:flutter/material.dart';
import 'package:project_battle/providers/cart_provider.dart';
import 'package:project_battle/providers/commande_provider.dart';
import 'package:project_battle/widgets/cart_data_past.dart';
import 'package:provider/provider.dart';

class ProductCartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final shoes = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Panier"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      Spacer(),
                      Chip(
                        label: FittedBox(
                            child: Text(
                          "${shoes.totalCount}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        backgroundColor: Colors.black45,
                      ),
                      TextButton(
                          onPressed: () {
                            Provider.of<OrdersProvider>(context, listen: false).addOrder(
                                shoes.cartItem.values.toList(),
                                shoes.totalCount);
                            shoes.clear(); 
                          },
                          child: Text(
                            'Commander',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: shoes.cartItem.length,
                  itemBuilder: (cxt, i) => CartDataPast(
                        id: shoes.cartItem.values.toList()[i].id, 
                        productID: shoes.cartItem.keys.toList()[i],
                        title: shoes.cartItem.values.toList()[i].name,
                        price: shoes.cartItem.values.toList()[i].price,
                        quantity: shoes.cartItem.values.toList()[i].quantity,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
