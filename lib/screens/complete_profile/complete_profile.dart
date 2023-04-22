import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/screens/complete_profile/done_registration_sheet.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../core/app_text_filed.dart';
import 'complete_widget.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  var groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "complete",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ).tr(),
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 80,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ))),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          buildStack(),
          AppTextFiled(
            title: 'name',
            icon: Icons.person,
            hint: 'enter_name'.tr(),
          ),
          AppTextFiled(
            title: 'email',
            icon: Icons.email,
            hint: 'enter_email'.tr(),
          ),
          AppTextFiled(
            title: 'id',
            icon: Icons.art_track,
            hint: 'enter_id'.tr(),
          ),
          AppTextFiled(
            title: 'date',
            icon: Icons.calendar_month,
            hint: 'enter_date'.tr(),
          ),
          Text(
            "gender",
            style: TextStyle(
                color: Color(0xff6E6E6F),
                fontSize: 12.sp,
                fontWeight: FontWeight.w200),
          ).tr(),
          getSpace(h: 16.h),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Colors.grey,
                width: 0.6
              )
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSelectedGender(context,"male",Icons.male,1,(val) {}),
                  VerticalDivider(color: Colors.grey,thickness: 0.6),
                  buildSelectedGender(context,"female",Icons.female,2,(val) {}),
                ],
              ),
            ),
          ),
          getSpace(h: 8.h),
          BtnApp(title: "save".tr(), prsee: (){
            showModalBottomSheet(
              isScrollControlled: false,
              backgroundColor: Colors.white,
              context: context,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              builder: (context) => DoneRegisterSheet());
          })
        ],
      ),
    );
  }


}
