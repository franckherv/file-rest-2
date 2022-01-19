import 'package:flutter/material.dart';
import 'package:project_battle/providers/cart_provider.dart';
import 'package:project_battle/providers/shoes_provider.dart';
import 'package:project_battle/screens/detail_article_screen.dart';
import 'package:provider/provider.dart';

class GridViewOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final shoes = Provider.of<ShoesProvider>(context);
    final product = shoes.favoris;
    final productItem = shoes.items;
    return Expanded(
      child: GridView.builder(
          itemCount: productItem.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailArticleScreen.routeName,
                    arguments: productItem[index].id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GridTile(
                  child: Image.asset(productItem[index].image),
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      onPressed: () {
                        shoes.toggleIsFavoris(productItem[index]);
                      },
                      icon: Icon(
                        product.contains(productItem[index])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    title: Text(productItem[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        cart.addPanier(
                            productItem[index].id,
                            productItem[index].name,
                            productItem[index].image,
                            productItem[index].price);
                      },
                      icon: Icon(Icons.shopping_cart, color: Colors.red),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
