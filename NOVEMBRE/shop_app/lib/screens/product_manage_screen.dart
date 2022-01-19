import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_edit_screen.dart';
import 'package:shop_app/widgets/drawer_menu.dart';
import 'package:shop_app/widgets/user_product_manage.dart';

class ProductManageScreen extends StatefulWidget {
  static const routeName = "manage-product";
  const ProductManageScreen({Key key}) : super(key: key);

  @override
  _ProductManageScreenState createState() => _ProductManageScreenState();
}

class _ProductManageScreenState extends State<ProductManageScreen> {

  Future<void> _refleshIndicator(context) async {
   await Provider.of<ChairProvider>(context, listen: false).fetchAndSetData();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ChairProvider>(context).items;
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vos produits', style: TextStyle(color: Colors.black)),
          backgroundColor: const Color(0xFF98DDFF),
          elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProductEditScreen.routeName);
                },
                icon: const Icon(Icons.add, color: Colors.black)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refleshIndicator(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      UserProductManage(
                        id: product[index].id,
                        image: product[index].imageUrl,
                        title: product[index].name,
                      ),
                      const Divider()
                    ],
                  )),
        ),
      ),
    );
  }
}
