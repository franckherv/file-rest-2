import 'package:avril_5/screen/tasksTile.dart';
import 'package:flutter/material.dart';


class Tasksview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Taskstile(),
        Taskstile(),
        Taskstile(),
      ],
    );
  }
}