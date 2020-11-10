import 'package:flutter/material.dart';
import 'dart:math';
import 'package:meta/meta.dart';

class ButtonPainter extends CustomPainter{


  ButtonPainter({@required this.color, @required this.avatarRadius });

  //3
  final Color color;
  final double avatarRadius;
  //4
  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height-avatarRadius);
    final centerAvatar = Offset(shapeBounds.center.dx, shapeBounds.bottom);
//2
    final avatarBounds = Rect.fromCircle(center: centerAvatar, radius: avatarRadius).inflate(8);
//3
    _drawBackground(canvas, shapeBounds, avatarBounds);
  }

  //5
  @override
  bool shouldRepaint(ButtonPainter oldDelegate) {
    return color != oldDelegate.color;
  }
  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    //1
    final paint = Paint()..color = color;

    //2
    final backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top) //3
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy) //4
      ..arcTo(avatarBounds, -pi, pi, false) //5
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy) //6
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy) //7
      ..close(); //8

    //9
    canvas.drawPath(backgroundPath, paint);
  }

}