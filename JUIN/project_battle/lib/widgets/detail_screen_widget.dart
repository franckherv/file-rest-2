import 'package:flutter/material.dart';

class DetailWidgetPage extends StatelessWidget {
  final String detail;


  const DetailWidgetPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Icon(Icons.check, color: Colors.green[900],),
            SizedBox(width: 10),
            Text(
              detail,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
