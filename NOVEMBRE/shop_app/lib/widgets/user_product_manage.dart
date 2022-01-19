import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_edit_screen.dart';

class UserProductManage extends StatelessWidget {
  final String id;
  final String image;
  final String title;

  const UserProductManage({
    @required this.id,
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        title: Text(title),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProductEditScreen.routeName,
                        arguments: id);
                  },
                  icon: const Icon(Icons.edit)),
              IconButton(
                onPressed: () {
                  Provider.of<ChairProvider>(context, listen: false).deleteProduct(id);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ));
  }
}
