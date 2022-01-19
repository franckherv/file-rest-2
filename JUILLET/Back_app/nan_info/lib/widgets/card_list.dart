import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nan_info/providers/provider_category.dart';
import 'package:nan_info/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  var _isValue = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isValue) {
      setState(() {
        _isLoading = true;
      });
    }
    Provider.of<CatProvider>(context).fetchAndSetData().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    _isValue = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CatProvider>(context).category;
    // ignore: avoid_print
    print("=====${categoryData.length}======");
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemCount: categoryData.length,
          itemBuilder: (BuildContext ctx, index) {
            return CategoryItem(
              id: categoryData[index].id,
              name: categoryData[index].name,
            );
          }),
    );
  }
}
