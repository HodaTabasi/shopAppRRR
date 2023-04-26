
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/helper.dart';

class SettingItem extends StatelessWidget {
  late String title;
  late String iconName;
  late VoidCallback onClick;
  bool deleteArrows = false;
  SettingItem({required this.title, required this.iconName, required this.onClick,this.deleteArrows = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onClick,
          title: Text(
            "$title",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ).tr(),
          leading: SvgPicture.asset("assets/images/$iconName"),
          trailing: Visibility(
            visible: !deleteArrows,
              child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 20.r)),
        ),
        Divider(
          color: divider,
          thickness: 1,
        ),
        getSpace(h: 3.h),
      ],
    );
  }
}
