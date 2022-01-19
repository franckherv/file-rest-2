import 'package:flutter/material.dart';

class CustumText extends Text {
  CustumText(
    String data, {
    color: Colors.white,
    textAlign: TextAlign.center,
    factor : 1.0,
  }) : super(
    data,
    textScaleFactor: factor,
    textAlign: textAlign,
    style: TextStyle(color: color),
  );
}
