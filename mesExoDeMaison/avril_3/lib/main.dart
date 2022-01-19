import 'package:flutter/material.dart';
import 'textstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/food.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Connectez-vous à votre compte",
                        textAlign: TextAlign.left,
                        style: textConnection,
                      ),
                    ),
                    ContainerField(
                      label: "Email",
                      icon: Icon(Icons.email),
                    ),
                    ContainerField(
                      label: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 5),
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: Text(
                          "Mot de pass oublié ?",
                          style: styleButton,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20),
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Connexion",
                          style: styleButtonEle,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: Text(
                          "Nouvel utilisateur?",
                          style: styleButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContainerField extends StatelessWidget {
  String label;
  Icon icon;
  ContainerField({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.black),
            hintText: label,
            fillColor: Colors.grey[100]),
      ),
    );
  }
}
