import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

class AppTextFiled extends StatelessWidget {
  String  hint;
  String title;
  IconData icon;

  AppTextFiled({required this.hint, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xff6E6E6F),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200),
            ).tr()),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon,color: mainColor),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14
            )
          ),
        ),
        getSpace(h: 20.h)
      ],
    );
  }
}
