import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/provider_panier.dart';
import 'package:shop_app2/screens/details_screen.dart';
import '../providers/provider_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tableau = ["Favoris", "Product"];
  bool showMyProduct = true;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProviders>(context);
    final addCard = Provider.of<Articles>(context);

    final favorisData = product.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
          Stack(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.shopping_cart, size: 50)),

              Positioned(
                top: 0,
                right: 2,
                
                child: Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    ),

                    child: Text("${addCard.panierArticl.length}",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
          PopupMenuButton(onSelected: (data) {
            setState(() {
              if (data == "Product") {
                showMyProduct = true;
              } else {
                showMyProduct = false;
              }
            });
          }, itemBuilder: (BuildContext context) {
            return tableau
                .map((param) => PopupMenuItem(
                      value: param,
                      child: Text(param),
                    ))
                .toList();
          })
        ],
      ),
      body: showMyProduct
          ? GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favorisData.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailScreenPage.routeName,
                          arguments: favorisData[index].id);
                    },
                    child: GridTile(
                      child: Image.asset(favorisData[index].imageUrl),
                      footer: GridTileBar(
                          backgroundColor: Colors.black87,
                          leading: IconButton(
                            icon: Icon(
                                product.favorisItem.contains(favorisData[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.orange),
                            onPressed: () {
                              product.addProduct(favorisData[index]);
                            },
                          ),
                          title: Text(
                            favorisData[index].title,
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              addCard.addArticleInPanier(
                                  productId: favorisData[index].id,
                                  img: favorisData[index].imageUrl,
                                  prix: favorisData[index].price,
                                  title: favorisData[index].title);
                            },
                          )),
                    ),
                  ),
                );
              })
          : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favorisData.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailScreenPage.routeName,
                          arguments: favorisData[index].id);
                    },
                    child: GridTile(
                      child: Image.asset(favorisData[index].imageUrl),
                      footer: GridTileBar(
                        backgroundColor: Colors.black87,
                        leading: IconButton(
                          icon: Icon(
                              product.favorisItem.contains(favorisData[index])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.orange),
                          onPressed: () {
                            product.addProduct(favorisData[index]);
                          },
                        ),
                        title: Text(
                          favorisData[index].title,
                          textAlign: TextAlign.center,
                        ),
                        trailing:
                            Icon(Icons.shopping_cart, color: Colors.orange),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
