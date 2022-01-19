import 'package:flutter/material.dart';
import 'package:projet2/widgets/custum_text.dart';
import 'package:projet2/models/question.dart';

class PageQuiz extends StatefulWidget {
  @override
  _PageQuizState createState() => _PageQuizState();
}


class _PageQuizState extends State<PageQuiz> {
  Question question;

  List<Question> listQuestion = [
    Question("La devise de la belgique est l'union fait la force", true, "",
        "belgique.JPG"),
    Question("La lune va finir par tomber sur terre à cause de la gravité",
        false, "Au contraire", "lune.jpg"),
    Question("La russie est plus grande en superficie que pluton", true, "",
        "russie.jpg"),
    Question("Nyctalone est une race naine d'antilope", false,
        "c'est une aptitude à voir dans", "nyctalope.jpg"),
    Question("Le commodore 64 est l'ordinateur de burreau le plus vendu", true,
        "", "commodore.jpg"),
    Question("Le nom du tableau des pirates est black skull", false,
        "Il est applelé Jolly Rogger", "pirate.png"),
    Question("Haddock est le nom du chien tintin", false, "C'est Milou",
        "tintin.jpg"),
    Question("La barbe des pharaons était fausse", true, "", "pharaon.jpg"),
    Question("Au Québec tire toi une bûche veut dire viens t'asseoire", true,
        "", "buche.jpg"),
    Question("Le mode lunaire Eagle de possédait de 4 Ko de Ram", true, "",
        "eagle.jpg"),
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    question = listQuestion[index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: CustumText("Quizz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustumText("Question N° ${index + 1}",
                color: Colors.grey[900], factor: 1.8),
            CustumText(
              "Score: $score/ $index",
              color: Colors.grey[900],
              factor: 1.3,
            ),
            
            Card(
              elevation: 10,
              child: Container(
                width: taille,
                height: taille,
                child: Image.asset(
                  "assets/${question.imagePath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustumText(
              question.question,
              color: Colors.black,
              factor: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [boutonBool(true), boutonBool(false)],
            )
          ],
        ),
      ),
    );
  }

  RaisedButton boutonBool(bool b) {
    return RaisedButton(
      onPressed: (() => dialogue(b)),
      child: CustumText(
        (b) ? "Vrai" : "Faux",
        factor: 1.5,
      ),
      color: Colors.blue,
    );
  }

  Future<Null> dialogue(bool b) async {
    bool bonneresponse = (b == question.reponse);
    String vrai = "assets/vrai.jpg";
    String faux = "assets/faux.jpg";

    if (bonneresponse) {
      score++;
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: CustumText(bonneresponse ? "Bravo !!" : "Oups perdu ...",
                factor: 1.4,
                color: (bonneresponse) ? Colors.green : Colors.red),
            contentPadding: EdgeInsets.all(20),
            children: [
              Image.asset((bonneresponse) ? vrai : faux, fit: BoxFit.cover),
              Container(height: 25.0),
              CustumText(question.explication,
                  factor: 1.25, color: Colors.grey),
              Container(
                height: 25.0,
              ),
              RaisedButton(
                  color: Colors.blue[800],
                  child: CustumText(
                    "Au suivant",
                    factor: 1.25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    nextQuestion();
                  }),
            ],
          );
        });
  }

  Future<Null> alert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: CustumText(
              "C'est fini",
              factor: 1.5,
              color: Colors.red[900],
            ),
            contentPadding: EdgeInsets.all(10.0),
            content: CustumText("Votre score : $score / $index",
                color: Colors.grey[900]),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(buildContext);
                  Navigator.pop(context);
                },
                child: CustumText("OK", factor: 1.5, color: Colors.blue[800]),
              ),
            ],
          );
        });
  }

  void nextQuestion() {
    if (index < listQuestion.length) {
      index++;
      setState(() {
        question = listQuestion[index];
      });
    }
  }
}
