import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/get/api_auth_getx_controller.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

class AppTextFiled extends StatelessWidget {
  String  hint;
  String title;
  IconData icon;

  var controller;

  var readOnly;


  AppTextFiled({required this.hint, required this.title, required this.icon ,required this.controller,this.readOnly = false});

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
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            prefixIcon: Icon(icon,color: mainColor),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14
            )
          ),
          onTap: readOnly?(){
            _showDialog(
              CupertinoDatePicker(
                initialDateTime: AuthGETXController.to.date.value,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime newDate) {
                  AuthGETXController.to.changeDate(newDate);
                  controller.text = '${newDate.month}-${newDate.day}-${newDate.year}';
                },
              ),
              context
            );
          }:null,
        ),
        getSpace(h: 20.h)
      ],
    );
  }
  void _showDialog(Widget child,context) {
    showCupertinoModalPopup<void>(
        context: context,

        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r)
          ),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          // color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
}
