import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rrr_shop_app/controller/get/api_auth_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/screens/complete_profile/chooes_data.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../utils/constants.dart';

Widget buildSelectedGender(BuildContext context, String title,
    IconData iconData, int value, onChange) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2.5,
    child: Row(
      children: [
        Radio(
          value: value,
          groupValue: AuthGETXController.to.groupValue.value,
          onChanged: onChange,
          activeColor: mainColor,
          // fillColor: MaterialStateColor.resolveWith((states) => mainColor),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ).tr(),
        Spacer(),
        Icon(
          iconData,
          color: Colors.grey,
        )
      ],
    ),
  );
}

Stack buildStack(context) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
     APIGetxController.to.picke.value.path.isNotEmpty ?CircleAvatar(
        radius: 40.r,
        backgroundColor: Colors.grey[100],
        backgroundImage: FileImage(File(APIGetxController.to.picke.value.path)),
        // backgroundImage: NetworkImage(
        //     "https://icons-for-free.com/iconfiles/png/512/person-1324760545186718018.png"),
      ):CircleAvatar(
       radius: 40.r,
       backgroundColor: Colors.grey[100],
       // backgroundImage: FileImage(File(APIGetxController.to.pickedFile!.value!.path)),
       backgroundImage: NetworkImage("https://icons-for-free.com/iconfiles/png/512/person-1324760545186718018.png"),
     ),
      Positioned(
          bottom: 0.h,
          right: 120.w,
          child: Container(
            // width: 20,
            // height: 20,
            // margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
            ),
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      context: context,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.transparent)),
                      builder: (context) => SizedBox(
                        height: 150.h,
                        child: Chooes(),
                      ));
                },
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 16,
                )),
          ))
    ],
  );
}


