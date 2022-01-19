import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New application",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listValueg;
  var listValue;
  List datas = [
    {
      "id": 1,
      "question": "Quel language utilise flutter ?",
      "reponse": [
        {
          "responseTrue": "Dart",
          "status": true,
        },
        {
          "responseTrue": "Angular",
          "status": false,
        },
      ]
    },
    {
      "id": 2,
      "question": "Qui est l'actuel président de la côte d'ivoire ?",
      "reponse": [
        {
          "responseTrue": "Alassane Ouattara",
          "status": true,
        },
        {
          "responseTrue": "Konan Bédié",
          "status": false,
        },
      ]
    },
    {
      "id": 3,
      "question": "Didier Drogba est un :",
      "reponse": [
        {
          "responseTrue": "Ivoirien",
          "status": true,
        },
        {
          "responseTrue": "Français",
          "status": false,
        },
      ]
    },
  ];

  List<Widget> radios() {
    List<Widget> l = [];

    for (var i = 0; i < datas.length; i++) {
      Column row = Column(
        children: [
          Text("Q N° ${datas[i]["id"]}",style: TextStyle(fontSize: 25,  fontWeight: FontWeight.bold),),
           SizedBox(height: 15,),
          Text(
            datas[i]["question"],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23, color: Colors.grey[700], fontStyle: FontStyle.italic ),
          ),
           SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                datas[i]["reponse"][0]["responseTrue"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             
              Radio(
                  value:datas[i]["reponse"][0],
                  groupValue: listValueg,
                  onChanged: (var l) {
                    setState(() {
                      listValueg = l;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                datas[i]["reponse"][1]["responseTrue"],
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                
                ),
              ),
              Radio(
                    value: datas[i]["reponse"][1],
                  groupValue: listValueg,
                  onChanged: (var x) {
                    setState(() {
                      listValueg = x;
                    });
                  })
            ],
          ),
        ],
      );
      l.add(row);
    }
    return l;

    // datas.forEach((element) {
    //  Column row = Column(
    //    children: [
    //====Text(element["id"], style: TextStyle(fontSize: 20),),
    //         Text(element["question"], style: TextStyle(fontSize: 20),),
    //         Row(
    //            mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(element["reponse"][0]["responseTrue"], style: TextStyle(fontSize: 20),),
    //             Radio(
    //                 value: element,
    //                 groupValue: listValueg,
    //                 onChanged: (var x) {
    //                  setState(() {
    //                     listValueg = x;
    //                  });
    //                 })

    //           ],
    //         ),

    //          Row(
    //            mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(element["reponse"][1]["responseTrue"], style: TextStyle(fontSize: 20),),
    //             Radio(
    //                 value: element,
    //                 groupValue: listValue,
    //                 onChanged: (d) {
    //                  setState(() {
    //                     listValue = d;
    //                  });
    //                 })

    //           ],
    //         ),

    //       ],

    //     );
    //     l.add(row);
    //   });
    //   return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Question du jour"),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: radios(),
      ),
    );
  }
}
