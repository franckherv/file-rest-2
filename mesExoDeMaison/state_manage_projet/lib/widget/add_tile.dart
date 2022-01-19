import 'package:flutter/material.dart';

class ListTileName extends StatelessWidget {
 final bool checkValue;
  final String stileOftext;
  final Function checkBoxCallBack;

  ListTileName({this.checkValue, this.stileOftext, this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stileOftext,
          style: TextStyle(
              fontSize: 20,
              decoration: checkValue ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        value: checkValue,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
