import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0,0);
path_0.lineTo(0,size.height);
path_0.cubicTo(0,size.height,size.width*0.1428000,size.height*0.7655906,size.width*0.2693333,size.height*0.6484375);
path_0.cubicTo(size.width*0.4255387,size.height*0.5038125,size.width*0.5963920,size.height*0.5441156,size.width*0.7560000,size.height*0.4046875);
path_0.cubicTo(size.width*0.8613093,size.height*0.3126906,size.width,size.height*0.1015625,size.width,size.height*0.1015625);
path_0.lineTo(size.width,0);
path_0.lineTo(0,0);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.shader = ui.Gradient.linear(Offset(0,size.height*0.3250000), Offset(size.width,size.height*0.3250000), [Color(0xff957255).withOpacity(0.75),Color(0xff957255).withOpacity(1)], [0,1]);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*1.030952);
    path_0.lineTo(size.width,size.height*0.02179829);
    path_0.lineTo(size.width,size.height*-0.02380952);
    path_0.cubicTo(size.width,size.height*0.02179829,size.width*-0.01644737,size.height*1.192619,size.width*0.2467477,size.height*0.9666667);
    path_0.cubicTo(size.width*0.3700658,size.height*1,size.width*1,size.height*1,size.width*1,size.height*1);
    path_0.cubicTo(size.width*0.4750757,size.height*0.7560952,size.width*0.1968836,size.height*0.8184905,0,size.height*1.030952);
    path_0.lineTo(size.width,size.height*1.030952);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width,size.height*1.028571), Offset(size.width*-23.35526,size.height*1.028571), [Color(0xff755B45).withOpacity(0.75),Color(0xff957255).withOpacity(1)], [0,1]);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}