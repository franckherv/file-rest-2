import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/model_shop.dart';
import 'package:shop_app/screens/detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String name;
  // final String imageURL;
  // final String price;
  // const ProductItem({Key key, this.id, this.name, this.imageURL, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final datafound = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          DetailShoping.routeName,
          arguments: datafound.id
          );
      },
      child: GridTile(
        child: Image.asset(datafound.imageUrl),
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            onPressed: () {
              datafound.toggleFavoris();
            },
            icon: Icon(
                datafound.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.pink),
          ),
          title: Text(datafound.title),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
