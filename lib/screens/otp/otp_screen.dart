
import 'package:easy_localization/easy_localization.dart' as tt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/core/app_button.dart';

import '../../utils/constants.dart';
import '../../utils/helper.dart';
import 'otp_form.dart';

class OTPScreen extends StatefulWidget {
  static String routeName = "/otp";


  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String myCode;
  late String smsCode;
  late List<String> numbers;

  onPress() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          child:  Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15.sp,
          )
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SvgPicture.asset('assets/images/sms.svg',
              semanticsLabel: 'Acme Logo'),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.r),
            child:      getRichText(
                S1: "sms1".tr(),
                S2: "0597046766",
                S3: "sms2".tr(),
                mainColor: Colors.black,
                fontWeight:FontWeight.w900),
          ),
          Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: OtpForm()),
          ),
          SizedBox(height: 30.h),
          BtnApp(title: "v".tr(), prsee: (){
            Navigator.pushNamed(context, '/complete_screen');
          }),
          SizedBox(height: 10.h),
          Text("resend",style: TextStyle(color: mainColor,fontSize: 15.sp,),textAlign: TextAlign.center,).tr()
        ],
      ),

    );
  }
}
