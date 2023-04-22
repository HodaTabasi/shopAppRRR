import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff755B45).withOpacity(0.3),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getSpace(h: 30.h),
            Text("login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700))
                .tr(),
            getSpace(h: 15.h),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "mobile_number",
                  style: TextStyle(
                      color: Color(0xff6E6E6F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200),
                ).tr()),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/16_22.svg",
                        semanticsLabel: 'Acme Logo'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "249+",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0A0400)),
                    )
                  ],
                ),
              ),
            ),
            getSpace(h: 20.h),
            BtnApp(
                title: "login".tr(),
                prsee: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/otp_screen", (route) => false);
                }),
            getSpace(h: 50.h),
            getRichText(
                S1: "condtion1".tr(),
                S2: "condtion2".tr(),
                S3: "condtion3".tr(),
                mainColor: mainColor,
                fontWeight:FontWeight.normal),
          ],
        ),
      ),
    );
  }
}
