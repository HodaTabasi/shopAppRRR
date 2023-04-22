import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';

class BtnApp extends StatelessWidget {
  late String title;
  late VoidCallback prsee;


  BtnApp({required this.title,required this.prsee});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(16.0.r),
        height: 45.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.0.r),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
                padding: MaterialStateProperty.all(EdgeInsets.all(10.r)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14.sp,color: Colors.white))),
            onPressed: prsee,
            child: Text("$title",style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'avenir'),),

          ),
        ),
      ),
    );
  }
}
