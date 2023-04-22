import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

class DoneRegisterSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset("assets/images/done.png"),
            Positioned(
              bottom: 2,
              child: Text("cong",style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800
              ),).tr(),
            ),
          ],
        ),

        getSpace(h: 25.h),
        Text("good_job",style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500
        )).tr(),
        getSpace(h: 8.h),
        Text("all_save",style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
        )).tr(),
        getSpace(h: 8.h),
        BtnApp(title: "go_home".tr(), prsee: (){
          Navigator.pushNamedAndRemoveUntil(context, "/main_screen", (route) => false);
        })
      ],
    );
  }
}
