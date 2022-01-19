import 'package:flutter/material.dart';
import 'package:sport/model/apiData.dart';

class DetailLeague extends StatelessWidget {
  final String title;
  final String teamId;

  const DetailLeague({this.title, this.teamId});
  @override
  Widget build(BuildContext context) {
    final datas = club.where((element) {
      return element.id.contains(teamId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text("Maillot de $title")),
        body: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "${datas[index].name}",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 5,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    left: 10,
                                    child: Text(
                                      "${datas[index].price} Fcfa",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 5,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                Positioned(
                                    bottom: 5,
                                    left: 10,
                                    child: Text(
                                      "${datas[index].price} Fcfa",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
