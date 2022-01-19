import 'package:flutter/material.dart';
import 'package:project_battle/providers/article_provider.dart';
import 'package:project_battle/screens/detail_article_screen.dart';
import 'package:provider/provider.dart';


class ViewMaillotOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final shoes = Provider.of<MaillotProvider>(context);
    
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
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GridTile(
                  child: Image.asset(productItem[index].image),
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        //shoes.toggleIsFavoris(productItem[index]);
                      },
                      // icon: Icon(
                      //   product.contains(productItem[index])
                      //       ? Icons.favorite
                      //       : Icons.favorite_border,
                      //   color: Colors.red,
                      // ),
                    ),
                    title: Text(productItem[index].name),
                    trailing: IconButton(
                      onPressed: () {
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