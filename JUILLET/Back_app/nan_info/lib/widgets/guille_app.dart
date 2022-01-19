import 'package:flutter/material.dart';
import 'package:nan_info/widgets/card_list.dart';



class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 40.0);
    var firstControlPoint = Offset(size.width / 6, size.height - 60);
    var firstEndPoint = Offset(size.width / 3, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width * 0.5, size.height);
    var secondEndPoint = Offset(size.width * (4 / 6), size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    var thirdControlPoint = Offset(size.width * (5 / 6), size.height - 60);
    var thirdEndPoint = Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(size.width, size.height - 40.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
