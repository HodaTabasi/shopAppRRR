import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

import 'SizeConfig.dart';

Color mainColor = Color(0xff957255);
Color secondColor = Color(0xff595959);
Color thirdColor = Color(0xff858585);
Color background = Color(0xffFFFDFA);
Color miniground = Color(0xffC6B48C);
Color divider = Color(0xffD0D0D0);
Color textColor = Color(0xff636363);

getColorCode(pickerColor){
  var color =
  pickerColor.toString().replaceAll(RegExp(r'(?:_|[^\w\s])+'), '');
  var rSpaceColor = color.replaceAll(RegExp(r'(\s)'), '');

  var rcolorText = rSpaceColor.toLowerCase().replaceAll(RegExp(r'color'), '');

  var materialPrimaryvalue = 'materialprimaryvalue'.toLowerCase();
  var replaceWith = '';
  var colorCode = rcolorText.replaceAll(materialPrimaryvalue, replaceWith);

  int colorCodeInt = num.tryParse(colorCode) as int;
  return colorCode;
}

String getDiscountPrice(String price,String sellingPrice){
  return (((100-num.parse(price))*num.parse(sellingPrice))/100).toStringAsFixed(2);
}

// DateTime toDateTime(){
//   int ts = SharedPrefController().lastUpdate;
//   print(ts);
//   print(DateTime.now().millisecond);
//   return DateTime.fromMillisecondsSinceEpoch(SharedPrefController().lastUpdate);
// }

const double defaultPadding = 16.0;

decoration({double blurRadius = 0.0,double radius = 0.0}){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow:  [
        BoxShadow(
            color: Color(0xffE2E2E2),
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

getColor(String hexColor) {
  Color color =
  Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  return color;
}

Future<bool> checkStatus() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print("connected to a mobile network");
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("connected to a wifi network");
   return true;
  }
  return false;
}
