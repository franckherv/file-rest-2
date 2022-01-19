import 'package:flutter/material.dart';
import 'package:projet2/widgets/custum_text.dart';
import 'pages_quizz.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QUIZZ vrai ou faux",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  "assets/cover.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PageQuiz();
                  }));
                },
                child: CustumText(
                  "Commencer le QUIZ",
                  factor: 1.5,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
