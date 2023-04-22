import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

SizedBox buildSelectedGender(BuildContext context, String title, IconData iconData, int value, onChange) {
  return SizedBox(
    width: MediaQuery.of(context).size.width/2.5,
    child: Row(
      children: [
        Radio(
          value: value,
          groupValue: 0,
          onChanged: (val) {},
          activeColor: mainColor,
          // fillColor: MaterialStateColor.resolveWith((states) => mainColor),
        ),
        Text(title,style: TextStyle(color: Colors.grey),).tr(),
        Spacer(),
        Icon(iconData,color: Colors.grey,)
      ],
    ),
  );
}

Stack buildStack() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      CircleAvatar(
        radius: 40.r,
        backgroundColor: Colors.grey[100],
        backgroundImage: NetworkImage(
            "https://icons-for-free.com/iconfiles/png/512/person-1324760545186718018.png"),
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
                onTap: () {},
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 16,
                )),
          ))
    ],
  );
}