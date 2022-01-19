import 'package:flutter/material.dart';

class Taskstile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("oeuf"),
      trailing: Checkbox(value: false, onChanged: null),
    );
  }
}