import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XE5E8E8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
      ),
    );
  }
}