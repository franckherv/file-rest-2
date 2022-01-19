import 'package:flutter/material.dart';
import 'package:nan_info/models/category_model.dart';
import 'tous_service_grid_content_widget.dart';

class ServicesTousTab extends StatefulWidget {

  List<CategoryModel> tousCategories;

  PageController controller = PageController(initialPage: 0, keepPage: false);

  ServicesTousTab({@required this.tousCategories, @required this.controller});

  @override
  _ServicesTousTabState createState() => _ServicesTousTabState();
}

class _ServicesTousTabState extends State<ServicesTousTab> {
  //List<StaggeredTile> _cardTile = <StaggeredTile>[];

  List<Widget> childreans = List();

  @override
  void initState() {
    for (var i = 0; i < widget.tousCategories.length; i++) {
      //Il y'a des sous services

      if (widget.tousCategories[i] != null && widget.tousCategories[i].categoryArticle.isNotEmpty) {
        childreans.add(TousServiceGridContentWidget(
          categorie: widget.tousCategories[i],
          controller: widget.controller,
          tabLabel: widget.tousCategories[i].name,
          index: i,
        ));

      } /*else if (widget.tousServices[i].has_prestations) {
        childreans.add(TousServiceGridContentWidget(
          service: widget.tousServices[i],
          controller: widget.controller,
          tabLabel: widget.tousServices[i].name,
        ));

        if (i % 2 == 0) {
          //_cardTile.add(StaggeredTile.count(2, 2));
          _cardTile.add(StaggeredTile.count(3, 3));
        } else if ((widget.tousServices.length - 1) == i) {
          //_cardTile.add(StaggeredTile.count(2, 2));
          _cardTile.add(StaggeredTile.count(3, 3));
        } else {
          _cardTile.add(StaggeredTile.count(3, 3));
        }
      }*/

    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: GridView.count(
            crossAxisCount: 1,
            //crossAxisCount: 2,
            children: childreans,
            //childAspectRatio: 0.9,
            childAspectRatio: 1.7,
          )),
        ],
      ),
    );
  }
}
