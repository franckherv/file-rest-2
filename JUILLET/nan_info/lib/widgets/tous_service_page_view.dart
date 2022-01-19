import 'package:flutter/material.dart';
import 'package:nan_info/models/category_model.dart';
import 'package:nan_info/proiders/provider_cat.dart';
import 'package:nan_info/widgets/services_tous_tab.dart';
import 'package:provider/provider.dart';

class TousServicePageView extends StatefulWidget {
  List<CategoryModel> serviceItem;

  TousServicePageView({@required this.serviceItem});

  @override
  _TousServicePageViewState createState() => _TousServicePageViewState();
}

class _TousServicePageViewState extends State<TousServicePageView> {
  PageController controller = PageController(initialPage: 0, keepPage: false);
  int index = 0;

  List pages = [];

  @override
  void initState() {
    pages.add(ServicesTousTab(
        tousCategories: widget.serviceItem, controller: controller));

   // pages.add(ProduitScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (val) {
        setState(() {
          index = val;
          Provider.of<CommonPovider>(context);
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
