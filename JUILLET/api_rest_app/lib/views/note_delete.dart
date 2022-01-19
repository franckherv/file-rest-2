

import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("warning"),
      title: Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Yes")),
             TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("No")),
      ],
    );
  }
}
