import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_button.dart';
import '../../utils/helper.dart';

class ChangePhoneNumber extends StatefulWidget {

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  late TextEditingController _phoneController;
  late TextEditingController _newPhoneController;

  @override
  void initState() {
    _phoneController = TextEditingController(text: "161467163161");
    _newPhoneController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
            controller: _phoneController,
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
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "new_mobile_number",
                style: TextStyle(
                    color: Color(0xff6E6E6F),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200),
              ).tr()),
          TextField(
            controller: _phoneController,
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
              prsee: (){}),
        ],
      ),
    );
  }
}
