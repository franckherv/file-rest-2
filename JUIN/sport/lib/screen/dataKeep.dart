import 'package:flutter/material.dart';
import '../screen/league_detail.dart';

class DataKeep extends StatelessWidget {
  final String id;
  final String leageName;
  const DataKeep({this.id ,this.leageName});

  void detailItem(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailLeague(
        teamId: id,
        title: leageName,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => detailItem(context),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.purple),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Text(
                      leageName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
