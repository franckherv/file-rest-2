import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../screens/product_dtail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final cartData = Provider.of<CartPro>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: productData.id);
        },
        child: GridTile(
          child: Image.asset(productData.imageUrl),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(
                  productData.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                productData.toggleFavorite();
              },
            ),
            title: Text(productData.title),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                cartData.addInCart(productData.id, productData.title,
                    productData.imageUrl, productData.price);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Ajouter au panier!',),
                  action: SnackBarAction(
                    label: 'Annuler',
                    onPressed: () {
                      cartData.snackVerify(productData.id);
                    },
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
