import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nan_info/models/category_model.dart';
import 'package:nan_info/proiders/provider_cat.dart';
import 'package:provider/provider.dart';

class TousServiceGridContentWidget extends StatefulWidget {
  CategoryModel categorie;
  String tabLabel;
  int index;
  PageController controller = PageController(initialPage: 0, keepPage: false);

  TousServiceGridContentWidget(
      {@required this.categorie,
      @required this.controller,
      @required this.tabLabel,
      @required this.index});

  @override
  _TousServiceGridContentWidgetState createState() =>
      _TousServiceGridContentWidgetState();
}

class _TousServiceGridContentWidgetState
    extends State<TousServiceGridContentWidget> {


  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren(),
      ),
    );
  }

  List<Widget> columnChildren() {
   // List<Widget> childreans = List();
   List<Widget> childreans = [];
    childreans.add(
      Expanded(
        child: InkWell(
          child: Column(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white.withOpacity(0.4),
                  
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 5, top: 0, right: 5, bottom: 5),
                    //height: double.infinity,
                    //width: double.infinity,
                    decoration: const BoxDecoration(
                      image:  DecorationImage(
                        image: AssetImage(
                          'images/1.jpg',
                        ),
                        //fit: BoxFit.fill,
                      ),
                      color: Colors.white70,
                      //color: _colors[widget.index],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xFF00CCFF), width: 1),
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13),
                              bottomLeft: Radius.circular(13),
                              bottomRight: Radius.circular(13)),
                        ),
                        height: 60,
                        width: 250,
                        //color: Colors.white.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.categorie.name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'MontserratBold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // const Expanded(
                            //   child: Text(
                            //     "VOIR \t >",
                            //     style: TextStyle(
                            //       fontSize: 11.0,
                            //       fontFamily: 'MontserratBold',
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            print(widget.index);

            context
                .read<CommonPovider>()
                .setCategoryList(widget.categorie.categoryArticle);

            //if (widget.service.has_sous_services) {

            //Provider.of<CommonPovider>(context, listen: false).setCategoryList(widget.categorie.categoryArticle);

            widget.controller.animateToPage((1),
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

            /*if(widget.service.sousServices[0].name != null){
                context.read<CommonPovider>().setSelectedSousCartegorieName(widget.service.sousServices[0].name);
              }else{
                context.read<CommonPovider>().setSelectedSousCartegorieName('0');
              }
            } else if (widget.service.prestations.length > 0) {

              Provider.of<GlobalStateManager>(context, listen: false)
                  .setProduit(widget.service.prestations);
              widget.controller.animateToPage(2,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              context.read<CommonPovider>().setSelectedSousCartegorieName('0');
            } */
          },
        ),
      ),
    );

    return childreans;
  }
}
