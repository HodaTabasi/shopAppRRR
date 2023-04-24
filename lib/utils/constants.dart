import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';

Color mainColor = Color(0xff957255);
Color secondColor = Color(0xff595959);
Color thirdColor = Color(0xff858585);
Color background = Color(0xffFFFDFA);
Color miniground = Color(0xffC6B48C);
Color divider = Color(0xffD0D0D0);
Color textColor = Color(0xff636363);

decoration({double blurRadius = 0.0,double radius = 0.0}){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow:  [
        BoxShadow(
            color: Colors.grey,
            blurRadius: blurRadius
        )
      ]
  );
}
// BoxDecoration decoration = BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(20.r),
//     boxShadow: const [
//       BoxShadow(
//           color: Colors.grey,
//           blurRadius: 5
//       )
//     ]
// );
// BoxDecoration decoration1 = BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12.r),
//     boxShadow: const [
//       BoxShadow(
//           color: Colors.grey,
//           blurRadius: 2
//       )
//     ]
// );
image({path}){
return SvgPicture.asset(path);
}


final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  // border: outlineInputBorder(),
  // focusedBorder: outlineInputBorder(),
  // enabledBorder: outlineInputBorder(),
  fillColor: Colors.white,
  filled: true,
  counterStyle: TextStyle(height: double.minPositive,),
  counterText: "",
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    // borderSide: BorderSide(color: Color(0xffDCDCDC)),
  );
}


var sliver = SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 2 / 2.5,
crossAxisSpacing: 12.r,
mainAxisSpacing: 12.r);

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(y, 0)
      ..lineTo(0, 0);
      // ..lineTo(x / 2, 0);

  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}