import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
          fit: BoxFit.fill
        )
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("login",style:TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold)).tr(),
            Align(
                alignment:AlignmentDirectional.centerStart,child: Text("mobile_number",style: TextStyle(color: Color(0xff6E6E6F),fontSize: 12.sp,fontWeight: FontWeight.w200),).tr()),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                        "assets/images/16_22.svg",
                        semanticsLabel: 'Acme Logo'
                    ),
                    SizedBox(width: 10.w,),
                    Text("249+",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff0A0400)),)
                  ],
                ),),
            )
          ],
        ),
      ),
    );
  }
}
