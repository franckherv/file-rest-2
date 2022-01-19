import 'package:flutter/material.dart';
import 'package:nan_info/models/category_model.dart';
import 'package:nan_info/screens/category_new_screen.dart';


class ServiceCategoriePageView extends StatefulWidget {

  List<CategoryArticle> produits;

  ServiceCategoriePageView({@required this.produits});

  @override
  _ServiceCategoriePageViewState createState() =>
      _ServiceCategoriePageViewState();
}

class _ServiceCategoriePageViewState extends State<ServiceCategoriePageView> {
  PageController controller = PageController(initialPage: 0, keepPage: false);
  int index = 0;

  List pages = [];

  @override
  void initState() {

    /*pages.add(DisplayCategorieItemBtn(
      services: widget.serviceItem,
      controller: controller,
    ));
    pages.add(SousServicesScreen(controller: controller));*/

    pages.add(CategoryNewScreen(categoryList: widget.produits));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (val) {
        setState(() {
          index = val;
        });
      },
      controller: controller,
      itemCount: pages.length,
      itemBuilder: (BuildContext ctx, postition) {
        return pages[postition];
      },
    );
  }
}
