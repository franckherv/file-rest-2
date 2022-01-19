import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  static const routeName = "/detail";

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Map _saveData = {"name": "", "email": "", "password": "", "number": ""};
  final _formKey = GlobalKey<FormState>();

  void validateAndSave() async {
    final form = _formKey.currentState!.validate();
    if (form) {
      _formKey.currentState!.save();

      var url = Uri.parse(
          'https://fir-h-b1a09-default-rtdb.firebaseio.com/product.json');
      var response = await http.post(url, body: json.encode(_saveData));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(form);
    } else {
      print('Form is invalid');
    }
  }

  void getData() async {
    var url = Uri.parse(
        'https://fir-h-b1a09-default-rtdb.firebaseio.com/product.json');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;

      print('Number of books about http: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Started"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Saisie incorrecte' : null,
                      onSaved: (value) {
                        _saveData['name'] = value;
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          (value!.trim().isEmpty) || !(value.contains('@'))
                              ? 'Saisie incorrecte'
                              : null,
                      onSaved: (value) {
                        _saveData['email'] = value;
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Password cannot be blank' : null,
                      onSaved: (value) {
                        _saveData['password'] = value;
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Number'),
                      validator: (value) =>
                          value!.isEmpty ? 'Password cannot be blank' : null,
                      onSaved: (value) {
                        _saveData['number'] = value;
                      },
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                        onPressed: validateAndSave, child: Text("Ok")),
                  ),
                  TextButton(child: Text('Get'), onPressed: getData),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
